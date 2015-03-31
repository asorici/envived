from tastypie import http
from tastypie.exceptions import ImmediateHttpResponse
from client.api import FeatureResource, AnnotationResource, EnvironmentResource, AreaResource
from coresql.exceptions import AnnotationException, DuplicateAnnotationException
from models import ProgramFeature, ProgramAnnotation, Presentation
from django.db.models import F
from datetime import datetime

class ProgramResource(FeatureResource):
    
    class Meta(FeatureResource.Meta):
        queryset = ProgramFeature.objects.all()
        resource_name = ProgramFeature.CATEGORY
        
        fields = []
        
        detail_allowed_methods = ["get", "put"]
        list_allowed_methods = []
        
        
    def obj_update(self, bundle, skip_errors=False, **kwargs):
        from tastypie.serializers import Serializer
        from models import ProgramFeature
        
        serdes = Serializer()
        deserialized = None
        
        try:
            deserialized = serdes.deserialize(bundle.request.body, format=bundle.request.META.get('CONTENT_TYPE', 'application/json'))
        except Exception:
            deserialized = None
        
        if deserialized is None:
            return ImmediateHttpResponse(response = http.HttpBadRequest('Empty update data'))
        
        time_difference = datetime.strptime(deserialized['new_end_time'], "%Y-%m-%d %H:%M:%S") - datetime.strptime(deserialized['old_end_time'], "%Y-%m-%d %H:%M:%S")
        
        Presentation.objects.filter(startTime__gte=deserialized['old_end_time']).update(startTime=F('startTime') + time_difference)
        Presentation.objects.filter(startTime__gte=deserialized['old_end_time']).update(endTime=F('endTime') + time_difference)
        
        later_presentations = Presentation.objects.filter(startTime__gte=deserialized['old_end_time'])
        
        changed_presentation = Presentation.objects.get(startTime=deserialized['old_start_time'])
        changed_presentation.startTime = deserialized['new_start_time']
        changed_presentation.endTime = deserialized['new_end_time']
        changed_presentation.save()
        

class ProgramAnnotationResource(AnnotationResource):
    
    class Meta(AnnotationResource.Meta):
        queryset = ProgramAnnotation.objects.all()
        resource_name = ProgramAnnotation.CATEGORY
    
    
    """
    The following methods combined ensure that the environment=1&all=true query is handled successfully
    """
    def build_filters(self, filters = None):
        if filters is None:
            filters = {}
        
        orm_filters = super(ProgramAnnotationResource, self).build_filters(filters)
        
        ## we now that there has to be a category in filters because of the validation
        categ_specific_filters = ProgramAnnotation.get_extra_filters(filters)
        orm_filters.update(categ_specific_filters)
        
        return orm_filters
   
   
    def hydrate(self, bundle):
        ## get all data from bundle.data
        user = bundle.request.user.get_profile()
        
        category = ProgramAnnotation.CATEGORY
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
            bundle.obj = ProgramAnnotation(user=user, environment=environment, area=area, category=category, data=data)
        except DuplicateAnnotationException, e:
            raise ImmediateHttpResponse(response=http.HttpForbidden(content=e.get_message()))
        except AnnotationException, ex:
            raise ImmediateHttpResponse(response=http.HttpBadRequest(content=ex.get_message()))
        
        return bundle
