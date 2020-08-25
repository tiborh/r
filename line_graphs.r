#!/usr/bin/env Rscript

source("common.r")

fn <- file.path(IMG.DIR,"us_population.png")
png(file = fn)
plot(uspop,main="US Population",ylab="Population Size (in million)",xlab="Year")
dev.off()
cat("First plot has been written to:",fn,"\n")

fn <- file.path(IMG.DIR,"us_women.png")
png(file = fn)
plot(women,type="o")
dev.off()
cat("Second plot has been written to:",fn,"\n")

fn <- file.path(IMG.DIR,"line_chart.png")
png(file = fn)
plot(sample(1:40,5,replace=T),type="o",col="red")
dev.off()
cat("Third plot has been written to:",fn,"\n")

fn <- file.path(IMG.DIR,"multiple_line_chart.png")
png(file = fn)
a <- sample(1:40,5,replace=T)
b <- sample(1:40,5,replace=T)
plot(a,type="o",col="red",ylim=c(min(c(a,b)),max(c(a,b))),ylab="Values",main="Important Data")
lines(b,type="o",col="blue")
dev.off()
cat("Fourth plot has been written to:",fn,"\n")
