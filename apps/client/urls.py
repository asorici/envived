from django.conf.urls import patterns, include
from client.api import ClientApi
from client.api import EnvironmentResource, AreaResource, FeatureResource, ThingResource, AnnotationResource,\
        UserResource, HistoryResource, EnvrionmentContextResource

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

# v2_api.register(FeatureResource())         # need no longer be registered as a prime resource
# v2_api.register(AnnotationResource())      # need no longer be registered as a prime resource
# v2_api.register(AnnouncementResource())    # will probably be registered on a per feature basis as well
        
## add all per feature resource classes to the api
for feat_res_cls in FeatureResource.__subclasses__():
    v2_api.register(feat_res_cls())

## add all per things resource classes to the api
for thing_res_cls in ThingResource.__subclasses__():
    v2_api.register(thing_res_cls())
    
## add all per feature annotation classes to the api
for ann_res_cls in AnnotationResource.__subclasses__():
    v2_api.register(ann_res_cls())
    
urlpatterns = patterns('',
    (r'', include(v2_api.urls)),
)
