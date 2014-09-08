from django.db.models import Q
from tastypie.authorization import Authorization
from tastypie.serializers import Serializer


def is_checked_in(user_profile, env_obj, area_obj):
    from coresql.models import UserContext
    
    try:
        currentEnvironment = user_profile.context.currentEnvironment
        currentArea = user_profile.context.currentArea
                        
        ## if the user wants to access a resource on/of an area and he is checked in at that area
        if not area_obj is None:
            owner = area_obj.environment.owner 
            if (area_obj == currentArea) or (owner == user_profile and (currentEnvironment or currentArea)):
                return True
        
        ## alternatively he wants to access a resource of the environment in which he is checked in 
        elif not env_obj is None:
            owner = env_obj.owner
            if (env_obj == currentEnvironment) or (owner == user_profile and (currentEnvironment or currentArea)):  
                return True
        
        return False
    except UserContext.DoesNotExist:
        ## it means the user is not checked in anywhere
        return False


class AnnotationAuthorization(Authorization):
    def is_authorized(self, request, object=None):
        from client.api import EnvironmentResource, AreaResource, AnnotationResource
        from coresql.models import Environment, Area
        from coresql.utils import str2bool
        
        if hasattr(request, 'user') and not request.user.is_anonymous():
            env_obj = None
            area_obj = None
            
            
            if request.method.upper() == "GET":
                if 'environment' in request.GET:
                    try:
                        env_obj = Environment.objects.get(pk=request.GET['environment'])
                    except:
                        env_obj = None
                        
                if 'area' in request.GET:
                    try:
                        area_obj = Area.objects.get(pk=request.GET['area'])
                    except:
                        area_obj = None
                
                ''' For GET requests we check if there is a virtual access flag set in the request.
                    If the flag is not set, the default behavior is to assume physical check-in '''
                if 'virtual' in request.GET:
                    try:
                        virtual = str2bool(request.GET['virtual'])
                        if virtual and (area_obj or env_obj):
                            ''' if the virtual flag is set to TRUE, then allow access, otherwise, check that 
                            the user is actually checked-in where he says he is '''
                            return True
                    except ValueError:
                        return False
                    
             
            elif request.method.upper() == "POST":
                ''' for the rest of the methods check that the requesting user is actually checked in '''
                serdes = Serializer()
                deserialized = None
                try:
                    deserialized = serdes.deserialize(request.raw_post_data, format=request.META.get('CONTENT_TYPE', 'application/json'))
                except Exception:
                    return False
                    
                if deserialized is None:
                    return False
                    
                if 'environment' in deserialized:
                    try:
                        #env_pk = int(deserialized['env'])
                        env_obj = EnvironmentResource().get_via_uri(deserialized['environment'], request=request) 
                    except:
                        env_obj = None
                            
                if 'area' in deserialized:
                    try:
                        #area_pk = int(deserialized['area'])
                        area_obj = AreaResource().get_via_uri(deserialized['area'], request=request)
                    except:
                        area_obj = None
            
            
            elif request.method.upper() in ["DELETE", "PUT"]:
                ann_res_uri = request.path
                try:
                    ann_obj = AnnotationResource().get_via_uri(ann_res_uri, request=request)
                    env_obj = ann_obj.environment
                    area_obj = ann_obj.area
                    
                    #print "[authorization] env_obj: ", env_obj
                    #print "[authorization] area_obj: ", area_obj
                except Exception:
                    #print "[authorization] exception in getting annotation resource for deletion: ", ex
                    env_obj = None
                    area_obj = None
            
            user_profile = request.user.get_profile()   ## will be an instance of UserProfile => available context
            return is_checked_in(user_profile, env_obj, area_obj)
        
        return False
            
    
    def apply_limits(self, request, object_list):
        """
        apply restrictions to PUT and DELETE in the following manner:
        only the owner of the environment and authenticated senders of the comment
        can modify or delete a comment 
        """
        
        if request and (request.method.upper() in ["PUT", "DELETE"]):
            if hasattr(request, 'user') and not request.user.is_anonymous():
                user = request.user.get_profile()
                
                q1 = Q(user = user)
                q2 = Q(area__environment__owner = user)
                q3 = Q(environment__owner = user)
                
                object_list = object_list.filter(q1 | q2 | q3)
                
                #print "[authorization] filtered object_list: ", object_list
                return object_list
            else:
                return object_list.none()
        
        return object_list
    
    
    
class UserAuthorization(Authorization):
    
    
    # checks whether the user is authorized to update data in DB or to retrieve data
    def is_authorized(self, request, object=None):
        from client.api import UserResource
        
        # to check if the user is authorized to update information
        # we retrieve the profile based on the request's URI and we compare with the profile from the filed of the request
        if request.method.upper() == "PUT":

            if hasattr(request, 'user') and not request.user.is_anonymous():
                user_res_uri = request.path
                user_obj = None
                try:
                    user_obj = UserResource().get_via_uri(user_res_uri, request=request)
                    #print "[User authorization] user_obj: ", user_obj
                except Exception:
                    #print "[User authorization] exception in getting user resource for update: ", ex
                    user_obj = None
                    
                # now test for equality between request.user and user_obj
                if request.user.get_profile() == user_obj:
                    return True
                
        #  the user is always authorized to retrieve data ( to read)       
        elif request.method.upper() == "GET":
            return True
        
        return False


class FeatureAuthorization(Authorization):
    def is_authorized(self, request, object=None):
        from client.api import FeatureResource
        from coresql.models import Environment, Area
        from coresql.utils import str2bool
        
        if request.method.upper() == "GET":
            if hasattr(request, 'user') and not request.user.is_anonymous():
                env_obj = None
                area_obj = None
                
                ''' try first to obtain info from the feature_obj itself if this is a detail request '''
                feature_res_uri = request.path
                try:
                    feature_obj = FeatureResource().get_via_uri(feature_res_uri, request=request)
                    env_obj = feature_obj.environment
                    area_obj = feature_obj.area
                except Exception:
                    env_obj = None
                    area_obj = None
                
                
                #print "FeatureAuthorization environment: ", env_obj
                #print "FeatureAuthorization area: ", area_obj
                
                if env_obj is None and area_obj is None:
                    ''' if not, try to retrieve environment and area objects from request filters ''' 
                    if 'environment' in request.GET:
                        try:
                            env_obj = Environment.objects.get(pk=request.GET['environment'])
                        except:
                            env_obj = None
                                
                    if 'area' in request.GET:
                        try:
                            area_obj = Area.objects.get(pk=request.GET['area'])
                        except:
                            area_obj = None
                
                
                ''' We check if there is a virtual access flag set in the request. 
                    If the flag is not set, the default behavior is to assume physical check-in '''
                if 'virtual' in request.GET:
                    try:
                        virtual = str2bool(request.GET['virtual'])
                        if virtual and (area_obj or env_obj):
                            ''' if the virtual flag is set to TRUE, then allow access, otherwise, check that 
                            the user is actually checked-in where he says he is '''
                            return True
                    except ValueError:
                        return False
                
                
                user_profile = request.user.get_profile()   ## will be an instance of UserProfile => available context
                return is_checked_in(user_profile, env_obj, area_obj)
            
        return False
    
  
class  EnvironmentAuthorization(Authorization):
    
             
    def read_list(self, object_list, bundle):
        # This assumes a ``QuerySet`` from ``ModelResource``.
        # return object_list.filter(user=bundle.request.user)
        # not implemented
       # return object_list.filter(environment = bundle.request.environment)
       
        #       owner = User.objects.get(email__iexact=email)
        # obtain the information about the environment with the same url as the one retrieved
        #environment_obj = EnvironmentResource().get_via_uri(parent, request=bundle.request)
        
        
        #if environment_obj.owner_id == owner.id:
        #    return False
        
        #owner_current = User.objects.get(name__iexact=bundle.request.user)
        return object_list.filter(owner = bundle.request.user.get_profile())
       
       
        #return object_list

    def read_detail(self, object_list, bundle):
        # Is the requested object owned by the user?
        # return bundle.obj.user == bundle.request.user
        # not implemented
        return True
    
    
   # def create_list(self, object_list, bundle):
        # Assuming they're auto-assigned to ``user``.
     #   object_list.filter(user=bundle.request.user)
        
     #   return object_list

    
    def create_detail(self, object_list, bundle):
       # from client.api import UserResource
       # from django.contrib.auth.models import User
       # owner_id = bundle.data['owner']
       # owner_obj = UserResource().get_via_uri(owner_id, request=bundle.request)
        
       #  email = bundle.request.META['HTTP_AUTHORIZATION']
       #  owner_email = User.objects.get(email__iexact=email)
        
        print bundle.request.COOKIES
        print bundle.request.session
        print bundle.request.user

        if bundle.request.user.is_anonymous():
           return False
        return True
        '''
        from coresql.models import Environment
        from django.contrib.auth.models import User
        from client.api import EnvironmentResource

        
        # get email associated with Authorization in the request's header 
        email = bundle.request.META['HTTP_AUTHORIZATION']
        # get the resource URL for the environment where the area is created
        parent = bundle.data['parent']
        
        
        #obtain information about the user with the email retriieved
        owner = User.objects.get(email__iexact=email)
        # obtain the information about the environment with the same url as the one retrieved
        environment_obj = EnvironmentResource().get_via_uri(parent, request=bundle.request)
        
        
        if environment_obj.owner_id == owner.id:
            return False
            '''
        return False

       
    
class AreaAuthorization(Authorization):

 
    def create_list(self, object_list, bundle):
        # Assuming they're auto-assigned to ``user``.
        return object_list
    
    
    def create_detail(self, object_list, bundle):
      
        print bundle.request.user
        if bundle.request.user.is_anonymous():
           return False
        return True
        
        '''
        from coresql.models import Environment
        from django.contrib.auth.models import User
        from client.api import EnvironmentResource

        
        # get email associated with Authorization in the request's header 
        email = bundle.request.META['HTTP_AUTHORIZATION']
        # get the resource URL for the environment where the area is created
        parent = bundle.data['parent']
        
        
        #obtain information about the user with the email retriieved
        owner = User.objects.get(email__iexact=email)
        # obtain the information about the environment with the same url as the one retrieved
        environment_obj = EnvironmentResource().get_via_uri(parent, request=bundle.request)
        
        
        if environment_obj.owner_id == owner.id:
            return False
        
        return True
        '''
        
        #import base64
        #if  bundle.request.user.is_anonymous():
        #    return False
        
        #base64.b64decode(credentials)
        #if credentials != "rahat":
        #    return False
        #if parent == "/envived/client/v2/resources/environment/2/":
        #    return True
        
        #return False
        
        #return True
        #user_profile = bundle.request.user.get_profile()
        #if user_profile.first_name != "idioata":
        #    return True
        #return False  

        #environments_from_owner = Environment.objects.filter(owner_id__iexact=owner.id)
        #for element in environments_from_owner:
                    
        #if owner.id == 150:
        #    return True
        #return False
    
         
    def read_list(self, object_list, bundle):
        # This assumes a ``QuerySet`` from ``ModelResource``.
        # return object_list.filter(user=bundle.request.user)
        # not implemented
       # return object_list.filter(environment = bundle.request.environment)
        return object_list

    def read_detail(self, object_list, bundle):
        # Is the requested object owned by the user?
        # return bundle.obj.user == bundle.request.user
        # not implemented
        return True
    

    '''
    def update_list(self, object_list, bundle):
        allowed = []

        # Since they may not all be saved, iterate over them.
        # not implemented
        for obj in object_list:
            if obj.user == bundle.request.user:
                allowed.append(obj)

        return allowed

    def update_detail(self, object_list, bundle):
        return bundle.obj.user == bundle.request.user

    def delete_list(self, object_list, bundle):
        # Sorry user, no deletes for you!
        raise Unauthorized("Sorry, no deletes.")

    def delete_detail(self, object_list, bundle):
        raise Unauthorized("Sorry, no deletes.")
    '''
