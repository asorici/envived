import redis, sys

server = redis.Redis(host='localhost', port=6379, db=0)

def send_messages(channel_name):
    while True:
        message = raw_input("What to say: ")
        server.publish(channel_name, message)
    
        if message == 'quit':
            break
    

if __name__ == "__main__":
    channel_name = sys.argv[1]
    send_messages(channel_name)