import redis, sys
from datetime import datetime
from pytz import timezone

server = redis.Redis(host='localhost', port=6379, db=0)

def send_messages(channel_name, message_type):
    while True:
        message = raw_input("What to say: ")
        utc_tz = timezone("UTC")
        timestamp = datetime.now(utc_tz)
        timestamp_str = timestamp.strftime("%Y-%m-%dT%H:%M:%S")
        if message_type == "envived_app_update":
            json_message = {"content" : {"location_uri" : message,  "resource_uri": message, "feature": message, "params": [{"name" : "type", "value" : "new_request"}]}, "type": "envived_app_update", "timestamp" : timestamp_str}
        elif message_type == "envived_event":
            json_message = {"content" : {"facts" : [{"fact_label": "fact_example", "subject_label" : "subject_example", "object_label" : "object_example"}],
                                         "events" : [{"performative": "INSERT", "event_label": "event_example", "subject_label": "subject_example", "object_label": "object_example"},
                                                     {"performative": "DELETE", "event_label": "event_example1", "subject_label": "subject_example1", "object_label": "object_example1"}]},
                            "timestamp": timestamp_str, "type": "envived_event"}

        server.publish(channel_name, json_message)

        if message == 'quit':
            break


if __name__ == "__main__":
    channel_name = sys.argv[1]
    message_type = sys.argv[2]
    send_messages(channel_name, message_type)
