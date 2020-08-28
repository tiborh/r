#!/usr/bin/env Rscript

## source("common.r")

## based on:
## https://www.tutorialspoint.com/r/r_analysis_of_covariance.htm

print(str(mtcars))

cat("\nStep 1: looking at all variables:\n")
model1 <- aov(mpg ~ cyl*disp*hp*drat*wt*qsec*vs*am*gear*carb,data=mtcars)
print(summary(model1))
## no relationship

cat("\nStep 2: looking at the other model:\n")
model2 <- aov(mpg ~ cyl+disp+hp+drat+wt+qsec+vs+am+gear+carb,data=mtcars)
print(summary(model2))
## cyl == 0.001, wt == 0.01, drat == 0.05

cat("\nStep3: narrowing down both models to the apparently significant variables:\n")
model1b <- aov(mpg ~ cyl*drat*wt,data=mtcars)
print(summary(model1b))
## cyl == 0.001, wt == 0.001, drat == 0.1

model2b <- aov(mpg ~ cyl+drat+wt,data=mtcars)
print(summary(model2b))
## cyl == 0.001, wt == 0.001

cat("\nStep4: weeding out the last loosest:\n")
model1c <- aov(mpg ~ cyl*wt,data=mtcars)
print(summary(model1c))
## cyl == 0.001, wt == 0.001, cyl:wt == 0.05

model2c <- aov(mpg ~ cyl+wt,data=mtcars)
print(summary(model2c))
## cyl == 0.001, wt == 0.001

cat("\nComparing the two models:\n")
print(anova(model1c,model2c))
## model 2 seems to be better, with a 0.05 P value

