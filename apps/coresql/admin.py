from django.contrib import admin
from coresql.models import UserProfile, Environment, Layout, Area, Announcement, Annotation, History, Privacy,\
    Feature, UserSubProfile, ResearchProfile, UserContext

admin.site.register([UserProfile, Environment, Layout, Area, Feature, Announcement, Annotation, History, 
                     Privacy, UserSubProfile, ResearchProfile, UserContext])