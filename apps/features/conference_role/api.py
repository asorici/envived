'''
Created on May 9, 2014

@author: alex
'''
from django.core.exceptions import MultipleObjectsReturned
from tastypie import http
from tastypie.exceptions import ImmediateHttpResponse, NotFound
from client.api import FeatureResource
from models import ConferenceRoleFeature
from authorization import ConferenceRoleAuthorization

class ConferenceRoleResource(FeatureResource):
    
    class Meta(FeatureResource.Meta):
        queryset = ConferenceRoleFeature.objects.all()
        resource_name = ConferenceRoleFeature.CATEGORY
        
        detail_allowed_methods = ["get", "put"]
        list_allowed_methods = []
        authorization = ConferenceRoleAuthorization()
    
    
    def obj_update(self, bundle, skip_errors=False, **kwargs):
        """
        Could be an intentional action that the default obj_update treats DoesNotExist and MultipleObjectReturned
        as acceptable exceptions which get transformed into a CREATE operation.
        We don't want such a behavior. So we catch does exceptions and throw an BadRequest message
        """ 
        from tastypie.serializers import Serializer
        from models import ConferenceRole
        
        try:
            serdes = Serializer()
            deserialized = None
            try:
                deserialized = serdes.deserialize(bundle.request.body, format=bundle.request.META.get('CONTENT_TYPE', 'application/json'))
            except Exception:
                deserialized = None
            
            if deserialized is None:
                return ImmediateHttpResponse(response = http.HttpBadRequest('Empty update data'))
            
            ''' Check for the existence of the role parameter in the deserialized data '''
            if not 'role' in deserialized: 
                return ImmediateHttpResponse(response = http.HttpBadRequest('Missing conference role data'))
            
            if not deserialized['role'] in ConferenceRole.ROLE_TYPES:
                return ImmediateHttpResponse(response = http.HttpBadRequest('Conference role data not in accepted list'))
            
            updated_bundle = super(ConferenceRoleResource, self).obj_update(bundle, skip_errors=skip_errors, **kwargs)
            
            # create ConferenceRole entry
            user_profile = bundle.request.user.get_profile()
            role = deserialized['role']
            
            confrole = ConferenceRole(conference = updated_bundle.obj, user_profile = user_profile, role = role)
            confrole.save()
            
            return updated_bundle
            
        except (NotFound, MultipleObjectsReturned), ex:
            raise ImmediateHttpResponse(response = http.HttpBadRequest())
    