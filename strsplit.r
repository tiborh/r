aString <- "one_two_20160915.txt"
strsplit(aString,"_")                   # simplest case
strsplit(aString,".")                   # does not work
strsplit(aString,"[.]")                 # much better
strsplit(aString,"[_.]")                # split by two
