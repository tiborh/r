#!/usr/bin/env Rscript

source("common.r")

fn <- file.path(DATA.DIR,"JCMB_2015.csv")
if (!file.exists(fn))
    stop("File not found:",fn,"\n")

cat("Time series sucks with real-life data. Best use a proper data.frame.\n")

cat("Processing original dataset:\n")

weather.data <- read.csv(fn)
print(str(weather.data))

cat("Extracting rainfall data from original data:\n")
precip.data <- data.frame(time=as.POSIXlt(weather.data$date.time),rainfall=weather.data$rainfall..mm.)
print(str(precip.data))
cat("a few days only in November may skew the data, so chopped those off\n")
precip.data <- subset(precip.data,precip.data$time<as.POSIXct("2015-11-01 00:00"))
print(str(precip.data))

cat("plotting minute by minute data may take some time:\n")
fn <- file.path(IMG.DIR,"precip_minutely.png")
png(file=fn)
plot(precip.data,main="Rainfall (dot by minute)",pch="*",col="blue")
dev.off()
cat("Minute plot has been written to:",fn,"\n")

## cat("Hourly aggregate:\n")
## precip.hourly <- aggregate(precip.data["rainfall"],list(hour=cut(precip.data$time, breaks="hour")),mean,na.rm=T)
## print(str(precip.hourly))
## plot(precip.hourly,main="Rainfall in 2015 (Jan-Oct, hourly)",pch=20)

cat("Daily aggregate:\n")
precip.daily <- aggregate(precip.data["rainfall"],list(day=cut(precip.data$time, breaks="day")),sum,na.rm=T)
precip.daily$day <- as.POSIXct(precip.daily$day)
print(str(precip.daily))

fn <- file.path(IMG.DIR,"precip_daily_dot.png")
png(file=fn)
plot(precip.daily,main="Rainfall in mm (daily)",pch=20,col="blue")
dev.off()
cat("Daily dot plot has been written to:",fn,"\n")

fn <- file.path(IMG.DIR,"precip_daily_line.png")
png(file=fn)
plot(precip.daily,main="Rainfall in mm (daily)",type="l",lty=1,xlab="2015")
dev.off()
cat("Daily line plot has been written to:",fn,"\n")

precip.monthly <- aggregate(precip.data["rainfall"],list(month=cut(precip.data$time, breaks="month")),sum,na.rm=T)
precip.monthly$month <- as.POSIXct(precip.monthly$month)
print(str(precip.monthly))

precip.ts <- ts(precip.monthly$rainfall,start=c(2015,1),end=c(2015,10),frequency=12)
fn <- file.path(IMG.DIR,"precip_monthly_timeseries.png")
png(file=fn)
plot(precip.ts,main="Rainfall (Jan-Oct)",xlab="2015",ylab="Rainfall in mm") # even here, it sucks
dev.off()
cat("Monthly timeseries plot has been written to:",fn,"\n")

precip.vect <- precip.monthly$rainfall
names(precip.vect) <- month.abb[1:10]
print(str(precip.vect))
fn <- file.path(IMG.DIR,"precip_monthly_barplot.png")
png(file=fn)
barplot(precip.vect,main="Rainfall",ylab="rainfall in mm",xlab="2015")
dev.off()
cat("Monthly timeseries plot has been written to:",fn,"\n")
