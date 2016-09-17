Sys.getenv()                            # the whole stuff
home_directory <- Sys.getenv("HOME")    # /home/{userid}
path.expand("~")                        # same
file.path("~")                          # ~
file.exists("~")                        # T
file.exists(file.path("~","documents")) # T
