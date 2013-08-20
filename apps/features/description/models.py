from django.db import models
from coresql.models import Feature, Annotation
from coresql.exceptions import AnnotationException


####################################### Description Feature Class #############################################
class DescriptionFeature(Feature):
    description = models.TextField(null = True, blank = True)
    newest_info = models.TextField(null = True, blank = True)
    img_url = models.URLField(null = True, blank = True, max_length = 256)
    
    
    def to_serializable(self, virtual = False, include_data = False):
        serialized_feature = super(DescriptionFeature, self).to_serializable(virtual=virtual, include_data=include_data)
        
        if include_data:
            data_dict = {}
            
            if self.description:
                data_dict['description'] = self.description
                
            if self.newest_info:
                data_dict['newest_info'] = self.newest_info
            
            if self.img_url:
                data_dict['img_url'] = self.img_url
            
            serialized_feature.update( {'data' : data_dict} )
        
        return serialized_feature
    
    
    def get_feature_data(self, virtual, filters):
        return self.to_serializable(virtual = virtual, include_data = True)['data']



######################################## Description Annotation Class ##########################################
class DescriptionAnnotation(Annotation):
    text = models.TextField()
    
    def __init__(self, *args, **kwargs):
        data = kwargs.pop('data', None)
        
        super(DescriptionAnnotation, self).__init__(*args, **kwargs)
        
        if not data is None:
            if 'text' in data:
                self.text = data['text']
            else:
                raise AnnotationException("Description Annotation missing text")
    
    def get_annotation_data(self):
        return { 'text' : self.text }
    
    @classmethod
    def is_annotation_for(cls, category, annotation_data):
        return category == Annotation.DESCRIPTION