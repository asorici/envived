import imp, os
from path import path
current_dir_path = path(__file__).abspath().dirname()

for api_mod_path in current_dir_path.walk(pattern="api.py", errors="ignore"):
    api_mod_name = ".".join(current_dir_path.dirname().relpathto(api_mod_path).stripext().split(os.path.sep)) 
    print "Things : Importing : ", api_mod_name
    try:
        __import__(api_mod_name)
    except ImportError, e:
        print "Module %s not found." %(api_mod_name), e
