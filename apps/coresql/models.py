from coresql.db import fields
from django.contrib.auth.models import User
from django.db import models
from django.db.models.fields.related import SingleRelatedObjectDescriptor
from django.db.models.signals import post_save
from django_facebook.models import FacebookProfileModel
from model_utils.managers import InheritanceManager
import datetime


"""
####################################### UserProfile Model Classes ######################################## 
"""

class UserProfile(models.Model):
    user = models.OneToOneField(User)
    
    timestamp = models.DateTimeField()
    is_anonymous = models.BooleanField(default = False)
    c2dm_id = models.CharField(max_length=256, null = True, blank = True)
    
    def __unicode__(self):
        return self.user.username + ": anonymous=" + str(self.is_anonymous)
    
    def save(self, *args, **kwargs):
        ''' On save, update timestamp '''
        self.timestamp = datetime.datetime.now()
        super(UserProfile, self).save(*args, **kwargs)
        
    
    def copy_from_profile(self, user_profile):
        ''' copy the UserContext data and c2dm_id from the given user_profile - equivalent of a user switch '''
        self.c2dm_id = user_profile.c2dm_id
        user_context = UserContext.from_user(user_profile, self)
        if not user_context is None:
            self.context = user_context
        
        self.save()
        

def create_user_profile(sender, instance, created, **kwargs):
    if created:
        UserProfile.objects.create(user=instance)

post_save.connect(create_user_profile, sender=User)

class UserSubProfile(models.Model):
    userprofile = models.ForeignKey(UserProfile, related_name = "subprofiles")
    
    objects = InheritanceManager()
    
    def __unicode__(self):
        return self.userprofile.user.username + ": anonymous=" + str(self.userprofile.is_anonymous)
    
    @staticmethod
    def update_user_profile_timestamp(sender, instance, created, **kwargs):
        ''' update user profile timestamp when sub profile is created or changed '''
        instance.userprofile.timestamp = datetime.datetime.now()
        instance.userprofile.save()
    
    @staticmethod
    def get_subclass_list():
        subclasses = [o for o in dir(UserSubProfile)
                      if isinstance(getattr(UserSubProfile, o), SingleRelatedObjectDescriptor)\
                      and issubclass(getattr(UserSubProfile, o).related.model, UserSubProfile)]
        
        return subclasses
    
    def profile_name(self):
        return self._meta.object_name.lower()
    
    def to_serializable(self):
        return None

''' update user profile timestamp when sub profile is created or changed '''
post_save.connect(UserSubProfile.update_user_profile_timestamp, sender = UserSubProfile)
    

class ResearchProfile(UserSubProfile):
    affiliation = models.CharField(max_length = 256, null = True, blank = True)
    research_interests = fields.TagListField(null = True, blank = True)
    
    def __unicode__(self):
        return self.affiliation + " ## " + str(self.research_interests.getList())
    
    def to_serializable(self):
        profile_name = self.profile_name()
        data = { profile_name : {'affiliation' : self.affiliation,
                                 'research_interests' : self.research_interests.getList()
                                }
               }
        
        return data


class FacebookProfile(UserSubProfile, FacebookProfileModel):
    pass
    

"""
######################################### Location Model Classes #########################################
"""

class Environment(models.Model):
    owner = models.ForeignKey(UserProfile)
    name = models.CharField(max_length=140)
    
    #category = models.CharField(max_length=50, choices = CATEGORY_CHOICES)
    #data = fields.DataField()
    
    parent = models.ForeignKey('self', null = True, blank = True, related_name="children")
    tags = fields.TagListField(null = True, blank = True)
    img_thumbnail_url = models.URLField(null = True, blank = True, max_length = 256)
    
    width = models.IntegerField(null = True, blank = True)
    height = models.IntegerField(null = True, blank = True)
    latitude = models.FloatField(null = True, blank = True)
    longitude = models.FloatField(null = True, blank = True)
    timestamp = models.DateTimeField(auto_now = True)

    def __unicode__(self):
        return self.name + "(" + str(self.id) + ")"
            

class Layout(models.Model):
    environment = models.ForeignKey(Environment, related_name = "layouts")
    level = models.IntegerField(default = 0)
    mapURL = models.URLField(null = True, blank = True)
    timestamp = models.DateTimeField(auto_now = True)
    
    def __unicode__(self):
        return self.environment.name + " level(" + str(self.level) + ")" 


class Area(models.Model):
    TYPE_CHOICES = (
        ("interest", "interest"), 
        ("non-interest", "non-interest")
    )
    
    environment = models.ForeignKey(Environment, related_name = "areas")
    areaType = models.CharField(max_length=50, choices = TYPE_CHOICES)
    admin = models.ForeignKey(UserProfile, null = True, blank = True, related_name = "administered_areas")
    name = models.CharField(max_length=140)
    
    tags = fields.TagListField(null = True, blank = True)
    layout = models.ForeignKey(Layout, related_name = "areas", blank = True)
    img_thumbnail_url = models.URLField(null = True, blank = True, max_length = 256)
    
    shape = fields.AreaShapeField(blank = True, null = True)
    timestamp = models.DateTimeField(auto_now = True)
    
    def __unicode__(self):
        return self.name + "(" + str(self.id) + ")"



class Announcement(models.Model):
    REPEAT_EVERY_CHOICES = (
        ("none", "none"), 
        ("day", "day"), 
        ("week", "week")
    )
    
    area = models.ForeignKey(Area, null = True, blank = True, related_name = "announcements")
    environment = models.ForeignKey(Environment, null = True, blank = True, related_name = "announcements")
    
    data = fields.DataField()
    repeatEvery = models.CharField(max_length=50, choices = REPEAT_EVERY_CHOICES, default = "none")
    followed_by = models.ManyToManyField(UserProfile, null = True, blank = True, related_name = "follows_announcements")
    
    triggers = fields.DateTimeListField()
    timestamp = models.DateTimeField(auto_now = True)


"""
##################################### Annotation Model Class ##############################################
"""
class Annotation(models.Model):
    
    area = models.ForeignKey(Area, null = True, blank = True, related_name = "annotations")
    environment = models.ForeignKey(Environment, null = True, blank = True, related_name = "annotations")
    user = models.ForeignKey(UserProfile, null = True, blank = True, on_delete=models.SET_NULL)
    #data = fields.DataField()
    category = models.CharField(max_length=50)
    timestamp = models.DateTimeField(auto_now = True)
    
    # use the inheritance manager to get access directly to subclasses of Annotation when 
    # retrieving sets of annotations
    objects = InheritanceManager()
    
    """
    @staticmethod
    def get_subclasses():
        import sys
        mod = sys.modules[Annotation.__module__]
        
        for name in dir(mod):
            o = getattr(mod, name)
            try:
                if (o != Annotation) and issubclass(o, Annotation):
                    yield name, o
            except TypeError: 
                pass
    """
    """
    @staticmethod
    def get_subclasses():
        import sys
        
        ## search for all classes defined in models of applications in the features package 
        for module_key in sys.modules.keys():
            module_key_elements = set(module_key.split("."))
            if set(['features', 'models']).issubset(module_key_elements):
                mod = sys.modules[module_key]
        
                for name in dir(mod):
                    o = getattr(mod, name)
                    try:
                        if (o != Annotation) and issubclass(o, Annotation):
                            yield name, o
                    except TypeError: 
                        pass
    """
    
    ## Going with the easiest implementation for now
    @staticmethod
    def get_subclasses():
        for cls in Annotation.__subclasses__():
            yield cls.__name__, cls
    
             
    
    def __unicode__(self):
        location_name = None
        if self.environment:
            location_name = self.environment.name
        elif self.area:
            location_name = self.area.name
        
        if self.user and location_name:
            return str(self.user) + " - " + location_name
        elif location_name:
            return "annotation for location " + location_name + " but empty user field"
        else:
            return "empty annotation object"
        
    def get_annotation_data(self):
        return None
    
    
    @classmethod
    def validate_data(cls, category, annotation_data):
        """
        Provide additional validation of the `data' field from an annotation according to the specific
        subclass. Returns a list of error messages which is empty by default.
        """
        return []
    
    
    @classmethod
    def get_extra_filters(cls, filters):
        return {}

    
    @classmethod
    def get_resource_class(cls):
        return None


"""
############################### History and Context Model Classes ########################################
"""    

class History(models.Model):
    user = models.ForeignKey(UserProfile)
    area = models.ForeignKey(Area)
    environment = models.ForeignKey(Environment)
    timestamp = models.DateTimeField(auto_now = True)
    

class Privacy(models.Model):
    user = models.ForeignKey(UserProfile)
    environment = models.ForeignKey(Environment)
    relation = models.CharField(max_length=50)
    

class UserContext(models.Model):
    user = models.OneToOneField(UserProfile, related_name='context')
    currentEnvironment = models.ForeignKey(Environment, null = True, blank = True)
    currentArea = models.ForeignKey(Area, null = True, blank = True)
    virtual = models.BooleanField()
    
    def __unicode__(self):
        return self.user.user.username

    
    @staticmethod
    def from_user(from_user_profile, to_user_profile):
        if hasattr(from_user_profile, "context"):
            from_context = from_user_profile.context
            return UserContext(user = to_user_profile,
                           currentArea = from_context.currentArea, 
                           currentEnvironment = from_context.currentEnvironment, 
                           virtual = from_context.virtual)
        return None


"""
######################################### Feature Model Class #############################################
"""
class Feature(models.Model):
    area = models.ForeignKey(Area, null = True, blank = True, related_name = "features")
    environment = models.ForeignKey(Environment, null = True, blank = True, related_name = "features")
    category = models.CharField(max_length=50)
    is_general = models.BooleanField(default = False)
    #data = fields.DataField(null = True, blank = True)
    version = models.SmallIntegerField(default = 1)
    timestamp = models.DateTimeField()
    
    def save(self, *args, **kwargs):
        ''' On save, update timestamp '''
        self.timestamp = datetime.datetime.now()
        super(Feature, self).save(*args, **kwargs)
    
    
    # use the inheritance manager to get access directly to subclasses of Feature when w
    # retrieving sets of Features
    objects = InheritanceManager()
    
    class Meta:
        unique_together = (("environment", "category"), ("area", "category"))
    
    
    def to_serializable(self, request = None, virtual = False, include_data = False):
        serialized_feature = {'category' : self.category, 
                              'version' : self.version, 
                              'timestamp': self.timestamp,
                              'is_general': self.is_general
                              }
        if include_data:
            serialized_feature['data'] = None
        
        return serialized_feature
    
    def __unicode__(self):
        if self.area:
            return "feature type(" + self.category + ") for area(" + self.area.name + ")"
        elif self.environment:
            return "feature type(" + self.category + ") for env(" + self.environment.name + ")"
        else:
            return "feature type(" + self.category + ") but no location assigned -- needs fix"
    
    
    def get_feature_data(self, bundle, virtual, filters):
        return self.to_serializable(request = bundle.request, virtual = virtual, include_data = True)['data']
    
    
    @classmethod
    def get_resource_class(cls):
        return None
    