from client.api import FeatureResource
from models import SocialMediaFeature

class SocialMediaResource(FeatureResource):
    
    class Meta(FeatureResource.Meta):
        queryset = SocialMediaFeature.objects.all()
        resource_name = SocialMediaFeature.CATEGORY