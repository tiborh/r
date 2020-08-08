#!/usr/bin/env Rscript

## ?mtcars

print(str(mtcars))
cat("gears:",levels(factor(mtcars$gear)),"\n")
cat("distribution of gears:\n")
print(table(mtcars$gear))
cat("subset of 5 gears:\n")
print(subset(mtcars,gear==5,c(mpg,cyl,am)))

cat("automatic vs manual\n")
mtcars$am = factor(mtcars$am)
levels(mtcars$am) = c("automatic","manual")
print(table(mtcars$am))
cat("automatic distribution:\n")
print(table(subset(mtcars,am=="automatic",gear)))
cat("full gear distribution:\n")
print(table(subset(mtcars,select=(c(am,gear)))))

cat("using subset for two filters (automatic & 4 gears):\n")
print(subset(mtcars,am=="automatic" & gear==4,c(mpg,cyl)))

## explanation of data set:
## [, 1]  mpg   Miles/(US) gallon
## [, 2]  cyl   Number of cylinders
## [, 3]  disp  Displacement (cu.in.)
## [, 4]  hp    Gross horsepower
## [, 5]  drat  Rear axle ratio
## [, 6]  wt    Weight (1000 lbs)
## [, 7]  qsec  1/4 mile time
## [, 8]  vs    Engine (0 = V-shaped, 1 = straight)
## [, 9]  am    Transmission (0 = automatic, 1 = manual)
## [,10]  gear  Number of forward gears
## [,11]  carb  Number of carburetors
