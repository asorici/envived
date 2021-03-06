from tastypie import http
from tastypie.exceptions import ImmediateHttpResponse
from client.api import FeatureResource, AnnotationResource, EnvironmentResource, AreaResource
from coresql.exceptions import AnnotationException, DuplicateAnnotationException
from models import BoothDescriptionFeature, BoothDescriptionAnnotation ,\
    BoothProductVoteAnnotation

class BoothDescriptionResource(FeatureResource):
    class Meta(FeatureResource.Meta):
        queryset = BoothDescriptionFeature.objects.all()
        resource_name = BoothDescriptionFeature.CATEGORY
    


class BoothDescriptionAnnotationResource(AnnotationResource):
    
    class Meta(AnnotationResource.Meta):
        queryset = BoothDescriptionAnnotation.objects.all()
        resource_name = BoothDescriptionAnnotation.CATEGORY
    
    
    """
    The following methods combined ensure that the environment=1&all=true query is handled successfully
    """
    def build_filters(self, filters = None):
        if filters is None:
            filters = {}
        
        orm_filters = super(BoothDescriptionAnnotationResource, self).build_filters(filters)
        
        ## we now that there has to be a category in filters because of the validation
        categ_specific_filters = BoothDescriptionAnnotation.get_extra_filters(filters)
        orm_filters.update(categ_specific_filters)
        
        return orm_filters
   
   
    def hydrate(self, bundle):
        ## get all data from bundle.data
        user = bundle.request.user.get_profile()
        
        category = BoothDescriptionAnnotation.CATEGORY
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
            bundle.obj = BoothDescriptionAnnotation(user=user, environment=environment, area=area, category=category, data=data)
        except DuplicateAnnotationException, e:
            raise ImmediateHttpResponse(response=http.HttpForbidden(content=e.get_message()))
        except AnnotationException, ex:
            raise ImmediateHttpResponse(response=http.HttpBadRequest(content=ex.get_message()))
        
        return bundle
        
    

class ProductVoteAnnotationResource(AnnotationResource):
    
    class Meta(AnnotationResource.Meta):
        queryset = BoothProductVoteAnnotation.objects.all()
        resource_name = BoothProductVoteAnnotation.CATEGORY
    
   
    def hydrate(self, bundle):
        ## get all data from bundle.data
        user = bundle.request.user.get_profile()
        
        category = BoothProductVoteAnnotation.CATEGORY
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
            bundle.obj = BoothProductVoteAnnotation(user=user, environment=environment, area=area, category=category, data=data)
        except DuplicateAnnotationException, e:
            raise ImmediateHttpResponse(response=http.HttpForbidden(content=e.get_message()))
        except AnnotationException, ex:
            raise ImmediateHttpResponse(response=http.HttpBadRequest(content=ex.get_message()))
        
        return bundle