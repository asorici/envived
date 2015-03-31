from client.api import ThingResource
from models import TemperatureThing

class TemperatureResource(ThingResource):
    class Meta(ThingResource.Meta):
        queryset = TemperatureThing.objects.all()
        resource_name = TemperatureThing.THING_TYPE
    