#!/usr/bin/env Rscript

library(ggplot2)
library(scales)

# setting the defaults:
NUM.OF.WEEKS = 12
WEEK.MULTIPLIER = 7
NUM.OF.DATA = NUM.OF.WEEKS * WEEK.MULTIPLIER
MAX.NUM = 100

## generating the data
the.dates <- seq.Date(Sys.Date()-(NUM.OF.DATA-1), by = "day", length.out = NUM.OF.DATA)
the.data <- sample(1:MAX.NUM,size=NUM.OF.DATA,replace=T)
is.odd <- (the.data %% 2 != 0)
data.df <- data.frame(Date = the.dates, Quantity = the.data, Oddness = is.odd)
str(data.df)

## quick view:
plot(data.df$Date,data.df$Quantity,main="Sample Data",col=factor(data.df$Oddness))
qplot(Date,Quantity,data=data.df,main="Sample Data",xlab="Date",ylab="Quantity",colour=Oddness)

data.df$Month <- as.Date(cut(data.df$Date,
  breaks = "month"))
data.df$Week <- as.Date(cut(data.df$Date,
  breaks = "week",
  start.on.monday = T))

library(dplyr)
data.df %>% group_by(Oddness) %>% summarise(n())

str(data.df)

##ggplot(data = data.df, aes(Month, Quantity,fill=Oddness)) + geom_bar(stat="identity")#+

## graph by month:
ggplot(data = data.df, aes(Month, Quantity,fill=Oddness)) +
    ## adds up all observations for the month  or "line"
##    stat_summary(fun.y = sum, geom = "bar",position=position_dodge(width=10)) +
##    stat_summary(fun.y = sum, geom = "bar",position="dodge") +
    stat_summary(fun.y = sum, geom = "bar",position=position_jitterdodge()) +
    ## custom x-axis labels
    scale_x_date(labels = date_format("%Y-%m"), date_breaks = "1 month")

ggplot(data = data.df, aes(Week, Quantity,fill=Oddness)) +
    ## adds up all observations for the month  or "line"
##    stat_summary(fun.y = sum, geom = "bar",position=position_dodge()) +
    stat_summary(fun.y = sum, geom = "bar",position=position_stack()) +
    ## custom x-axis labels
    scale_x_date(labels = date_format("%W"), date_breaks = "1 week")
