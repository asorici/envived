from django.conf.urls.defaults import patterns, include, url
#from tastypie.api import Api
from client.api import ClientApi
from client.api import EnvironmentResource, AreaResource, AnnotationResource,\
                        AnnouncementResource, HistoryResource, UserResource
#from client.views import checkin, checkout

v1_api = ClientApi(api_name='v1')
v1_api.register(EnvironmentResource())
v1_api.register(AreaResource())
v1_api.register(AnnotationResource())
v1_api.register(AnnouncementResource())
v1_api.register(HistoryResource())
v1_api.register(UserResource())

urlpatterns = patterns('',
    #url(r'^checkin/$', checkin, name="checkin"),
    #url(r'^checkout/$', checkout, name="checkout"),
    (r'', include(v1_api.urls)),
)