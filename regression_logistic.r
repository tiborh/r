#!/usr/bin/env Rscript

source("common.r")

## based on:
## https://www.tutorialspoint.com/r/r_logistic_regression.htm

cat("glm() or logistic regression is for categorical values.\n")
cat("1. Have a look at a matrix of some variables:")

## input <- mtcars[,c("am","gear","mpg","disp","drat","wt")]
input1 <- mtcars[,c("am","cyl","hp","wt")]
## input2 <- mtcars[,c("am","hp","wt","drat")]

fn = file.path(IMG.DIR,"regression_logistic_on_mtcars.png")
png(file=fn)
plot(input1)
dev.off()
cat("matrix plot has been written to:",fn,"\n")

print(str(input1))
print(summary(input1))

## am.data0 = glm(formula = am ~ mpg + cyl + disp + hp + drat + wt + qsec + vs + gear + carb, data = mtcars, family = binomial)
## am.data = glm(formula = am ~ gear + mpg + disp + drat + wt, data = input, family = binomial)
am.data1 = glm(formula = am ~ cyl + hp + wt, data = input1, family = binomial)
## am.data2 = glm(formula = am ~ gear + mpg + drat, data = input, family = binomial)
## am.data3 = glm(formula = am ~ hp + wt + drat, data = input2, family = binomial)

## all the others had one or both of the warnings below:
## Warning messages:
## 1: glm.fit: algorithm did not converge 
## 2: glm.fit: fitted probabilities numerically 0 or 1 occurred 

## print(summary(am.data0))
## print(summary(am.data))
print(summary(am.data1))
## print(summary(am.data2))
## print(summary(am.data3))

cat("only weight seems to be empacting the model\n")
