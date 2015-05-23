## Date class for Dates
## POSIXct (seconds since null point) and
## POSIXlt (represented as a list) classes for time

## functions on date and time:
## weekdays, months, quarters

o <- as.Date("1969-12-31")
x <- as.Date("2014-10-09")
print(x)                                # looks like string
print(o)
class(x)
unclass(x)                              # days since null point
unclass(o)                              # -1

x <- Sys.Date()
print(x)
y <- Sys.time()
print(y)

print(.leap.seconds)
print(weekdays(.leap.seconds))

ylt <- as.POSIXlt(y)
class(ylt)
names(unclass(ylt))
ylt$sec
if (Sys.getenv("TZ") == "") {
    if (ylt$isdst == 1)
        Sys.setenv(TZ="CEST")
    else
        Sys.setenv(TZ="CET")
}
sprintf("%s %d-%02d-%02d %02d:%02d:%02.0f %s",weekdays(ylt),1900+ylt$year,ylt$mon,ylt$mday,ylt$hour,ylt$min,ylt$sec,Sys.timezone())
print(months(ylt))
print(quarters(ylt))
library(lubridate)
strftime(ylt,format="%W")               # one week minus in 2015, format time
x <- "12 January 2012 10:40"
y <- strptime(x,"%d %B %Y %H:%M")            # convert to ISO standard, print time
class(x)
class(y)

z <- as.Date("2012-12-12")
a <- y-as.POSIXlt(z)
print(a)
class(a)

x <- as.POSIXlt(Sys.time())
y <- as.POSIXlt(Sys.time(),tz="EST")    # to check time in another time zone
x-y                                     # the difference between execution of the two
