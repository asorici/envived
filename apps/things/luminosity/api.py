from tastypie import http
from tastypie.exceptions import ImmediateHttpResponse
from client.api import ThingResource
from models import LuminosityThing

class LuminosityResource(ThingResource):
    class Meta(ThingResource.Meta):
        queryset = LuminosityThing.objects.all()
        resource_name = LuminosityThing.THING_TYPE
    

