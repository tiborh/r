#!/usr/bin/env Rscript

source("common.r")
fn <- file.path(IMG.DIR,"histogram.png")
png(file = fn)
hist(sample(1:7,100,replace=T),breaks=7,col="yellow",border="orange")
dev.off()
cat("First plot has been written to:",fn,"\n")

## based on:
## https://www.tutorialspoint.com/r/r_histograms.htm
fn <- file.path(IMG.DIR,"histogram_lim_breaks.png")
png(file = fn)
hist(women$weight,xlab = "Weight",col = "green",border = "red", xlim = c(110,170), ylim = c(0,4),breaks=7)
dev.off()
cat("Second plot has been written to:",fn,"\n")
