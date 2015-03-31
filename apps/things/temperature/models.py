from django.db import models
from coresql.models import Thing

######################################## TemperatureThing Class #########################################
class TemperatureThing(Thing):
    THING_TYPE = "temperature"
    
    ## contact details
    description = models.TextField(null = True, blank = True)
    image_url = models.URLField(null = True, blank = True, max_length = 256)
    
    def to_serializable(self, request = None, virtual = False, include_data = False):
        serialized_thing = super(TemperatureThing, self).to_serializable(request = request, virtual=virtual, include_data=include_data)
        
        if include_data:
            data_dict = { 'id' : self.id }
            
            if self.description:
                data_dict['description'] = self.description
            
            ''' take tags from location to which this feature is attached '''
            location = None
            if not self.environment is None:
                location = self.environment
            elif not self.area is None:
                location = self.area
                
            if location and location.tags:
                data_dict['tags'] = location.tags.getList()

            serialized_thing.update( {'data' : data_dict} )
        
        return serialized_thing
    
    
    @classmethod
    def get_resource_class(cls):
        from api import TemperatureResource
        return TemperatureResource
        


