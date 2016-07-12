subset(mtcars, disp > 400)              # no $ is needed.
disp <- 100
subset(mtcars, disp > 400)              # here, it may be confusing

displ <- 1                              # no effect inside ggplot
cty <- 3
library(ggplot2)
ggplot(mpg, aes(displ,cty)) + geom_point() # data fields are identified without $ or ~

library(dplyr)
disp.threshold <- 400
filter(mtcars, disp > disp.threshold)

## these may cause problems inside functions

## what to do?

## check their existence in names()

"disp" %in% names(mtcars)               # T
## opposite:
!"disp" %in% names(mtcars)              # F

help.search("%")
