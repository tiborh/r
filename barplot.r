#!/usr/bin/env Rscript

source("common.r")

## based on:
## https://www.tutorialspoint.com/r/r_bar_charts.htm

main.title <- "Important Data"
x.val <- "When?"
y.val <- "How many?"
the.months <- month.abb[3:7]

fn <- file.path(IMG.DIR,"barchart.png")
png(file=fn)
max.val <- 100
barplot(sample(1:max.val,5),
        names.arg=the.months,
        xlab=x.val,ylab=y.val,main=main.title,
        col="cornflowerblue",border="darkblue")
## for colour reference:
## http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
dev.off()
cat("first plot has been written to:",fn,"\n")

the.regions <- c("North","South","East","West")
the.colours <- c("cyan","magenta","yellow","cornflowerblue")

the.vals <- matrix(sample(1:30,20,replace=T),nrow=length(the.regions),ncol=length(the.months),byrow=T)
fn <- file.path(IMG.DIR,"barchart_stacked.png")

png(file=fn)
barplot(the.vals,names.arg=the.months,
        xlab=x.val,ylab=y.val,main=main.title,
        ylim=c(0,max.val),col=the.colours)
legend("topleft", the.regions, cex = 1.3, fill = the.colours)
dev.off()
cat("Second plot has been written to:",fn,"\n")
