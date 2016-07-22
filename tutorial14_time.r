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
    print(paste(i,"==",l[[i]]))
## "1 == 43.8681268692017"              # seconds
## "2 == 44"                            # minutes
## "3 == 16"                            # hours (24-based)
## "4 == 7"                             # day of the month (1-31)
## "5 == 6"                             # month of the year (0-11)
## "6 == 116"                           # years since 1900
## "7 == 4"                             # day of the week 0 is Sunday
## "8 == 188"                           # day of the year (0-365)
## "9 == 1"                             # is daylight saving on?

help(strftime)
timeStamp <-  strftime(t,"%F %T")
## %F: Equivalent to %Y-%m-%d (the ISO 8601 date format).
## %T: Equivalent to ‘%H:%M:%S’.
timeStamp
strftime(t,"%a, %b, %A, %B")               # day and month
## %a: shortened dayname
## %b: shortened monthname
## %A: full dayname
## %B: full monthname
strftime(t,"week %V")
strftime(t,"%c")                        # date string
## same as "date" in linux
strftime(t,"%x %X")                     # locale specific date and time
strftime(t,"UTC %z, %Z")                # %z: offset from UTC
                                        # %Z: timezone abbrev


myData <- data.frame(time=c("2014-01-23 14:28:21","2014-01-23 14:28:55",
                            "2014-01-23 14:29:02","2014-01-23 14:31:18"),
                     speed=c(2.0,2.2,3.4,5.5))
str(myData)                             # time is factorised
summary(myData)                         # time is listed
typeof(myData$time[1])                  # "integer"
myData$time <- strptime(myData$time,"%F %T")
str(myData)                             # time is POSIXlt
summary(myData)                         # time is summarised
typeof(myData$time[1])                  # "list"
myData$time[1][[1]]                     # 21
myData$time[1][[2]]                     # 28
myData$time[1][[3]]                     # 14
myData$time[1][[4]]                     # 23
## ...
length(myData$time)                     # 4
N = length(myData$time)
myData$time[2:N]                        # 2:4
myData$time[1:(N-1)]                    # 1:3
tdiff <- myData$time[2:N] - myData$time[1:(N-1)]
class(tdiff)                            # "difftime"
str(tdiff)                              # atomic [1:3] 34 7 136

## "2014-01-23 14:28:55" - "2014-01-23 14:28:21" ==  34
## "2014-01-23 14:29:02" - "2014-01-23 14:28:55" ==   7
## "2014-01-23 14:31:18" - "2014-01-23 14:29:02" == 136

## as.Date and diff in days:

theDates <- c("1 jan 2012","1 jan 2013","1 jan 2014")
dateFields <- as.Date(theDates,"%d %b %Y")
typeof(dateFields)                      # [1] "double"
class(dateFields[1])                    # "Date"
dateFields # [1] "2012-01-01" "2013-01-01" "2014-01-01"
N <- length(dateFields)
diff <- dateFields[1:(N-1)] - dateFields[2:N]
diff                                    # -366 -365

## days after "origin"
infamy <- as.Date(-179,origin="1942-06-04")
infamy                                  # [1] "1941-12-07"
today <- Sys.Date()
today
diff <- today-infamy                   # Time difference of 27241 days
diff > 3                               # TRUE

## one more example:
theTime <- Sys.time()
theTime                                 # "2016-07-07 17:37:09 CEST"

a <- rexp(1,0.1)
a
cat("At about",format(theTime,"%H:%M"),"the time between occurances was around",format(a,digits=3),"seconds\n")

## Time Operations

now <- Sys.time()
now
now+60                                  # 60 seconds more
earlier <- strptime("2000-01-01 00:00:00","%F %T")
earlier                                 #  "2000-01-01 CET"
later <- strptime("2000-01-01 00:00:20","%F %T")
later                                   # "2000-01-01 00:00:20 CET"
diff <- later-earlier                   # Time difference of 20 secs
as.double(diff)                         # 20

earlier <- strptime("2000-01-01 00:00:00","%F %T")
later <- strptime("2000-01-01 01:00:00","%F %T")
diff <- later-earlier
diff                                    # 1 hour
as.double(diff)                         # 1

up <- as.Date("1961-08-13")
down <- as.Date("1989-11-9")
diff <- down-up
diff                                    # 10315 days

help(difftime)
difftime(up,down)                       # -10315 days
difftime(up,down,units="weeks")         # -1473.571 weeks

as.difftime(c("0:3:20", "11:23:15"))    # [1]   3.333333 683.250000

diff <- as.difftime("00:30:00","%H:%M:%S",units="hour")
diff                                    # 0.5 hours
Sys.time()+diff                         # 30 mins later than now

?seq.Date
seq(as.Date("1910/1/1"), as.Date("1999/1/1"), "years") # each year between
seq(as.Date("2000/1/1"), by = "month", length.out = 12) # twelve months

st <- as.Date("1998-12-17")
en <- as.Date("2000-1-7")
ll <- seq(en, st, by = "-1 month")
ll
rev(ll[ll > st & ll < en])
