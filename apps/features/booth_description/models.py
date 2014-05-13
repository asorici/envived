from django.db import models
from coresql.models import Annotation, Feature
from coresql.exceptions import AnnotationException, DuplicateAnnotationException

######################################## BoothDescriptionFeature Class #########################################
class BoothDescriptionFeature(Feature):
    CATEGORY = "booth_description"
    
    ## contact details
    description = models.TextField(null = True, blank = True)
    image_url = models.URLField(null = True, blank = True, max_length = 256)
    
    contact_email = models.EmailField(null = True, blank = True, max_length = 128)
    contact_website = models.URLField(null = True, blank = True, max_length = 256)
    
    def to_serializable(self, request = None, virtual = False, include_data = False):
        serialized_feature = super(BoothDescriptionFeature, self).to_serializable(request = request, virtual=virtual, include_data=include_data)
        
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
            
            if self.image_url:
                data_dict['image_url'] = self.image_url
            
            if self.contact_email:
                data_dict['contact_email'] = self.contact_email
                
            if self.contact_website:
                data_dict['contact_website'] = self.contact_website
            
            
            product_list = []
            for product in self.products.all():
                product_dict = {'product_id' : product.id,
                                'product_name' : product.name,
                                'product_description' : product.description}
                
                if product.image_url:
                    product_dict['product_image_url'] = product.image_url
                
                if product.website_url:
                    product_dict['product_website_url'] = product.website_url
                
                if product.votes:
                    product_dict['product_votes'] = product.votes.count()
                else:
                    product_dict['product_votes'] = 0
                    
                product_list.append(product_dict)
            
            if product_list:
                data_dict['products'] = product_list
            
            serialized_feature.update( {'data' : data_dict} )
        
        return serialized_feature
    
    
    @classmethod
    def get_resource_class(cls):
        from api import BoothDescriptionResource
        return BoothDescriptionResource
        


###################################### BoothDescriptionAnnotation Class ########################################
class BoothDescriptionAnnotation(Annotation):
    CATEGORY = "booth_description_ann"
    
    BOOTH_DESCRIPTION = "booth_description"
    PRODUCT_DESCRIPTION = "product_description"
    
    TOPIC_CHOICES = (
        (BOOTH_DESCRIPTION, BOOTH_DESCRIPTION), 
        (PRODUCT_DESCRIPTION, PRODUCT_DESCRIPTION)
    )
    
    topic_type = models.CharField(max_length = 32, choices = TOPIC_CHOICES, default="booth_description")
    topic_title = models.CharField(max_length = 128)
    text = models.TextField()
    
    booth_product = models.ForeignKey('BoothProduct', null = True, blank = True, related_name = 'annotations') 
    
    def __init__(self, *args, **kwargs):
        data = kwargs.pop('data', None)
        
        super(BoothDescriptionAnnotation, self).__init__(*args, **kwargs)
        
        if not data is None:
            if 'text' in data and 'topic_type' in data and 'topic_title' in data:
                self.text = data['text']
                self.topic_type = data['topic_type']
                self.topic_title = data['topic_title']
                
                if self.topic_type == BoothDescriptionAnnotation.PRODUCT_DESCRIPTION and 'product_id' in data:
                    try:
                        product_id = data['product_id']
                        self.booth_product = BoothProduct.objects.get(id = product_id)
                    except BoothProduct.DoesNotExist:
                        raise AnnotationException("BoothDescripionAnnotation missing valid product product_id")
            else:
                raise AnnotationException("Booth Description Annotation missing text, topic_type or topic_title")
                
    
    
    def get_annotation_data(self):
        data_dict = {'topic_type' : self.topic_type,
                     'topic_title' : self.topic_title,
                     'text' : self.text 
                    }
        
        if not self.booth_product is None:
            data_dict['product_id'] = self.booth_product.id
        
        return data_dict
    
    
    @classmethod
    def get_extra_filters(cls, filters):
        specific_filters = {}
        
        ## just this single case for now
        if "product_id" in filters:
            try:
                product = BoothProduct.objects.get(id = filters['product_id'])
                specific_filters['id__in'] = [ann.id for ann in BoothDescriptionAnnotation.objects.filter(product = product)]
            except BoothProduct.DoesNotExist:
                pass
            except Exception:
                pass 
        
        return specific_filters
    
    @classmethod
    def get_resource_class(cls):
        from api import BoothDescriptionAnnotationResource
        return BoothDescriptionAnnotationResource



class BoothProductVoteAnnotation(Annotation):
    CATEGORY = "booth_product_vote_ann"
    
    booth_product = models.ForeignKey('BoothProduct', related_name = 'votes') 
    
    def __init__(self, *args, **kwargs):
        data = kwargs.pop('data', None)
        
        super(BoothProductVoteAnnotation, self).__init__(*args, **kwargs)
        
        if not data is None:
            if 'product_id' in data:
                try:
                    product_id = data['product_id']
                    self.booth_product = BoothProduct.objects.get(id = product_id)
                    
                    ''' annotation users can be NULL if they were anonymous and quit. Herein lies a potential error
                    since a user who logs in as anonymous, votes, quits anonymous and logs back in as anonymous can
                    vote several times for the same project. But as the feature is not essential, we're gonna let it slide.
                    A fix would be to only allow actual logged in users to vote '''
                    existing_vote_annotations = filter(lambda ann: not ann.user is None, self.booth_product.votes.all())
                    
                    if self.booth_product and self.user.id in [ann.user.id for ann in existing_vote_annotations]:
                        raise DuplicateAnnotationException()
                    
                except BoothProduct.DoesNotExist:
                    raise AnnotationException(msg="Booth Product Vote Annotation missing valid product product_id")
            else:
                raise AnnotationException(msg="Booth Product Vote Annotation missing product_id value")
                
    
    
    def get_annotation_data(self):
        data_dict = { 'product_id' : self.booth_product.id }
        if not self.booth_product.votes is None:
            data_dict['product_votes'] = self.booth_product.votes.count()
        
        return data_dict
    
    
    @classmethod
    def get_extra_filters(cls, filters):
        specific_filters = {}
        
        ## just this single case for now
        if "product_id" in filters:
            try:
                product = BoothProduct.objects.get(id = filters['product_id'])
                specific_filters['id__in'] = [ann.id for ann in BoothProductVoteAnnotation.objects.filter(booth_product = product)]
            except BoothProduct.DoesNotExist:
                pass
            except Exception:
                pass 
        
        return specific_filters
    
    
    @classmethod
    def get_resource_class(cls):
        from api import BoothProductVoteAnnotation
        return BoothProductVoteAnnotation


############################################# BoothProduct Class ###############################################
class BoothProduct(models.Model):
    booth = models.ForeignKey(BoothDescriptionFeature, related_name = "products")
    name = models.CharField(max_length = 256)
    description = models.TextField()
    
    image_url = models.URLField(null = True, blank = True, max_length = 256)
    website_url = models.URLField(null = True, blank = True, max_length = 256)
    
    def __unicode__(self):
        return self.name + " @ " + str(self.booth)
