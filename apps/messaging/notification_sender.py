'''
Created on Oct 17, 2013

@author: alex
'''
import simplejson
import gevent, redis, Queue
from gevent import queue
from django.http import HttpResponse
from django.views.generic import View
from django.conf import settings


ENVIVED_PROXY_HOST = "localhost:8080"
ENVIVED_MAIN_HOST = "127.0.0.1:8001"
FORWARDED_FOR_SERVER_ADRESS = "127.0.0.1"

class NotificationHandler(View):
    QUEUE_SIZE = 100
    REDIS_HOST = "localhost"
    REDIS_PORT = 6379
    QUIT_LISTENING = "quit"

    def __init__(self):
        self.subscriber_per_user = {}
        self.fetcher_per_user = {}
        self.queues_per_user = {}
        self.redis_server = redis.Redis(host=self.REDIS_HOST, port=self.REDIS_PORT, db=0)
        
    
    def process_redis_messages(self, notification_subscriber, user_id):
        # print notification_subscriber.channels
        messages = notification_subscriber.listen()
        
        while True:
            message = messages.next()
            # print "Saw: %s" % message['data']
            if message['data'] == self.QUIT_LISTENING:
                break
            else:
                for q in self.queues_per_user[user_id]:
                    size = self.redis_server.rpush(q, message)
                    if size > self.QUEUE_SIZE:
                        self.redis_server.ltrim(size - self.QUEUE_SIZE, size - 1)
            
    
    def update_notifications(self, request):
        if not request.user.is_anonymous():
            user_id = request.user.id
            combined_key = str(user_id) + "-" + request.META['REMOTE_ADDR']
            
            print "User: ", request.user.email, request.user.username, request.user.id, request.META['REMOTE_ADDR']
            # print request.META
            
            if not self.subscriber_per_user.has_key(user_id):
                ## 1) Create an entry in the queue_per_user dict for the current client+IP combination
                self.queues_per_user[user_id] = [ combined_key ]
                
                ## 2) Spawn a Listener Greenlet to retrieve messages from the pubsub queue of the user_id and
                ##    put them in all user_id+IP matching lists
                user_notification_subscriber = self.redis_server.pubsub()
                user_notification_subscriber.subscribe(str(user_id))
                
                user_notification_fetcher = gevent.spawn(self.process_redis_messages,
                                                         user_notification_subscriber,
                                                         user_id)
                self.subscriber_per_user[user_id] = user_notification_subscriber
                self.fetcher_per_user[user_id] = user_notification_fetcher
            else:
                if not combined_key in self.queues_per_user[user_id]:
                    ## In this case just create another entry for the new user_id+IP combination
                    self.queues_per_user[user_id].append(combined_key)
                    
            message_list = []
            message = self.redis_server.lpop(combined_key)
            while message is not None:
                message_list.append(message)
                message = self.redis_server.lpop(combined_key)
            
            ## if there were no pending messages block for one
            if not message_list:
                message = self.redis_server.blpop(combined_key, settings.RETRIEVE_MESSAGE_TIMEOUT)
                if message is not None:
                    message_list.append(message[1])
            
            return new_notifications_response(request, message_list)
            
        return access_forbidden_response(request, "Anonymous users not allowed.") 
    
    
    def cancel_notifications(self, request):
        if request.META['HTTP_HOST'] != ENVIVED_MAIN_HOST:
            return access_forbidden_response(request, "External unsubscribe request not allowed.")
        
        if request.method.upper() == "POST" and not request.user.is_anonymous(): 
            user_id = request.user.id
            if self.queues_per_user.has_key(user_id):
                self.subscriber_per_user[user_id].close()
                self.fetcher_per_user[user_id].kill(block=False)
                del self.queues_per_user[user_id]
                
                return unsubscribe_ok_response(request)
            else:
                return bad_request_response(request, "No subscription exits for channel: " + str(user_id))
        else:
            return bad_request_response(request, "Unspecified channel name for notification cancellation.")
    

handler = NotificationHandler()
update_notifications = handler.update_notifications
cancel_notifications = handler.cancel_notifications


def json_response(response, status_code, **kwargs):
    kwargs.setdefault('content_type', 'application/json; charset=UTF-8')
    http_response = HttpResponse(simplejson.dumps(response), **kwargs)
    http_response.status_code = status_code
    return http_response

def unsubscribe_ok_response(request):
    response = {"success": True, "code": 200, "data" : {}}
    return json_response(response, 200)


def new_notifications_response(request, message_list):
    response = {"success": True, "code": 200, "data" : {"messages" : message_list}}
    return json_response(response, 200)


def access_forbidden_response(request, msg):
    response = {"success": False, "code": 403, "data" : {"msg" : msg}}
    return json_response(response, 403)


def bad_request_response(request, msg):
    response = {"success": False, "code": 400, "data" : {"msg" : msg}}
    return json_response(response, 400)
