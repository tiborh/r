#!/usr/bin/env Rscript

source("common.r")

draw.plot <- function(func.name,fn) {
    x.min <- -10
    x.max <- 10
    x.incr <- 0.1
    x <- seq(x.min,x.max,by=x.incr)
    y <- func.name(x, mean=0, sd=0.5)
    y2 <- func.name(x, mean=0, sd=1.0)
    y3 <- func.name(x, mean=0, sd=2.0)

    png(file=fn)
    plot(x,y)
    points(x,y2,col="red")
    points(x,y3,col="green")
    abline(v=0.5)
    abline(v=1.0,col="red")
    abline(v=2.0,col="green")
    legend("right",c("sd = 0.5","sd = 1.0","sd = 2.0","x = 0.5","x = 1.0","x = 2.0"),
           col=c("black","red","green"),
           pch=c(1,1,1,NA,NA,NA),
           lty=c(0,0,0,1,1,1),
           title="mean = 0"
           )
    dev.off()
}

draw.qplot <- function(func.name,fn) {
    x.min <- 0
    x.max <- 1
    x.incr <- 0.02
    x <- seq(x.min,x.max,by=x.incr)
    y <- func.name(x, mean=0, sd=0.5)
    y2 <- func.name(x, mean=0, sd=1.0)
    y3 <- func.name(x, mean=0, sd=2.0)

    png(file=fn)
    plot(x,y,ylim=c(-5,5))
    points(x,y2,col="red")
    points(x,y3,col="green")
    abline(h=0.5)
    abline(h=1.0,col="red")
    abline(h=2.0,col="green")
    legend("bottomright",c("sd = 0.5","sd = 1.0","sd = 2.0","y = 0.5","y = 1.0","y = 2.0"),
           col=c("black","red","green"),
           pch=c(1,1,1,NA,NA,NA),
           lty=c(0,0,0,1,1,1),
           title="mean = 0"
           )
    dev.off()
}


## based on:
## https://www.tutorialspoint.com/r/r_normal_distribution.htm

fn = file.path(IMG.DIR,"distribution_normal.png")
draw.plot(dnorm,fn)
cat("Normal distribution plot has been written to:",fn,"\n")

fn = file.path(IMG.DIR,"distribtribution_normal_probability.png")
draw.plot(pnorm,fn)
cat("Normal distribution probability plot has been written to:",fn,"\n")

fn = file.path(IMG.DIR,"distribtribution_normal_cummulative_probability.png")
draw.qplot(qnorm,fn)
cat("Normal distribution cummulative probability plot has been written to:",fn,"\n")

x = rnorm(1000)
y = rnorm(1000)
fn = file.path(IMG.DIR,"normal_dist_1.png")
png(file=fn)
plot(x,y,main="normal distribution")
dev.off()
cat("normal distribution scatterplot 1 has been writen to:",fn,"\n")

fn = file.path(IMG.DIR,"normal_dist_2.png")
png(file=fn)
plot(rnorm(2000),main="normal distribution")
dev.off()
cat("normal distribution scatterplot 2 has been writen to:",fn,"\n")

fn = file.path(IMG.DIR,"normal_dist_3.png")
png(file=fn)
barplot(rnorm(100),main="normal distribution")
dev.off()
cat("normal distribution barplot has been writen to:",fn,"\n")

fn = file.path(IMG.DIR,"normal_dist_4.png")
png(file=fn)
hist(rnorm(100),main="normal distribution")
dev.off()
cat("normal distribution histogram 1 has been writen to:",fn,"\n")

fn = file.path(IMG.DIR,"normal_dist_5.png")
png(file=fn)
hist(rnorm(10000),main="normal distribution")
dev.off()
cat("normal distribution histogram 2 has been writen to:",fn,"\n")
