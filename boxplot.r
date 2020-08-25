#!/usr/bin/env Rscript

source("common.r")

## source:
## https://www.tutorialspoint.com/r/r_boxplots.htm

fn <- file.path(IMG.DIR,"boxplot.png")

## Give the chart file a name.
png(file = fn)

## Plot the chart.
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
   ylab = "Miles Per Gallon", main = "Mileage Data")

## Save the file.
dev.off()
cat("First plot has been written to:",fn,"\n")

## some further ideas:

## boxplot(mpg ~ gear, data=mtcars, varwidth=T)
## boxplot(mpg ~ am, data=mtcars, names=c("automatic","manual"))
## boxplot(mpg ~ vs, data=mtcars, names=c("V-Shaped","Linear"))

## Give the chart file a name.
fn <- file.path(IMG.DIR,"boxplot_with_notch.png")
png(file = fn)

# Plot the chart.
boxplot(mpg ~ cyl, data = mtcars, 
   xlab = "Number of Cylinders",
   ylab = "Miles Per Gallon", 
   main = "Mileage Data",
   notch = TRUE, 
   varwidth = TRUE, 
   col = c("green","yellow","purple"),
   names = c("High","Medium","Low")
)
# Save the file.
dev.off()
cat("Second plot has been written to:",fn,"\n")
