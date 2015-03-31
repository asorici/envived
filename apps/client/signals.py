'''
Created on May 12, 2014

@author: alex
'''
import django.dispatch

user_checked_in = django.dispatch.Signal(providing_args=["user_profile", "environment", "area", "virtual"])
user_checked_out = django.dispatch.Signal(providing_args=["user_profile", "environment", "area"])