"""
Each Feature must send its `fact' serialization to the agent module upon startup.
Likewise, it must provide a function to call when an update to the feature is created, such that the new
fact can be transmitted to the agent.
"""
def send_initial_facts():
    pass

def send_facts(sender, instance, created, **kwargs):
    pass
