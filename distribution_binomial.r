#!/usr/bin/env Rscript

source("common.r")

## based on:
## https://www.tutorialspoint.com/r/r_binomial_distribution.htm

draw.plot <- function(func.name,fn) {
    x.min <- 0
    x.max <- 50
    x.incr <- 1
    x <- seq(x.min,x.max,by=x.incr)
    p <- 0.5
    y <- func.name(x,0,p)
    y1 <- func.name(x,1,p)
    y2 <- func.name(x,10,p)
    y3 <- func.name(x,25,p)
    y4 <- func.name(x,50,p)
    y5 <- func.name(x,100,p)

    png(file=fn)
    plot(x,y,main=paste0("Binomial Distribution (p=",p,")"))
    points(x,y1,col="orange")
    points(x,y2,col="red")
    points(x,y3,col="magenta")
    points(x,y4,col="green")
    points(x,y5,col="blue")
    legend("right",c("0","1","10","25","50","100"),
           col=c("black","orange","red","magenta","green","blue"),
           pch=1,
           title="number of trials"
           )
    dev.off()
}

draw.plot2 <- function(func.name,fn) {
    x.min <- 0
    x.max <- 50
    x.incr <- 1
    x <- seq(x.min,x.max,by=x.incr)
    s <- 50
    y <- func.name(x,s,0.1)
    y1 <- func.name(x,s,0.25)
    y2 <- func.name(x,s,0.5)
    y3 <- func.name(x,s,0.75)
    y4 <- func.name(x,s,0.9)

    png(file=fn)
    plot(x,y,main=paste0("Binomial Distribution (size=",s,")"))
    points(x,y1,col="orange")
    points(x,y2,col="red")
    points(x,y3,col="magenta")
    points(x,y4,col="blue")
    legend("top",c("0.1","0.25","0.5","0.75","0.9"),
           col=c("black","orange","red","magenta","blue"),
           pch=1,
           title="Probability"
           )
    dev.off()
}


fn = file.path(IMG.DIR,"distribution_binomial1.png")
draw.plot(dbinom,fn)
cat("Binomial distribution plot 1 has been written to:",fn,"\n")

fn = file.path(IMG.DIR,"distribution_binomial2.png")
draw.plot2(dbinom,fn)

cat("\nBinomial distribution plot 2 has been written to:",fn,"\n")

cat("\nProbability of getting 26 or less heads from a 51 tosses of a coin:",pbinom(26,51,0.5),"\n")

cat("\nHow many heads will have a probability of 0.25 will come out when a coin is tossed 51 times?",qbinom(0.25,51,1/2),"\n")

cat("\nFind 8 random values from a sample of 150 with probability of 0.4:\n")
print(rbinom(8,150,.4))
