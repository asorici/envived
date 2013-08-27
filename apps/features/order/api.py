from tastypie import http
from tastypie.exceptions import ImmediateHttpResponse, NotFound
from django.core.exceptions import MultipleObjectsReturned, ObjectDoesNotExist
from client.api import FeatureResource, AnnotationResource, EnvironmentResource, AreaResource
from coresql.models import Annotation
from coresql.exceptions import AnnotationException, DuplicateAnnotationException
from models import OrderFeature, OrderAnnotation

class OrderResource(FeatureResource):
    
    class Meta(FeatureResource.Meta):
        queryset = OrderFeature.objects.all()
        resource_name = OrderFeature.CATEGORY
    

class OrderAnnotationResource(AnnotationResource):
    
    class Meta(AnnotationResource.Meta):
        queryset = OrderAnnotation.objects.all()
        resource_name = OrderAnnotation.CATEGORY
    
    
    """
    The following methods combined ensure that the environment=1&all=true query is handled successfully
    """
    def build_filters(self, filters = None):
        if filters is None:
            filters = {}
        
        orm_filters = super(OrderAnnotationResource, self).build_filters(filters)
        
        ## we now that there has to be a category in filters because of the validation
        categ_specific_filters = OrderAnnotation.get_extra_filters(filters)
        orm_filters.update(categ_specific_filters)
        
        return orm_filters
   
   
    def hydrate(self, bundle):
        ## get all data from bundle.data
        user = bundle.request.user.get_profile()
        
        category = OrderAnnotation.CATEGORY
        data = bundle.data['data']
        environment = None 
        area = None
        
        try:
            environment = EnvironmentResource().get_via_uri(bundle.data['environment'], request=bundle.request)
        except:
            environment = None
            
        try:
            area = AreaResource().get_via_uri(bundle.data['area'], request=bundle.request)
        except:
            area = None 
        
        try:
            bundle.obj = OrderAnnotation(user=user, environment=environment, area=area, category=category, data=data)
        except DuplicateAnnotationException, e:
            raise ImmediateHttpResponse(response=http.HttpForbidden(content=e.get_message()))
        except AnnotationException, ex:
            raise ImmediateHttpResponse(response=http.HttpBadRequest(content=ex.get_message()))
        
        return bundle
        
    
    def obj_create(self, bundle, **kwargs):
        """
        we use the obj_create method here so that the annotation mechanism may act as a temporary 
        (an Envived messaging mechanism should be built) message relay mechanism: 
        depending on the is_message flag contained within the annotation data, the annotation is
        either stored for persistancy or it is just forwarded as a GCM message to the appropriate receiver
        """
        
        """TODO: the things below have to be refactored, big time"""
        ## because of the AnnotationAuthorization class, request.user will have a profile
        user_profile = bundle.request.user.get_profile()
        updated_bundle = super(AnnotationResource, self).obj_create(bundle, user=user_profile)
        
        ## make notification for 'order' type annotations
        owner_profile = None
        if not bundle.obj.environment is None:
            owner_profile = bundle.obj.environment.owner
                            
        if not bundle.obj.area is None:
            owner_profile = bundle.obj.area.environment.owner
                            
        registration_id = None
        if owner_profile:
            registration_id = owner_profile.c2dm_id
            
        collapse_key = "feature_annotation"
        self._make_c2dm_notification(registration_id, collapse_key, updated_bundle, 
            params = {'type' : OrderFeature.NEW_REQUEST})
            
        return updated_bundle
    
    
    def obj_update(self, bundle, skip_errors=False, **kwargs):
        """
        Could be an intentional feature that the default obj_update treats DoesNotExist and MultipleObjectReturned
        as acceptable exceptions which get transformed into a CREATE operation.
        We don't want such a behavior. So we catch those exceptions and throw a BadRequest message
        """
            
        try:
            updated_bundle = super(AnnotationResource, self).obj_update(bundle, skip_errors=skip_errors, **kwargs)
            
            ## make notification for 'order' type annotations
            owner_profile = None
            if not bundle.obj.environment is None:
                owner_profile = bundle.obj.environment.owner
                    
            if not bundle.obj.area is None:
                owner_profile = bundle.obj.area.environment.owner
                    
            registration_id = None
            if owner_profile:
                registration_id = owner_profile.c2dm_id
                
            collapse_key = "feature_annotation"
               
            self._make_c2dm_notification(registration_id, collapse_key, updated_bundle, 
                                         params = {'type' : OrderFeature.NEW_REQUEST})
            
            return updated_bundle
        except NotFound, enf:
            raise ImmediateHttpResponse(response = http.HttpBadRequest(content=enf.get_message()))
        except MultipleObjectsReturned, emult:
            raise ImmediateHttpResponse(response = http.HttpBadRequest(content=emult.get_message()))
    
    
    def obj_delete(self, bundle, **kwargs):
        """
        Adapted version of the method in TastyPie's ModelResource
        to take into account the c2dm_notification need
        """
        annObj = bundle.obj

        if not hasattr(annObj, 'delete'):
            try:
                annObj = self.obj_get(bundle=bundle, **kwargs)
            except ObjectDoesNotExist:
                raise NotFound("A model instance matching the provided arguments could not be found.")
        
        receiver_profile = annObj.user
        registration_id = None
        if receiver_profile:
            registration_id = receiver_profile.c2dm_id
            
        params = {'type' : OrderFeature.RESOLVED_REQUEST,
                    'order_request': annObj.get_annotation_data()}
        self._make_c2dm_notification(registration_id, None, bundle, params = params)
        annObj.delete()
    
