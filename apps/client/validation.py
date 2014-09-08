from tastypie.validation import Validation
from coresql.models import Environment

class AnnotationValidation(Validation):
    def is_valid(self, bundle, request=None):
        from client.api import EnvironmentResource, AreaResource
        
        ## check that we have a user
        if not bundle.request.user or bundle.request.user.is_anonymous():
            return {'__all__': 'No user found in request.'}
        
        if not bundle.data:
            return {'__all__': 'No data submitted.'}
        
        errors = {}
        
        if bundle.request.method.upper() == "POST":
            env_obj = None
            area_obj = None
            
            if 'environment' in bundle.data:
                try:
                    env_obj = EnvironmentResource().get_via_uri(bundle.data['environment']) 
                except:
                    env_obj = None
                    
            if 'area' in bundle.data:
                try:
                    area_obj = AreaResource().get_via_uri(bundle.data['area'])
                except:
                    area_obj = None
            
            if env_obj is None and area_obj is None:
                errors['environment'] = ['No or wrong environment uri']
                errors['area'] = ['No or wrong area uri']
                
            if not env_obj is None and not area_obj is None and area_obj.env != env_obj:
                errors['environment'] = ["Environment resource mismatches parent environment of area resource."]
            
        
        if not 'data' in bundle.data or not bundle.data['data']:
            errors['data'] = ["No or empty data field."]
        
        
        ## some additional validation of the data field might also be possible if no errors up to now
        if not errors:
            ann_cls = bundle.obj.__class__
            data = bundle.data['data']
            category = bundle.obj.__class__.CATEGORY
            
            data_errors = ann_cls.validate_data(category, data)
            if data_errors:
                errors['data'] = data_errors
                
                import sys
                print >> sys.stderr, data_errors
        
        return errors
    
class EnvironmentValidation(Validation):
    def is_valid(self,bundle,request=None):
           errors = {} 
           if bundle.request.method.upper() == "POST":
                if not 'name' in bundle.data:
                    errors['name'] =['You must complete the name of the environment'];
                if not 'owner' in bundle.data:
                    errors['owner'] =  ['the value owner is missing'];
                if Environment.objects.filter(name__iexact=bundle.data['name']):
                    errors['name'] =['This environment name is already in use. Please supply a different environment name']
           return errors    
    
    