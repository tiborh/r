#!/usr/bin/env Rscript

## source("common.r")

## based on:
## https://www.tutorialspoint.com/r/r_poisson_regression.htm

print(str(warpbreaks))                  # warp is the longitudinal thread
print(summary(warpbreaks))

output <- glm(formula = breaks ~ wool+tension, data = warpbreaks,
              family = poisson)

print(output)
print(summary(output))
