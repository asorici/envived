from coresql.models import Feature, Annotation, Area
from coresql.exceptions import AnnotationException
from coresql.db import fields
from django.db import models
import datetime

########################################## ProgramFeature Class ###############################################
class ProgramFeature(Feature):
    QUERY_TYPES = ('presentation', 'speaker', 'search')
    
    description = models.TextField(null = True, blank = True)
    
    def to_serializable(self, virtual = False, include_data = False):
        from client.api import AreaResource
        
        serialized_feature = super(ProgramFeature, self).to_serializable(virtual=virtual, include_data=include_data)
        
        if include_data:
            program_dict = {'data' : {'description' : self.description} }
            
            sessions_list = []
            presentation_list = []
            speaker_list = []
            presentation_speakers_list = []
            
            sessions = self.sessions.all()
            for s in sessions:
                session_dict = {'id' : s.id,
                                'title' : s.title,
                                'tag' : s.tag,
                               }
                
                ## we add the data of the area in which this session of presentations is to take place
                session_dict['location_url'] = AreaResource().get_resource_uri(s.location)
                session_dict['location_name'] = s.location.name
                
                sessions_list.append(session_dict)
                
                presentations = s.presentations.all().order_by('startTime')
                for pres in presentations:
                    presentation_dict = {'id' : pres.id,
                                        'title' : pres.title,
                                        'sessionId' : s.id,
                                        'startTime' : pres.startTime.strftime("%Y-%m-%dT%H:%M:%S"),
                                        'endTime' : pres.endTime.strftime("%Y-%m-%dT%H:%M:%S")
                                        }
                    if pres.abstract:
                        presentation_dict['abstract'] = pres.abstract
                    
                    if pres.tags:
                        presentation_dict['tags'] = ";".join(pres.tags.getList())
                    
                    presentation_list.append(presentation_dict)
                    
                    speakers = pres.speakers.all().order_by('last_name')
                    for speaker in speakers:
                        presentation_speaker_dict = {'presentation_id' : pres.id,
                                                    'speaker_id': speaker.id
                                                    }
                        presentation_speakers_list.append(presentation_speaker_dict)
                        
                        if not any(d.get('id', None) == speaker.id for d in speaker_list):
                            speaker_dict = {'id': speaker.id,
                                            'first_name': speaker.first_name,
                                            'last_name': speaker.last_name,
                                            'affiliation': speaker.affiliation,
                                            'position': speaker.position
                                            }
                                    
                            if speaker.biography:
                                speaker_dict['biography'] = speaker.biography
                            
                            if speaker.email:
                                speaker_dict['email'] = speaker.email
                            
                            if speaker.online_profile_link:
                                speaker_dict['online_profile_link'] = speaker.online_profile_link
                            
                            if speaker.image_url:
                                speaker_dict['image_url'] = speaker.image_url
                            
                            speaker_list.append(speaker_dict)
                        
            """
            distinct_program_days_list =\
                Presentation.objects.values('startTime').\
                    extra({'start_date' : "date(startTime)"}).values('start_date').distinct()
            
            program_days = map(lambda x: x['start_date'].strftime("%Y-%m-%dT%H:%M:%S"), 
                                distinct_program_days_list)
            """
            program_dict['data']['program'] =  {#'program_days': program_days,
                                                'sessions' : sessions_list, 
                                                'presentations' : presentation_list,
                                                'speakers': speaker_list,
                                                'presentation_speakers' : presentation_speakers_list
                                               }
            
            serialized_feature.update(program_dict)
        
        return serialized_feature
    
    
    def get_feature_data(self, virtual, filters):
        if 'querytype' in filters:
            if filters['querytype'] in self.QUERY_TYPES:
                if filters['querytype'] == 'presentation':
                    presentation_id = filters.get('presentation_id')
                    if not presentation_id:
                        return None
                    
                    presentation = Presentation.objects.get(id = presentation_id)
                    presentation_dict = {'id' : presentation.id,
                                    'title' : presentation.title,
                                    'sessionId' : presentation.session.id,
                                    'sessionTitle' : presentation.session.title,
                                    'startTime' : presentation.startTime.strftime("%Y-%m-%dT%H:%M:%S"),
                                    'endTime' : presentation.endTime.strftime("%Y-%m-%dT%H:%M:%S"),
                                 }
                    
                    if presentation.abstract:
                        presentation_dict['abstract'] = presentation.abstract
                        
                    return presentation_dict
                
                elif filters['querytype'] == 'speaker':
                    speaker_id = filters.get('speaker_id')
                    if not speaker_id:
                        return None
                    
                    speaker = Speaker.objects.get(id = speaker_id)
                    speaker_dict = {'id': speaker.id,
                                        'first_name': speaker.first_name,
                                        'last_name': speaker.last_name,
                                        'affiliation': speaker.affiliation,
                                        'position': speaker.position
                                        }
                    
                    if speaker.biography:
                        speaker_dict['biography'] = speaker.biography
                            
                    if speaker.email:
                        speaker_dict['email'] = speaker.email
                            
                    if speaker.online_profile_link:
                        speaker_dict['online_profile_link'] = speaker.online_profile_link
                        
                    if speaker.image_url:
                        speaker_dict['image_url'] = speaker.image_url
                        
                    return speaker_dict
                    
            else:
                ## return None if the querytype is un-defined
                return None
        
        else:
            ## return the entire to_serializable data on program features; 
            ## this can be the case when we query for the list of all features on the FeatureResource
            return self.to_serializable(virtual = virtual, include_data = True)['data']
        

######################################### ProgramAnnotation Class #############################################
class ProgramAnnotation(Annotation):
    text = models.TextField()
    presentation = models.ForeignKey('Presentation', related_name = "annotations")
    
    def __init__(self, *args, **kwargs):
        data = kwargs.pop('data', None)
        
        super(ProgramAnnotation, self).__init__(*args, **kwargs)
        
        if not data is None:
            if 'text' in data and 'presentation_id' in data:
                self.text = data['text']
                
                presentation_id = data['presentation_id']
                try:
                    self.presentation = Presentation.objects.get(id = presentation_id)
                except Presentation.DoesNotExist:
                    raise AnnotationException("ProgramAnnotation missing valid program presentation_id")
            else:
                raise AnnotationException("ProgramAnnotation missing text or presentation data")
    
    
    def get_annotation_data(self):
        return { 'text' : self.text }
    
    @classmethod
    def is_annotation_for(cls, category, annotation_data):
        return category == Annotation.PROGRAM
    
    @classmethod
    def get_extra_filters(cls, filters):
        specific_filters = {}
        
        ## just this single case for now
        if "presentation_id" in filters:
            try:
                presentation = Presentation.objects.get(id = filters['presentation_id'])
                specific_filters['id__in'] = [ann.id for ann in ProgramAnnotation.objects.filter(presentation = presentation)]
            except Presentation.DoesNotExist:
                pass
            except Exception:
                pass 
        
        return specific_filters
   

  
###################################### ProgramFeature Model Classes ###########################################
class Session(models.Model):
    title = models.CharField(max_length = 256)
    tag = models.CharField(max_length = 8)
    program = models.ForeignKey(ProgramFeature, related_name = "sessions")
    location = models.ForeignKey(Area, null = False)
    
    def save(self, *args, **kwargs):
        ''' On save, update timestamp for associated program feature'''
        self.program.timestamp = datetime.datetime.now()
        self.program.save()
        super(Session, self).save(*args, **kwargs)
    
    def __unicode__(self):
        return self.title + " @ " + str(self.program)
    

class Presentation(models.Model):
    session = models.ForeignKey(Session, related_name = "presentations")
    speakers = models.ManyToManyField("Speaker", related_name = "presentations")
    
    title = models.CharField(max_length = 256)
    startTime = models.DateTimeField()
    endTime = models.DateTimeField()
    
    abstract = models.TextField(null = True, blank = True)
    tags = fields.TagListField(null = True, blank = True)
    
    def save(self, *args, **kwargs):
        ''' On save, update timestamp for associated program feature'''
        self.session.program.timestamp = datetime.datetime.now()
        self.session.program.save()
        super(Presentation, self).save(*args, **kwargs)
    
    def __unicode__(self):
        return self.title + " >> " + self.session.title

        
class Speaker(models.Model):
    first_name = models.CharField(max_length = 64)
    last_name = models.CharField(max_length = 64)
    affiliation = models.CharField(max_length = 128)
    position = models.CharField(max_length = 64)
    
    biography = models.TextField(null = True, blank = True)
    email = models.EmailField(null = True, blank = True)
    online_profile_link = models.URLField(null = True, blank = True)
    image_url = models.URLField(null = True, blank = True)
    
    class Meta:
        unique_together = ("first_name", "last_name")
        
    def __unicode__(self):
        return self.first_name + " " + self.last_name + " (" + self.position + ", " + self.affiliation + ")"

