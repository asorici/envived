from coresql.models import Feature
from django.db import models

###################################### People Feature Classes ############################################
"""
This is mainly a hack so as to keep the programming model from the Android Application
"""
class PeopleFeature(Feature):
    description = models.TextField(null = True, blank = True)
    
    def to_serializable(self, virtual = False, include_data = False):
        serialized_feature = super(PeopleFeature, self).to_serializable(virtual=virtual, include_data=include_data)
        if include_data:
            serialized_feature.update( {'data' : self.description} )
        
        return serialized_feature
