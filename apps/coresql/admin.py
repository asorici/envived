from django.contrib import admin
from coresql.models import UserProfile, Environment, Layout, Area, Announcement, Annotation, History, Privacy,\
    Feature, Thing, ThingProperty, UserSubProfile, ResearchProfile, UserContext

admin.site.register([UserProfile, Environment, Layout, Area, Feature, Thing, ThingProperty, Announcement, Annotation, History, 
                     Privacy, UserSubProfile, ResearchProfile, UserContext])