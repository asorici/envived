from client.api import FeatureResource
from models import PeopleFeature

class PeopleResource(FeatureResource):
    
    class Meta(FeatureResource.Meta):
        queryset = PeopleFeature.objects.all()
        resource_name = PeopleFeature.CATEGORY