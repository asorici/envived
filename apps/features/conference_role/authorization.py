'''
Created on May 11, 2014

@author: alex
'''
from tastypie.authorization import Authorization
from tastypie.serializers import Serializer
from tastypie.exceptions import Unauthorized
from client.authorization import is_checked_in


class ConferenceRoleAuthorization(Authorization):
    
    def read_detail(self, object_list, bundle):
        if hasattr(bundle.request, 'user') and not bundle.request.user.is_anonymous():
            ''' User must be checked in at environment for which this feature is defined '''
            confrole_obj = bundle.obj
            if confrole_obj is None:
                raise Unauthorized("Non-existent conference role resource access.")
                
            env_obj = confrole_obj.environment
            area_obj = confrole_obj.area
            
            user_profile = bundle.request.user.get_profile()  # # will be an instance of UserProfile => available context
            if not is_checked_in(user_profile, env_obj, area_obj):
                raise Unauthorized("Users not checked-in cannot access their conference role.")
            
            return True
            
        raise Unauthorized("Anonymous users cannot access the conference role resource")
    
    
    def update_detail(self, object_list, bundle):
        from features.conference_role.models import ChairRoleCredential
        
        if hasattr(bundle.request, 'user') and not bundle.request.user.is_anonymous():
            ''' User must be checked in at environment for which this feature is defined '''
            confrole_obj = bundle.obj
            if confrole_obj is None:
                raise Unauthorized("Non-existent conference role resource access.")
            
            env_obj = confrole_obj.environment
            area_obj = confrole_obj.area
            
            user_profile = bundle.request.user.get_profile()  # # will be an instance of UserProfile => available context
            if not is_checked_in(user_profile, env_obj, area_obj):
                raise Unauthorized("Users not checked-in cannot delete their conference role.")
            
            ''' Deserialize data payload and check if trying to set role to `session_chair` value. 
                In that case, a chair_password is required '''
            serdes = Serializer()
            deserialized = None
            
            try:
                deserialized = serdes.deserialize(bundle.request.body, format=bundle.request.META.get('CONTENT_TYPE', 'application/json'))
            except Exception:
                raise Unauthorized("Update data unreadable.")
                
            if deserialized is None:
                raise Unauthorized("Empty update data not allowed.")
            
            if "role" in deserialized and deserialized['role'] == "session_chair":
                print "Attempting to become session_chair",
                
                chair_password = deserialized.get("chair_password", None)
                if not chair_password:
                    raise Unauthorized("Cannot alter conference role to `session_chair` without credentials.")
                
                ''' check with the chair password recorded for this user '''
                try:
                    chair = ChairRoleCredential.objects.get(user_profile=user_profile)
                    if not chair.check_password(chair_password):
                        raise Unauthorized("Incorrect credentials for attempt to set `session_chair` conference role.")
                except Exception, ex:
                    print ex
                    raise Unauthorized("User is not listed as a `session_chair`.")
            
            return True
        
        raise Unauthorized("Anonymous users cannot access the conference role resource")
        
