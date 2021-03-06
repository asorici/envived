from client.authorization import AnnotationAuthorization, UserAuthorization, \
    FeatureAuthorization
from client.validation import AnnotationValidation
from coresql.models import Environment, Area, Announcement, History, UserProfile, \
    ResearchProfile, UserContext, UserSubProfile
from coresql.utils import str2bool
from datetime import datetime
from django.conf.urls import patterns
from django.core.exceptions import MultipleObjectsReturned
from tastypie import fields, http
from tastypie.api import Api
from tastypie.authentication import Authentication
from tastypie.exceptions import ImmediateHttpResponse, NotFound
from tastypie.resources import ModelResource


class UserResource(ModelResource):
    first_name = fields.CharField(readonly = True)
    last_name = fields.CharField(readonly = True)
    
    class Meta:
        queryset = UserProfile.objects.all()
        resource_name = 'user'
        detail_allowed_methods = ["get", "put"]
        list_allowed_methods = ["get"]
        #fields = ['first_name']
        excludes = ["id", "timestamp", "is_anonymous"]
        authentication = Authentication()
        authorization = UserAuthorization()
        
    
    def build_filters(self, filters = None):
        """
        enable filtering by environment and area (which do not have their own fields in this resource)
        """
        if filters is None:
            filters = {}
        
        orm_filters = super(UserResource, self).build_filters(filters)
        
        if "area" in filters:
            area_id = filters['area']
            area = Area.objects.get(id = area_id)
            
            #checked_in_user_profiles = [user_ctx.user for user_ctx in UserContext.objects.filter(currentArea = area)]
            orm_filters["pk__in"] = [user_ctx.user.pk 
                                     for user_ctx in UserContext.objects.filter(currentArea = area)]
        
        elif "environment" in filters:
            environment_id = filters['environment']
            environment = Environment.objects.get(id = environment_id)
            
            #checked_in_user_profiles = [user_ctx.user for user_ctx in UserContext.objects.filter(currentArea = area)]
            orm_filters["pk__in"] = [user_ctx.user.pk 
                                     for user_ctx in UserContext.objects.filter(currentEnvironment = environment)]
        
        return orm_filters
    
    def dehydrate_first_name(self, bundle):
        return bundle.obj.user.first_name
        
    def dehydrate_last_name(self, bundle):
        return bundle.obj.user.last_name
    
    def dehydrate_research_profile(self, bundle):
        import inspect, sys
        
        research_dict = {}
        if bundle.obj.research_profile:
            for f in ResearchProfile._meta.fields:
                if not f.primary_key and not hasattr(f, 'foreign_key'):
                    field_class = f.__class__
                    extension_classes = inspect.getmembers(sys.modules["coresql.db.fields"], 
                        lambda c: inspect.isclass(c) and c.__module__ == "coresql.db.fields")
                    
                    if (field_class.__name__, field_class) in extension_classes:
                        research_dict[f.name] = getattr(bundle.obj.research_profile, f.name).to_serializable()
                    else:
                        research_dict[f.name] = getattr(bundle.obj.research_profile, f.name)
        
        return research_dict

    
    def dehydrate(self, bundle):
        #if 'research_profile' in bundle.data and not bundle.obj.research_profile:
        #    del bundle.data['research_profile']
        
        """ dehydrate UserSubProfiles if requested """
        if 'showprofile' in bundle.request.GET and \
            bundle.request.GET['showprofile'] in UserSubProfile.get_subclass_list() + ['all']:
            
            ## get downcasted versions directly of all the subprofiles associated with this userprofile
            profile_type = bundle.request.GET['showprofile']
            subprofiles = []
            
            if profile_type == 'all':
                subprofiles = bundle.obj.subprofiles.all().select_subclasses()
            else:
                subprofiles = bundle.obj.subprofiles.all().select_subclasses(profile_type)
            
            subprofiles_dict = {}
            for profile in subprofiles:
                data = profile.to_serializable()
                if data:
                    subprofiles_dict.update(data)
                    
            if subprofiles_dict:
                bundle.data['subprofiles'] = subprofiles_dict
            
        """ if the user is requesting his own data then return his email too as it
            is an identifying element """    
        if hasattr(bundle.request, "user") and not bundle.request.user.is_anonymous():
            user_profile = bundle.request.user.get_profile()
            if user_profile.pk == bundle.obj.pk:
                bundle.data['email'] = bundle.obj.user.email 
    
        """ remove c2dm data from bundle """
        if 'c2dm_id' in bundle.data:
            del bundle.data['c2dm_id']
        
        return bundle
    
    
    def get_list(self, request, **kwargs):
        ## override the list retrieval part to verify additionally that an ``environment`` or ``area`` filter exists
        ## otherwise reject the call with a HttpMethodNotAllowed
        if 'environment' in request.GET or 'area' in request.GET:
            return super(UserResource, self).get_list(request, **kwargs)
        else:
            raise ImmediateHttpResponse(response=http.HttpMethodNotAllowed())
    
    def apply_sorting(self, obj_list, options=None):
        ## apply a default sorting of user by their last_name
        return obj_list.order_by("user__last_name")
    
    
    def obj_update(self, bundle, skip_errors=False, **kwargs):
        """
        Could be an intentional action that the default obj_update treats DoesNotExist and MultipleObjectReturned
        as acceptable exceptions which get transformed into a CREATE operation.
        We don't want such a behavior. So we catch does exceptions and throw an BadRequest message
        """ 
        from tastypie.serializers import Serializer
           
        try:
            serdes = Serializer()
            deserialized = None
            try:
                deserialized = serdes.deserialize(bundle.request.raw_post_data, 
                                    format=bundle.request.META.get('CONTENT_TYPE', 'application/json'))
            except Exception:
                deserialized = None
            del serdes
                    
            if deserialized is None:
                return ImmediateHttpResponse(response = http.HttpBadRequest())
            
            if 'unregister_c2dm' in deserialized and deserialized['unregister_c2dm'] == True:
                bundle.data['c2dm_id'] = None
            
            updated_bundle = super(UserResource, self).obj_update(bundle, skip_errors=skip_errors, **kwargs)
            return updated_bundle
        except (NotFound, MultipleObjectsReturned):
            raise ImmediateHttpResponse(response = http.HttpBadRequest())
    


class EnvironmentResource(ModelResource):
    features = fields.ListField()
    parent = fields.ForeignKey('self', 'parent', null = True)
    owner = fields.ForeignKey(UserResource, 'owner', full = True)
    
    class Meta:
        queryset = Environment.objects.all()
        resource_name = 'environment'
        #api_name = 'v1/resources'
        #fields = ['name', 'data', 'tags', 'parentID', 'category', 'latitude', 'longitude', 'timestamp']
        excludes = ['width', 'height']
        detail_allowed_methods = ['get']
        list_allowed_methods = ['get']
        authentication = Authentication()
        default_format = "application/json"
        
    def dehydrate_tags(self, bundle):
        return bundle.obj.tags.to_serializable()
    
    
    def dehydrate_parent(self, bundle):
        if not bundle.data['parent'] is None:
            parent_data = bundle.data['parent']
            parent_name = bundle.obj.parent.name
        
            return {'uri' : parent_data, 'name': parent_name}
        
        return None
    
    
    def dehydrate_features(self, bundle):
        ## retrieve the value of the virtual flag
        virtual = get_virtual_flag_from_url(bundle.request)
        
        ## return a list of dictionary values from the features of this environment
        feature_list = []
        for feature in bundle.obj.features.select_subclasses():
            feature_resource_class = feature.__class__.get_resource_class()
            if feature_resource_class:
                feat_dict = feature.to_serializable(virtual = virtual)
                if feat_dict:
                    ## attach resource_uri and environment_uri
                    #feat_dict['resource_uri'] = FeatureResource().get_resource_uri(feature)
                    feat_dict['resource_uri'] = feature_resource_class().get_resource_uri(feature)
                    feat_dict['environment'] = self.get_resource_uri(bundle)
                    feature_list.append(feat_dict)
                
        return feature_list
    
    
    def dehydrate(self, bundle):
        """ Delete the img_thumbnail_url if it is null """
        if bundle.obj.img_thumbnail_url is None:
            del bundle.data['img_thumbnail_url']
        
        """ append layout url if a level filter exists in the request """
        if "level" in bundle.request.GET:
            level = int(bundle.request.GET["level"])
            bundle.data["layout_url"] = bundle.obj.layouts.get(level=level).mapURL
        
        """
        make bundle consistent for location parsing on mobile client: 
            add a location_type entry in the bundle.data
            put all the rest of the data under location_data
        """
        location_data = bundle.data.copy()
        bundle.data.clear()
        bundle.data['location_type'] = self._meta.resource_name
        bundle.data['location_data'] = location_data
        
        return bundle
    


class AreaResource(ModelResource):
    parent = fields.ForeignKey(EnvironmentResource, 'environment')
    features = fields.ListField()
    owner = fields.DictField()
    admin = fields.ForeignKey(UserResource, 'admin', null = True, full = True)
    
    class Meta:
        queryset = Area.objects.all()
        resource_name = 'area'
        allowed_methods = ['get']
        excludes = ['shape', 'layout']
        filtering = {
            'parent': ['exact'],
        }
        authentication = Authentication()
        
    
    def get_list(self, request, **kwargs):
        ## override the list retrieval part to verify additionally that an ``environment`` filter exists
        ## otherwise reject the call with a HttpMethodNotAllowed
        if 'parent' in request.GET or 'q' in request.GET:
            return super(AreaResource, self).get_list(request, **kwargs)
        else:
            raise ImmediateHttpResponse(response=http.HttpMethodNotAllowed())
    
    
    def build_filters(self, filters = None):
        """
        enable filtering by level (which does not have its own field)
        """
        if filters is None:
            filters = {}
        
        orm_filters = super(AreaResource, self).build_filters(filters)
        
        if "level" in filters:
            orm_filters["layout__level"] = int(filters["level"])
        
        return orm_filters
    
    
    def dehydrate_tags(self, bundle):
        return bundle.obj.tags.to_serializable()
    
    
    def dehydrate_parent(self, bundle):
        parent_data = bundle.data['parent']
        parent_name = bundle.obj.environment.name
        
        return {'uri' : parent_data, 'name': parent_name}
    
    
    def dehydrate_owner(self, bundle):
        user_res = UserResource()
        user_bundle = user_res.build_bundle(bundle.obj.environment.owner, request=bundle.request)
        user_bundle = user_res.full_dehydrate(user_bundle)
        
        return user_bundle.data
    
    
    def dehydrate_features(self, bundle):
        ## retrieve the value of the virtual flag
        virtual = get_virtual_flag_from_url(bundle.request)
        
        ## return a list of dictionary values from the features of this area
        feature_list = []
        for feature in bundle.obj.features.select_subclasses():
            feature_resource_class = feature.__class__.get_resource_class()
            if feature_resource_class:
                feat_dict = feature.to_serializable(request = bundle.request, virtual = virtual)
                if feat_dict:
                    ## attach resource_uri and area_uri
                    # feat_dict['resource_uri'] = FeatureResource().get_resource_uri(feature)
                    feat_dict['resource_uri'] = feature_resource_class().get_resource_uri(feature)
                    feat_dict['area'] = self.get_resource_uri(bundle)
                    feature_list.append(feat_dict)
        
        ## then see if environment features which also apply to the area are available - e.g. program, order
        environment = bundle.obj.environment
        environment_features = environment.features.select_subclasses().filter(is_general = True)
        
        for env_feat in environment_features:
            env_feat_resource_class = env_feat.__class__.get_resource_class()
            if env_feat_resource_class:
                feat_dict = env_feat.to_serializable(request = bundle.request, virtual = virtual)
                if feat_dict:
                    ## attach resource_uri and area_uri
                    #feat_dict['resource_uri'] = FeatureResource().get_resource_uri(env_feat)
                    feat_dict['resource_uri'] = env_feat_resource_class().get_resource_uri(env_feat)
                    feat_dict['environment'] = EnvironmentResource().get_resource_uri(environment)
                    feature_list.append(feat_dict)
        
        return feature_list
    
    
    def dehydrate(self, bundle):
        """ delete admin field from bundle.data if the model field is null """
        if bundle.obj.admin is None:
            del bundle.data['admin']
        
        """ Delete the img_thumbnail_url if it is null """
        if bundle.obj.img_thumbnail_url is None:
            del bundle.data['img_thumbnail_url']
        
        """ append level data from the layout reference of the Area obj """
        bundle.data['level'] = bundle.obj.layout.level
        
        """
        make bundle consistent for location parsing on mobile client: 
            add a location_type entry in the bundle.data
            put all the rest of the data under location_data
        """
        location_data = bundle.data.copy()
        bundle.data.clear()
        bundle.data['location_type'] = self._meta.resource_name
        bundle.data['location_data'] = location_data
        
        return bundle
    


class FeatureResource(ModelResource):
    environment = fields.ForeignKey(EnvironmentResource, 'environment', null = True)
    area = fields.ForeignKey(AreaResource, 'area', null = True)
    category = fields.CharField(attribute = 'category')
    data = fields.DictField()
    
    class Meta:
        # queryset = Feature.objects.select_subclasses()
        # resource_name = 'feature'
        allowed_methods = ['get']
        excludes = ['id', 'is_general']
        filtering = {
            'area' : ['exact'],
            'environment' : ['exact'],
            'category' : ['exact']
        }
        authentication = Authentication()
        authorization = FeatureAuthorization()
    
    
    def base_urls(self):
        from django.conf.urls.defaults import url
        from tastypie.utils.urls import trailing_slash
        
        """
        The standard URLs this ``Resource`` should respond to.
        """
        return [
            url(r"^features/(?P<resource_name>%s)%s$" % (self._meta.resource_name, trailing_slash()), self.wrap_view('dispatch_list'), name="api_dispatch_list"),
            url(r"^features/(?P<resource_name>%s)/schema%s$" % (self._meta.resource_name, trailing_slash()), self.wrap_view('get_schema'), name="api_get_schema"),
            url(r"^features/(?P<resource_name>%s)/set/(?P<%s_list>\w[\w/;-]*)%s$" % (self._meta.resource_name, self._meta.detail_uri_name, trailing_slash()), self.wrap_view('get_multiple'), name="api_get_multiple"),
            url(r"^features/(?P<resource_name>%s)/(?P<%s>\w[\w/-]*)%s$" % (self._meta.resource_name, self._meta.detail_uri_name, trailing_slash()), self.wrap_view('dispatch_detail'), name="api_dispatch_detail"),
        ]
    
    
    def get_list(self, request, **kwargs):
        """
        override the list retrieval part to verify additionally that an ``area`` or ``environment`` 
        and a ``category`` filter exist otherwise reject the call with a HttpMethodNotAllowed
        """
        # if ('area' in request.GET or 'environment' in request.GET) and 'category' in request.GET:
        if 'area' in request.GET or 'environment' in request.GET:
            return super(FeatureResource, self).get_list(request, **kwargs)
        else:
            raise ImmediateHttpResponse(response=http.HttpMethodNotAllowed())
    
    
    def get_object_list(self, request):
        from django.db.models import Q
        
        feature_obj_list = super(FeatureResource, self).get_object_list(request)
        
        if 'area' in request.GET:
            area_id = request.GET['area']
            try:
                area = Area.objects.get(id = area_id)
                q1 = Q(area = area)
                q2 = Q(environment = area.environment) & Q(is_general = True)
                
                return feature_obj_list.filter(q1 | q2)
            except Area.DoesNotExist, ex:
                raise ImmediateHttpResponse(response=http.HttpBadRequest(content=ex.get_message()))
        
        return feature_obj_list
    
    
    def build_filters(self, filters = None):
        
        if filters is None:
            filters = {}
        
        if 'area' in filters:
            ## remove the filter since it has been handled in get_obj_list
            del filters['area']
          
        orm_filters = super(FeatureResource, self).build_filters(filters)
        return orm_filters
    
    
    def dehydrate_data(self, bundle):
        ## retrieve the value of the virtual flag
        virtual = get_virtual_flag_from_url(bundle.request)
        
        filters = bundle.request.GET.copy()
        return bundle.obj.get_feature_data(bundle, virtual, filters)
    
    
    def dehydrate(self, bundle):
        if bundle.obj.environment is None:
            del bundle.data['environment']
        
        elif bundle.obj.area is None:
            del bundle.data['area']
    
        return bundle
    


class AnnouncementResource(ModelResource):
    environment = fields.ForeignKey(EnvironmentResource, 'environment')
    area = fields.ForeignKey(AreaResource, 'area', null = True)
    
    class Meta:
        queryset = Announcement.objects.all()
        resource_name = 'announcement'
        allowed_methods = ['get']
        fields = ['data', 'timestamp']
        excludes = ['id']
        filtering = {
            'area': ['exact'],
            'environment': ['exact'],
            'timestamp': ['gt', 'gte'],
        }
        authentication = Authentication()
    
    
    def get_list(self, request, **kwargs):
        ## override the list retrieval part to verify additionally that an ``environment`` or ``area`` filter exists
        ## otherwise reject the call with a HttpMethodNotAllowed
        if 'environment' in request.GET or 'area' in request.GET:
            return super(AnnouncementResource, self).get_list(request, **kwargs)
        else:
            raise ImmediateHttpResponse(response=http.HttpMethodNotAllowed())
        
    
    def get_object_list(self, request):
        ## override the usual obj_list retrieval by filtering out only the yet to be given announcements 
        ## for the current environment (which we **know** must exist) 
        timestamp = datetime.now()
        
        ## get default object list
        announcement_obj_list = super(AnnouncementResource, self).get_object_list(request)
        
        if 'environment' in request.GET:
            try:
                env_id = request.GET['environment']
                environ = Environment.objects.get(id=env_id)
                announcement_obj_list = announcement_obj_list.filter(environment=environ)
            except Exception:
                pass
            
        if 'area' in request.GET:
            try:
                area_id = request.GET['area']
                area = Area.objects.get(id=area_id)
                announcement_obj_list = announcement_obj_list.filter(area=area)
            except Exception:
                pass
        
        try:
            id_list = []
            ## loop through each announcement and see if any of its
            ## triggers are greater than the current timestamp
            for obj in announcement_obj_list:
                triggers = obj.triggers.getList()
                        
                ## maybe make the following a little less hardcoded
                if obj.repeatEvery == "day":
                    for trig in triggers:
                        trig.replace(year=timestamp.year, month = timestamp.month, day = timestamp.day)
                        
                elif obj.repeatEvery == "week":
                    ## see which triggers are within "weeks" of the timestamp
                    for trig in triggers:
                        diff = timestamp.date() - trig.date()
                        if diff.days % 7 != 0:
                            triggers.remove(trig)
                            
                    ## and then update the day only for those
                    for trig in triggers:
                        trig.replace(year=timestamp.year, month = timestamp.month, day = timestamp.day)
                        
                ## and now we can do easy comparisons
                should_be_included = False
                for dt in obj.triggers.getList():
                    if dt >= timestamp:
                        should_be_included = True
                        break
                        
                if should_be_included:
                    id_list.append(obj.id)
                    
            return announcement_obj_list.filter(id__in = id_list)
                    
        except Exception:
            raise ImmediateHttpResponse(response=http.HttpMethodNotAllowed())
    
    

class AnnotationResource(ModelResource):
    environment = fields.ForeignKey(EnvironmentResource, 'environment', null = True)
    area = fields.ForeignKey(AreaResource, 'area', null = True)
    user = fields.ForeignKey(UserResource, 'user', null = True)
    data = fields.DictField()
    
    class Meta:
        # queryset = Annotation.objects.select_subclasses()
        # resource_name = 'annotation'
        detail_allowed_methods = ['get', 'put', 'delete']
        list_allowed_methods = ['get', 'post']
        ## need to put complete list of fields because otherwise the related ones will not get inherited in
        ## subclasses of AnnotationResource. 
        ## Not sure yet if this is desired functionality or a bug in Tastypie.
        fields = ['environment', 'area', 'user', 'data', 'category', 'timestamp']
        filtering = {
            'area': ['exact'],
            'environment': ['exact'],
            'timestamp': ['gt', 'gte', 'lt', 'lte'],
            'category': ['exact'],
        }
        ordering = ['timestamp']
        authentication = Authentication()
        authorization = AnnotationAuthorization()
        #validation = FormValidation(form_class = AnnotationForm)
        validation = AnnotationValidation()
        always_return_data = True
    
    
    def base_urls(self):
        from django.conf.urls.defaults import url
        from tastypie.utils.urls import trailing_slash
        
        """
        The standard URLs this ``Resource`` should respond to.
        """
        return [
            url(r"^annotations/(?P<resource_name>%s)%s$" % (self._meta.resource_name, trailing_slash()), self.wrap_view('dispatch_list'), name="api_dispatch_list"),
            url(r"^annotations/(?P<resource_name>%s)/schema%s$" % (self._meta.resource_name, trailing_slash()), self.wrap_view('get_schema'), name="api_get_schema"),
            url(r"^annotations/(?P<resource_name>%s)/set/(?P<%s_list>\w[\w/;-]*)%s$" % (self._meta.resource_name, self._meta.detail_uri_name, trailing_slash()), self.wrap_view('get_multiple'), name="api_get_multiple"),
            url(r"^annotations/(?P<resource_name>%s)/(?P<%s>\w[\w/-]*)%s$" % (self._meta.resource_name, self._meta.detail_uri_name, trailing_slash()), self.wrap_view('dispatch_detail'), name="api_dispatch_detail"),
        ]
            
    
    def get_list(self, request, **kwargs):
        ## override the list retrieval part to verify additionally that an ``area`` or ``environment`` filter exists
        ## otherwise reject the call with a HttpMethodNotAllowed
        
        # if ('area' in request.GET or 'environment' in request.GET) and 'category' in request.GET:
        if 'area' in request.GET or 'environment' in request.GET:
            return super(AnnotationResource, self).get_list(request, **kwargs)
        else:
            raise ImmediateHttpResponse(response=http.HttpMethodNotAllowed())
    
    """
    The following methods combined ensure that the environment=1&all=true query is handled successfully
    """
    def build_filters(self, filters = None):
        if filters is None:
            filters = {}
        
        if 'environment' in filters and 'all' in filters and filters['all'] == 'true':
            """
            if environment and all are in the filters, don't apply them any more because it will have
            already been handled in get_object_list
            """
            del filters['environment']
            del filters['all']
          
        orm_filters = super(AnnotationResource, self).build_filters(filters)
        
        return orm_filters
    
    
    def get_object_list(self, request):
        from django.db.models import Q
        
        if 'environment' in request.GET and 'all' in request.GET and request.GET['all'] == 'true':
            try:
                environment_pk = request.GET['environment']
                environment = Environment.objects.get(pk=environment_pk)
                q1 = Q(environment=environment)
                q2 = Q(area__in=list(environment.areas.all()))
                
                return super(AnnotationResource, self).get_object_list(request).filter(q1 | q2)
            except Exception, ex:
                #print ex
                raise ImmediateHttpResponse(response=http.HttpBadRequest(content=ex.get_message()))
        
        return super(AnnotationResource, self).get_object_list(request)
    
    
    def dehydrate_data(self, bundle):
        ## return the data representation of this annotation according to its type
        # user_profile = bundle.request.user.get_profile()
        return bundle.obj.get_annotation_data()
        
    
    def dehydrate_timestamp(self, bundle):
        from pytz import timezone
        local_tz = timezone("Europe/Bucharest")
        
        return local_tz.localize(bundle.obj.timestamp)
     
    
    def dehydrate(self, bundle):
        """
        return additionally for each annotation
        bundle the name of the environment/area for which the annotation was made
        """
        if not bundle.obj.environment is None:
            ## make the environment response a dictionary, containing resource_uri and name
            bundle.data['environment'] = {'resource_uri': bundle.data['environment'], 'name': bundle.obj.environment.name}
        
        if not bundle.obj.area is None:
            ## make the area response a dictionary, containing resource_uri and name
            bundle.data['area'] = {'resource_uri': bundle.data['area'], 'name': bundle.obj.area.name}
        
        
        """
        bundle in the user's first and last name under the ['data']['user'] entry 
        """
        first_name = "Anonymous"
        last_name = "Guest"
            
        user_profile = bundle.obj.user
        
        if not user_profile is None and not user_profile.is_anonymous:
            first_name = user_profile.user.first_name
            last_name = user_profile.user.last_name
        
        
        bundle.data['data']['user'] = { 'first_name' : first_name,
                                        'last_name' : last_name 
                                      }
        
        """
        now remove also null area/environment data
        """
        if not bundle.data['environment']:
            del bundle.data['environment']
            
        if not bundle.data['area']:
            del bundle.data['area']
    
        """
        if no data is found remove the 'data' attribute from the bundle to avoid useless processing on
        the mobile side 
        """
        if not bundle.data['data']:
            del bundle.data['data']
        
        return bundle
        
        
    def obj_create(self, bundle, **kwargs):
        ## because of the AnnotationAuthorization class, request.user will have a profile
        user_profile = bundle.request.user.get_profile()
        updated_bundle = super(AnnotationResource, self).obj_create(bundle, user=user_profile)
        
        return updated_bundle
    
    
    def obj_update(self, bundle, skip_errors=False, **kwargs):
        """
        Could be an intentional feature that the default obj_update treats DoesNotExist and MultipleObjectReturned
        as acceptable exceptions which get transformed into a CREATE operation.
        We don't want such a behavior. So we catch those exceptions and throw a BadRequest message
        """
        try:
            updated_bundle = super(AnnotationResource, self).obj_update(bundle, skip_errors=skip_errors, **kwargs)
            return updated_bundle
        except NotFound, enf:
            raise ImmediateHttpResponse(response = http.HttpBadRequest(content=enf.get_message()))
        except MultipleObjectsReturned, emult:
            raise ImmediateHttpResponse(response = http.HttpBadRequest(content=emult.get_message()))
    
    
    
    def _make_c2dm_notification(self, registration_id, collapse_key, bundle, params = None):
        import socket, pickle, c2dm, sys
        
        if params is None:
            params = {}
        
        if not registration_id is None:
            #collapse_key = "annotation_" + bundle.obj.category
            resource_uri = self.get_resource_uri(bundle)
            
            environment = bundle.obj.environment
            if not bundle.obj.area is None:
                environment = bundle.obj.area.environment 
            
            location_uri = EnvironmentResource().get_resource_uri(environment)
            feature = bundle.obj.category
            
            # prepare notification data
            registration_ids = [registration_id]
            notification_data = {'location_uri' : location_uri,
                                 'resource_uri' : resource_uri,
                                 'feature' : feature,
                                 }
            
            notification_data['params'] = params
            
            delay_while_idle = False
            ttl = None
            if not collapse_key is None:
                ttl = 600 
            
            # pickle notification data and send it
            data = pickle.dumps((registration_ids, collapse_key, delay_while_idle, ttl, notification_data))
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            try:
                # Connect to server and send data
                sock.connect((c2dm.GCMServer.HOST, c2dm.GCMServer.PORT))
                sock.sendall(data + "\n")
            
                # Receive data from the server and shut down
                received = sock.recv(1024)
                
                if received == "OK":
                    print >> sys.stderr, "[Annotation GCM] Notification enqueued"
                else:
                    print >> sys.stderr, "[Annotation GCM] Notification NOT enqueued"
            except Exception, ex:
                print >>sys.stderr, "[Annotation GCM] failure enqueueing annotation: ", ex
            finally:
                sock.close()
   

class HistoryResource(ModelResource):
    environment = fields.ForeignKey(EnvironmentResource, 'environment')
    area = fields.ForeignKey(AreaResource, 'area')
    user = fields.ForeignKey(UserResource, 'user')
    
    class Meta:
        resource_name = 'history'
        queryset = History.objects.all()
        excludes = ['user']
        allowed_methods = ['get']
        filtering = {
            'user': ['exact'],
        }
        ordering = ['-timestamp']
    
    
    def get_list(self, request, **kwargs):
        ## override the list retrieval part to verify additionally that an ``user`` filter exists
        ## otherwise reject the call with a HttpMethodNotAllowed
        if 'user' in request.GET:
            return super(AnnotationResource, self).get_list(request, **kwargs)
        else:
            raise ImmediateHttpResponse(response=http.HttpMethodNotAllowed())
    


class EnvrionmentContextResource(ModelResource):
    PEOPLE_COUNT = "peoplecount"
    response = fields.DictField()
    
    class Meta:
        queryset = Environment.objects.all()
        resource_name = 'environmentcontext'
        detail_allowed_methods = ['get']
        list_allowed_methods = []
        fields = ['']
    
    
    def get_detail(self, request, **kwargs):
        ## override the list retrieval part to verify additionally that an ``user`` filter exists
        ## otherwise reject the call with a HttpMethodNotAllowed
        if 'request' in request.GET:
            return super(EnvrionmentContextResource, self).get_detail(request, **kwargs)
        else:
            raise ImmediateHttpResponse(response=http.HttpBadRequest())
        
    
    def dehydrate_response(self, bundle):
        ## see what the context request is
        context_request = bundle.request.GET['request']
        
        if context_request == EnvrionmentContextResource.PEOPLE_COUNT:
            environment = bundle.obj
            environment_people_count = UserContext.objects.filter(currentEnvironment = environment).count()
            
            return environment_people_count
        else:
            raise ImmediateHttpResponse(response=http.HttpNotImplemented())
    

#############################################################################################################
#############################################################################################################

class ClientApi(Api):
    
    def __init__(self, *args, **kwargs):
        super(ClientApi, self).__init__(*args, **kwargs)
    
    '''
    def prepend_urls(self):
        from django.conf.urls.defaults import url, include
        from client.views import checkin, checkout, login, logout, register, create_anonymous, delete_anonymous
        
        prepended_urls = Api.prepend_urls(self)
        
        ## add all general actions
        prepended_urls.extend([
            url(r"^%s/actions/create_anonymous/$" % self.api_name, create_anonymous, name="create_anonymous"),
            url(r"^%s/actions/delete_anonymous/$" % self.api_name, delete_anonymous, name="delete_anonymous"),
            url(r"^%s/actions/register/$" % self.api_name, register, name="register"),
            url(r"^%s/actions/login/$" % self.api_name, login, name="login"),
            url(r"^%s/actions/logout/$" % self.api_name, logout, name="logout"),
            url(r"^%s/actions/checkin/$" % self.api_name, checkin, name="checkin"),
            url(r"^%s/actions/checkout/$" % self.api_name, checkout, name="checkout")
        ])
        
        ## add all per feature resource urls
        """
        for feat_res_cls in FeatureResource.__subclasses__():
            prepended_urls.append(url(r"^(?P<api_name>%s)/resources/features/" % self.api_name, include(feat_res_cls().urls)))
            
        ## add all per feature annotation urls
        for ann_res_cls in AnnotationResource.__subclasses__():
            prepended_urls.append(url(r"^(?P<api_name>%s)/resources/annotations/" % self.api_name, include(ann_res_cls().urls)))
        """
        
        ## add all client api urls under the `resources' url-path
        for name in sorted(self._registry.keys()):
            self._registry[name].api_name = self.api_name
            prepended_urls.append(url(r"^(?P<api_name>%s)/resources/" % self.api_name, include(self._registry[name].urls)))

        return prepended_urls
    '''
    
    
    @property
    def urls(self):
        """
        Provides URLconf details for the ``Api`` and all registered
        ``Resources`` beneath it.
        """
        
        from django.conf.urls.defaults import url, include
        from tastypie.utils.urls import trailing_slash
        from client.views import checkin, checkout, login, logout, register, create_anonymous, delete_anonymous
        
        pattern_list = [
            url(r"^(?P<api_name>%s)%s$" % (self.api_name, trailing_slash()), self.wrap_view('top_level'), name="api_%s_top_level" % self.api_name),
        ]

        for name in sorted(self._registry.keys()):
            self._registry[name].api_name = self.api_name
            pattern_list.append((r"^(?P<api_name>%s)/resources/" % self.api_name, include(self._registry[name].urls)))

        ## then add the actions
        pattern_list.extend([
            url(r"^%s/actions/create_anonymous/$" % self.api_name, create_anonymous, name="create_anonymous"),
            url(r"^%s/actions/delete_anonymous/$" % self.api_name, delete_anonymous, name="delete_anonymous"),
            url(r"^%s/actions/register/$" % self.api_name, register, name="register"),
            url(r"^%s/actions/login/$" % self.api_name, login, name="login"),
            url(r"^%s/actions/logout/$" % self.api_name, logout, name="logout"),
            url(r"^%s/actions/checkin/$" % self.api_name, checkin, name="checkin"),
            url(r"^%s/actions/checkout/$" % self.api_name, checkout, name="checkout")
        ])

        urlpatterns = self.prepend_urls()
        
        urlpatterns += patterns('',
            *pattern_list
        )
        return urlpatterns
    

#############################################################################################################
#############################################################################################################

def get_virtual_flag_from_url(request):
    
    ## retrieve the value of the virtual flag
    virtual = str(request.GET.get('virtual'))    
    if virtual is None:
        raise ImmediateHttpResponse(response = http.HttpBadRequest(content='No "virtual" flag in request url'))
    
    try:
        virtual = str2bool(virtual)
    except ValueError:
        raise ImmediateHttpResponse(response = http.HttpBadRequest(content='"virtual" flag could not be parsed to a boolean'))
    
    return virtual

    

def get_timestamp_from_url(date_string):
    timestamp = None
    try:
        ## first try the format %Y-%m-%dT%H:%M:%S
        time_format = "%Y-%m-%dT%H:%M:%S"
        timestamp = datetime.strptime(date_string, time_format)
    except ValueError:
        pass
    
    try:
        ## then try the format %Y-%m-%d %H:%M:%S
        time_format = "%Y-%m-%d %H:%M:%S"
        timestamp = datetime.strptime(date_string, time_format)
    except ValueError:
        pass
    
    return timestamp
