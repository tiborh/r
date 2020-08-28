#!/usr/bin/env Rscript

source("common.r")

## based on:
## https://www.tutorialspoint.com/r/r_nonlinear_least_square.htm

## Give the chart file a name.
fn <- file.path(IMG.DIR,"nls.png")
png(file = fn)

xvalues <- c(1.6,2.1,2,2.23,3.71,3.25,3.4,3.86,1.19,2.21)
yvalues <- c(5.19,7.43,6.94,8.11,18.75,14.88,16.06,19.12,3.21,7.58)

## Plot these values.
plot(xvalues,yvalues,main="Original Values")

## Take the assumed values and fit into the model.
model <- nls(yvalues ~ b1*xvalues^2+b2,start = list(b1 = 1,b2 = 3))

## Plot the chart with new data by fitting it to a prediction from 100 data points.
new.data <- data.frame(xvalues = seq(min(xvalues),max(xvalues),len = 100))
lines(new.data$xvalues,predict(model,newdata = new.data))

## Save the file.
dev.off()
cat("Plot written to:",fn,"\n")

## Get the sum of the squared residuals.
cat("Sum of the squared residuals:",sum(resid(model)^2),"\n")

cat("Get the confidence intervals on the chosen values of the coefficients.\n")
print(confint(model))
