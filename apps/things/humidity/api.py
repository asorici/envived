from client.api import ThingResource 
from models import HumidityThing

class HumidityResource(ThingResource):
    class Meta(ThingResource.Meta):
        queryset = HumidityThing.objects.all()
        resource_name = HumidityThing.THING_TYPE
    