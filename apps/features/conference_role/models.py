'''
Created on May 9, 2014

@author: alex
'''

from coresql.models import Feature, UserProfile
from django.db import models
from django.contrib.auth.hashers import (check_password, make_password)
#from django.db.models.signals import post_save

class ConferenceRoleFeature(Feature):
    CATEGORY = "conference_role"
    QUERY_TYPES = ('role', 'search')
    
    
    def to_serializable(self, request = None, virtual = False, include_data = False):
        from client.api import UserResource
        
        serialized_feature = super(ConferenceRoleFeature, self).to_serializable(request = request, virtual=virtual, include_data=include_data)
        
        ''' We want to return data only if there is request from a known user. Otherwise we return nothing '''
        if include_data and request and hasattr(request, 'user') and not request.user.is_anonymous():
            ''' From the list of participant roles retrieve the one corresponding to the user_profile of the user making the request '''
            
            try:
                confrole = self.participant_roles.get(user_profile = request.user.get_profile())
                
                role_dict = {'data' : {'user' : {'user_uri': UserResource().get_resource_uri(confrole.user_profile), 
                                                 'first_name': confrole.user_profile.user.first_name,
                                                 'last_name': confrole.user_profile.user.last_name
                                                },
                                       'role' : confrole.role
                                      } 
                             }
                
                serialized_feature.update(role_dict)
            except:
                pass
        
        return serialized_feature
    
    
    def get_feature_data(self, bundle, virtual, filters):
        return self.to_serializable(request = bundle.request, virtual = virtual, include_data = True)['data']
    
    
    @classmethod
    def get_resource_class(cls):
        from api import ConferenceRoleResource
        return ConferenceRoleResource

 

class ConferenceRole(models.Model):
    ROLE_TYPES = ("participant", "speaker", "session_chair")
    
    ROLE_CHOICES = (
        ("participant", "participant"), 
        ("speaker", "speaker"),
        ("session_chair", "session_chair")
    )
    
    conference = models.ForeignKey(ConferenceRoleFeature, related_name = 'participant_roles')
    user_profile = models.OneToOneField(UserProfile, related_name = 'conference_role', primary_key=True)
    role = models.CharField(max_length = 32, choices = ROLE_CHOICES, default = "participant")
    
    def __unicode__(self):
        return self.user_profile.user.email
    

class ChairRoleCredential(models.Model):
    user_profile = models.OneToOneField(UserProfile, related_name = 'chair_role')
    password = models.CharField(max_length=128)
    
    def set_password(self, raw_password):
        self.password = make_password(raw_password)

    def check_password(self, raw_password):
        """
        Borrowed from django.contrib.models.auth
        Returns a boolean of whether the raw_password was correct. Handles
        hashing formats behind the scenes.
        """
        def setter(raw_password):
            self.set_password(raw_password)
            self.save(update_fields=["password"])
        return check_password(raw_password, self.password, setter)
    
    @staticmethod
    def create_chair(user_profile, raw_password = None):
        if raw_password is None:
            # we disallow void passwords
            return None
        
        chair = ChairRoleCredential(user_profile=user_profile)
        chair.set_password(raw_password)
        chair.save()
        
        return chair
    
    def __unicode__(self):
        return self.user_profile.user.email