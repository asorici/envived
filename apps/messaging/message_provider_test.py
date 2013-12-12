import redis, sys
from datetime import datetime
from pytz import timezone

server = redis.Redis(host='localhost', port=6379, db=0)

def send_messages(channel_name):
    while True:
        message = raw_input("What to say: ")
        utc_tz = timezone("UTC")
        timestamp = datetime.now(utc_tz)
        timestamp_str = timestamp.strftime("%Y-%m-%dT%H:%M:%S")
        json_message = {"content" : message, "timestamp" : timestamp_str}
        
        server.publish(channel_name, json_message)
    
        if message == 'quit':
            break
    

if __name__ == "__main__":
    channel_name = sys.argv[1]
    send_messages(channel_name)