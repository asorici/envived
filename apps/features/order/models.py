from django.db import models
from django.db.models.signals import post_save
from coresql.db import fields
from coresql.models import Feature, Annotation


########################################### OrderFeature Class #################################################
class OrderFeature(Feature):
    NEW_REQUEST         = "new_request"
    RESOLVED_REQUEST    = "resolved_request"
    
    NEW_ORDER           = "new_order"
    CALL_WAITER         = "call_waiter"
    CALL_CHECK          = "call_check"
    UPDATE_CONTENT      = "update_content"
    UPDATE_STRUCTURE    = "update_structure"
    
    """
    For now replicates the old functionality and data model - a single level: category with items
    """
    description = models.TextField(null = True, blank = True)
    
    def to_serializable(self, virtual = False, include_data = False):
        serialized_feature = super(OrderFeature, self).to_serializable(virtual=virtual, include_data=include_data)
        
        if include_data:
            order_dict = {'data' : {'description' : self.description} }
            
            categ_list = []
            for menu_categ in self.menu_categories.all().order_by('name'):
                menu_categ_dict = {'category' : {'id': menu_categ.id, 
                                                 'name' : menu_categ.name, 
                                                 'type' : menu_categ.categ_type}
                                   }
                
                item_list = []
                for menu_item in menu_categ.menu_items.all().order_by('-num_orders_prev', 'name'):
                    menu_item_dict = {  'id' : menu_item.id,
                                        'category_id' : menu_item.category_id,
                                        'name' : menu_item.name,
                                        'description' : menu_item.description,
                                        'price' : str(menu_item.price),
                                     }
                    if menu_categ.num_orders_prev > 0:
                        menu_item_dict['usage_rank'] = menu_item.num_orders_prev * 10 / menu_categ.num_orders_prev
                    else:
                        menu_item_dict['usage_rank'] = 0
                    
                    item_list.append(menu_item_dict)
                
                menu_categ_dict['items'] = item_list
                
                categ_list.append(menu_categ_dict)
            
            order_dict['data']['order_menu'] = categ_list             
            serialized_feature.update(order_dict)
        
        return serialized_feature


########################################## OrderAnnotation Class ##############################################
class OrderAnnotation(Annotation):
    order = fields.DataField() 
    
    def __init__(self, *args, **kwargs):
        data = kwargs.pop('data', None)
        super(OrderAnnotation, self).__init__(*args, **kwargs)
        
        """
        if not data is None:
            if 'order' in data:
                self.order = data
            else:
                raise AnnotationException("OrderAnnotation missing order data")
        """
        if not data is None:
            self.order = data
            
            
    def get_annotation_data(self):
        return self.order.to_serializable()
        
    
    @classmethod
    def is_annotation_for(cls, category, annotation_data):
        return category == Annotation.ORDER
    
    
    @classmethod
    def validate_data(cls, category, annotation_data):
        if not isinstance(annotation_data, dict):
            return ["Annotation data is required to be a dictionary."]
        else:
            req_type = annotation_data.get('order_request_type')
            
            if req_type is None:
                return ["No order_request_type specified in annotation data."]
            elif not req_type in [OrderFeature.CALL_WAITER, OrderFeature.CALL_CHECK, OrderFeature.NEW_ORDER]:
                return ["Unknown value `" + str(req_type) + "' for order request type."]
            
        return [] 
    
    
    @staticmethod
    def post_save_action(sender, instance, created, **kwargs):
        import sys
        
        ## if the instance was newly created
        if created:
            order_instance = instance.order.data
            
            ## if the instance is a dictionary as it is supposed to be
            if isinstance(order_instance, dict) and 'item_id_list' in order_instance:
                try:
                    order_items = order_instance['item_id_list']
                    for item_dict in order_items:
                        item_id = item_dict['id']
                        item_quantity = item_dict['quantity']
                        
                        menu_item = MenuItem.objects.get(id = item_id)
                        menu_item.num_orders_current += item_quantity
                        
                        menu_categ = menu_item.category
                        menu_categ.num_orders_current += item_quantity
                        
                        menu_item.save()
                        menu_categ.save()
                        
                except Exception, ex:
                    print >> sys.stderr, ex
                except KeyError, ke:
                    print >> sys.stderr, ke
                    
post_save.connect(OrderAnnotation.post_save_action, sender = OrderAnnotation)


######################################### OrderFeature Model Classes ###########################################        
class MenuCategory(models.Model):
    TYPE_CHOICES = (
        ("food", "food"), 
        ("drinks", "drinks"),
        ("desert", "desert")
    )
    
    menu = models.ForeignKey(OrderFeature, related_name = "menu_categories")
    name = models.CharField(max_length = 256)
    categ_type = models.CharField(max_length = 32, choices = TYPE_CHOICES, default = "drinks")
    
    ## the following fields are for consumption based ranking
    num_orders_current = models.IntegerField(default = 0)
    num_orders_prev = models.IntegerField(default = 0)
    
    def __unicode__(self):
        return self.name + " in menu -> " + self.menu.description
    
    
class MenuItem(models.Model):
    category = models.ForeignKey(MenuCategory, related_name = "menu_items")
    name = models.CharField(max_length = 256)
    description = models.TextField(null = True, blank = True)
    price = models.FloatField()
    
    ## the following fields are for consumption based ranking
    num_orders_current = models.IntegerField(default = 0)
    num_orders_prev = models.IntegerField(default = 0)
    
    def __unicode__(self):
        return self.name + " in category -> " + self.category.name
