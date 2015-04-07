from django.conf.urls import patterns, include
from client.api import ClientApi
from client.api import EnvironmentResource, AreaResource, FeatureResource, AnnotationResource,\
        UserResource, HistoryResource, EnvrionmentContextResource, ThingResource, ThingPropertyResource

"""
v1_api = ClientApi(api_name='v1')
v1_api.register(EnvironmentResource())
v1_api.register(AreaResource())
v1_api.register(FeatureResource())
v1_api.register(ThingResource())
v1_api.register(AnnotationResource())
v1_api.register(AnnouncementResource())
v1_api.register(HistoryResource())
v1_api.register(UserResource())
v1_api.register(EnvrionmentContextResource())
"""

v2_api = ClientApi(api_name='v2')
v2_api.register(EnvironmentResource())
v2_api.register(AreaResource())
v2_api.register(UserResource())
v2_api.register(HistoryResource())
v2_api.register(EnvrionmentContextResource())
v2_api.register(FeatureResource())
v2_api.register(ThingResource())
v2_api.register(ThingPropertyResource())

# v2_api.register(FeatureResource())         # need no longer be registered as a prime resource
# v2_api.register(AnnotationResource())      # need no longer be registered as a prime resource
# v2_api.register(AnnouncementResource())    # will probably be registered on a per feature basis as well
        
## ==== Add all per feature resource and annotation classes to the api
## To do this we must first import all api.py modules defined in the applications contained in the features package
import os
from path import path

feature_dir_path = path(__file__).abspath().dirname().dirname() / 'features'  
for api_mod_path in feature_dir_path.walk(pattern="api.py", errors="ignore"):
    api_mod_name = ".".join(feature_dir_path.dirname().relpathto(api_mod_path).stripext().split(os.path.sep)) 
    try:
        __import__(api_mod_name)
        #print "Features : Imported ", api_mod_name
    except ImportError, e:
        print "Module %s not found." %(api_mod_name), e

for feat_res_cls in FeatureResource.__subclasses__():
    v2_api.register(feat_res_cls())

for ann_res_cls in AnnotationResource.__subclasses__():
    v2_api.register(ann_res_cls())


urlpatterns = patterns('',
    (r'', include(v2_api.urls)),
)


## ==== Add all per things resource classes to the api
## To do this we must first import all api.py modules defined in the applications contained in the features package
# things_dir_path = path(__file__).abspath().dirname().dirname() / 'things'
# for api_mod_path in things_dir_path.walk(pattern="api.py", errors="ignore"):
#     api_mod_name = ".".join(things_dir_path.dirname().relpathto(api_mod_path).stripext().split(os.path.sep)) 
#     try:
#         __import__(api_mod_name)
#         #print "Things : Imported ", api_mod_name
#     except ImportError, e:
#         print "Module %s not found." %(api_mod_name), e
# 
# 
# for thing_res_cls in ThingResource.__subclasses__():
#     v2_api.register(thing_res_cls())