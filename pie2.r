#!/usr/bin/env Rscript

source("common.r")

get.names <- function() {
    fn.cities.path <- file.path(Sys.getenv("HOME"),"repos","world-cities","data","world-cities.csv")
    url <- "https://github.com/datasets/world-cities/raw/master/data/world-cities.csv"
    if (!file.exists(fn.cities.path))
        cities.df <- read.csv(url)
    else
        cities.df <- read.csv(fn.cities.path)

    return(list(cities=cities.df$name,countries=unique(cities.df$country)))
}

## based on:
## https://www.tutorialspoint.com/r/r_pie_charts.htm
the.names <- get.names()
cities <- the.names$cities
countries <- the.names$countries
## str(cities)
## sample(cities,5)

fn <- file.path(IMG.DIR,"cities_pie.png")
png(file = fn)
pie(sample(1:100,5),sample(cities,5),main="Five Cities")
dev.off()
cat("first pie has been written to:",fn,"\n")

## Create data for the graph.
x <- sample(1:100,5)
names(x) <- sample(cities,5)

piepercent<- paste0(as.character(round(100*x/sum(x), 1)),"%")

## Give the chart file a name.
fn1 <- file.path(IMG.DIR,"city_percentage_legends.png")
png(file = fn1)

## Plot the chart.
pie(x, labels = piepercent, main = "City Pie Chart",col = rainbow(length(x)))
legend("topright", names(x), cex = 0.8,
   fill = rainbow(length(x)))

## Save the file.
dev.off()
cat("Second pie has been written to:",fn1,"\n")

stop.if.not.installed("plotrix")
x <- sample(1:100,5)
names(x) <- sample(countries,5)

fn2 <- file.path(IMG.DIR,"3d_pie_chart.png")
png(file = fn2)

pie3D(x,labels = names(x),explode = 0.1, main = "Pie Chart of Countries ")

dev.off()
cat("Third pie has been written to:",fn2,"\n")
