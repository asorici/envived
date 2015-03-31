from django.db import models
from coresql.models import Thing

######################################## HumidityThing Class #########################################
class HumidityThing(Thing):
    THING_TYPE = "humidity"
    
    sensed_info = models.TextField(null = True, blank = True)
    
    def to_serializable(self, request = None, virtual = False, include_data = False):
        serialized_thing = super(HumidityThing, self).to_serializable(request = request, virtual=virtual, include_data=include_data)
        
        if include_data:
            data_dict = { 'id' : self.id }
            
            if self.sensed_info:
                data_dict['sensed_info'] = self.sensed_info
                
            serialized_thing.update( {'data' : data_dict} )
        
        return serialized_thing
    
    
    @classmethod
    def get_resource_class(cls):
        from api import HumidityResource
        return HumidityResource
        
