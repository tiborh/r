Sys.getenv("LOGNAME")                   # login name
Sys.getenv("USER")                      # userid
Sys.info()[7]                           # user
Sys.info()[8]                           # effective_user
class(Sys.getenv())                     # Dlist
class(Sys.info())                       # vector of strings
