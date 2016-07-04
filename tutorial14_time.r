## POSIXct for seconds since epoch start
## POSIXlt for vector:
##   1 seconds
##   2 minutes
##   3 hours
##   4 day of month (1-31)
##   5 month of the year (0-11)
##   6 years since 1900
##   7 day of the week (0-6 where 0 represents Sunday)
##   8 day of the year (0-365)
##   9 Daylight savings indicator (positive if it is daylight savings)
##  printed out result is different from how it is stored internally

help(DateTimeClasses)
t <- Sys.time()
typeof(t)                               # double
class(t)                                # "POSIXct" "POSIXt"
print(t)                                # printed as a string
cat(t,"\n")                             # seconds
str(t)                                  # POSIXct[1:1], format: "2016-07-03 23:45:39"

## conversion
l <- as.POSIXlt(t)
print(l)                                # looks the same
typeof(l)                               # list
class(l)                                # "POSIXlt" "POSIXt"
str(l)                                  #  POSIXlt[1:1], format: "2016-07-03 23:45:39"
names(l)                                # NULL
for(i in 1:9)
    print(l[[i]])

help(strftime)
timeStamp <-  strftime(t,"%F %T")
timeStamp
strftime(t,"%a, %b, %A, %B")               # day and month
strftime(t,"week %V")
strftime(t,"%c")                        # date string
strftime(t,"%x %X")                     # locale specific
strftime(t,"UTC %z, %Z")
