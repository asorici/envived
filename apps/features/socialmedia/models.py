from coresql.models import Feature
from django.db import models

####################################### Social Media Feature #############################################
class SocialMediaFeature(Feature):
    facebook_url = models.URLField(null = True, blank = True, max_length = 256)
    twitter_url = models.URLField(null = True, blank = True, max_length = 256)
    google_plus_url = models.URLField(null = True, blank = True, max_length = 256)
    internal_forum_url = models.URLField(null = True, blank = True, max_length = 256)
    
    def to_serializable(self, virtual = False, include_data = False):
        serialized_feature = super(SocialMediaFeature, self).to_serializable(virtual=virtual, include_data=include_data)
        
        if include_data:
            data_dict = {}
            
            if self.facebook_url:
                data_dict['facebook_url'] = self.facebook_url
                
            if self.twitter_url:
                data_dict['twitter_url'] = self.twitter_url
            
            if self.google_plus_url:
                data_dict['google_plus_url'] = self.google_plus_url
            
            if self.internal_forum_url:
                data_dict['internal_forum_url'] = self.internal_forum_url
            
            serialized_feature.update( {'data' : data_dict} )
        
        return serialized_feature
    
    
    def get_feature_data(self, virtual, filters):
        return self.to_serializable(virtual = virtual, include_data = True)['data']