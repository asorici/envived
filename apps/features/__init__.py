#
#Import all api.py modules defined in the applications contained in the features package
#

import imp, os
from path import path
current_dir_path = path(__file__).abspath().dirname()

for api_mod_path in current_dir_path.walk(pattern="api.py", errors="ignore"):
    api_mod_name = ".".join(current_dir_path.dirname().relpathto(api_mod_path).stripext().split(os.path.sep)) 
    try:
        __import__(api_mod_name)
    except ImportError, e:
        print "Module %s not found." %(api_mod_name), e
        
FEATURE_UPDATE_TYPE= "envived_app_update"
FEATURE_MESSAGE_TYPE= "envived_app_message"
FEATURE_RETRIEVE_CONTENT_LABEL = "retrieve_content"

def send_feature_update_message(environment=None, area=None, feature=None, receivers='all'):
    """
    The function sends a feature update message for the feature `feature'.
    This `receivers' are either a list of User IDs, or the keyword `all' (by default).
    For the `all' case, we consider all users checked in at the given `area' (if not None), otherwise
    at the given `environment'.
    """
    import redis
    from django.conf import settings
    from datetime import datetime
    from pytz import timezone
    from coresql.models import UserContext
    from client.api import EnvironmentResource, AreaResource, FeatureResource
    
    redis_server = redis.Redis(host=settings.REDIS_HOST, port=settings.REDIS_PORT, db=settings.REDIS_DB)
    
    if feature is None:
        return
    
    if environment is None and area is None and receivers == 'all':
        return
    
    if receivers == 'all':
        utc_tz = timezone("UTC")
        timestamp = datetime.now(utc_tz)
        timestamp_str = timestamp.strftime("%Y-%m-%dT%H:%M:%S")
        
        '''build update message content'''
        feature_categ = feature.category
        update_type = FEATURE_RETRIEVE_CONTENT_LABEL
        
        ## get the feature resource URI
        feature_resource_class = feature.__class__.get_resource_class()
        feature_resource_uri = feature_resource_class().get_resource_uri(feature)
        
        ## get the location URI
        location_uri = None
        if area is not None:
            location_uri = AreaResource().get_resource_uri(area)
        elif environment is not None:
            location_uri = EnvironmentResource().get_resource_uri(environment)
        
        update_message = {'type' : FEATURE_UPDATE_TYPE,
                          'timestamp': timestamp_str,
                          'content': {'feature' : feature_categ.encode("utf8"),
                                      'location_uri' : location_uri,
                                      'resource_uri' : feature_resource_uri,
                                      'params': [{'name': 'type',
                                                  'value': update_type}
                                                 ] 
                                      }
                        } 
        
        '''send it to required uses'''
        if isinstance(receivers, basestring) and receivers == 'all':
            user_contexts = None
            
            if area is not None:
                user_contexts = UserContext.objects.filter(currentArea=area).order_by('user').distinct()
                
            elif environment is not None:
                user_contexts = UserContext.objects.filter(currentEnvironment=environment).order_by('user').distinct()
            
            for uc in user_contexts:
                user_id = uc.user.user.id
                   
                ## send message on the user channel
                channel_name = str(user_id)
                redis_server.publish(channel_name, update_message)
                    
    elif isinstance(receivers, list):
        '''receivers is already a list of user IDs for which to send the feature update notification'''
        for user_id in receivers:
            ## send message on the user channel
            channel_name = str(user_id)
            redis_server.publish(channel_name, update_message)
    