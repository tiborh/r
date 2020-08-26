#!/usr/bin/env Rscript

source("common.r")

## based on:
## https://www.tutorialspoint.com/r/r_multiple_regression.htm

multi.predict <- function(vals,coeffs) {
    stop.if.not.installed("testit")
    assert(length(vals)+1==length(coeffs))
    return(coeffs[1]+sum(vals*coeffs[2:4]))
}

cat("Multiple regression on mtcars.\n")
cat("1. Have a look at a matrix diagram of non-discrete variables:")

fn = file.path(IMG.DIR,"regression_multiple_on_mtcars.png")
png(file=fn)
plot(mtcars[,c("mpg","disp","hp","drat","wt","qsec")])
dev.off()
cat("matrix plot has been written to:",fn,"\n")

cat("The same can we examined with correlation:\n")
print(plot(mtcars[,c("mpg","disp","hp","drat","wt","qsec")]))
cat("The three most probable candidates are: disp, hp, and wt\n")

input <- mtcars[,c("mpg","disp","hp","wt")]
print(str(input))
print(summary(input))

cat("Creating the model and printing a summary of it:\n")
model <- lm(mpg~disp+hp+wt, data = input)
print(model)
print(summary(model))

cat("Coefficients of the model:\n")
coeffs <- coef(model)
print(coeffs)

cat("Parameters of a hypothetical car:\n")
car.params <- c(disp = 221, hp = 102, wt = 2.91)
print(car.params)

hyp.mpg <- multi.predict(car.params,coeffs)
cat("The hypothetical mpg value based on the model:",hyp.mpg,"\n")
