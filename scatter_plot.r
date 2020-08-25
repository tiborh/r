#!/usr/bin/env Rscript

source("common.r")

## source:
## https://www.tutorialspoint.com/r/r_scatterplots.htm

fn <- file.path(IMG.DIR,"weight_vs_mileage.png")
png(file = fn)
plot(wt ~ mpg, data=mtcars,main="Weight vs Mileage",ylab="Weight (in thousand lbs)",xlab="Miles per Gallon")
dev.off()
cat("First plot has been written to:",fn,"\n")

fn <- file.path(IMG.DIR,"scatterplot_matrices.png")
pairs(~wt+mpg+disp+cyl,data = mtcars,
      main = "Scatterplot Matrix")
dev.off()
cat("Second plot has been written to:",fn,"\n")
