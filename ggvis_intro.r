library(ggvis)
## General documentation:
##   https://cran.r-project.org/web/packages/ggvis/ggvis.pdf

## example
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()
mtcars %>% ggvis(~disp, ~mpg) %>% layer_points()
plot(mpg ~ disp, data=mtcars)

## fill:
mtcars %>% ggvis(~wt, ~mpg, fill := "blue") %>% layer_points() # blue points instead of black
plot(mpg ~ disp, data=mtcars, col="blue")

## smooths (instead of points):
mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths() # line instead of points
fit <- lm(mtcars$mpg ~ mtcars$disp)
plot(fit)

## adding smooths, not as a replacement
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>% layer_smooths()
plot(mpg ~ disp, data=mtcars)
abline(fit)
?plot

## levels:

cols3 <- c("red","green","blue")

plot(mpg ~ disp, data=mtcars, col=cols3)
legend("topright",levels(factor(mtcars$gear)),pch=1,col=cols3,inset=.02,title="gear")
?legend
       
## the grammar of graphics:
## 1. the dataset (what?)
## 2. coordinate system (where?)
## 3. put marks into the cs (what marks?)
## 4. properties (how?) (e.g. what colour? groups?)
## ...

## examples:
## points vs bars vs lines
pressure %>% ggvis(~temperature, ~pressure) %>% layer_points()
pressure %>% ggvis(~temperature, ~pressure) %>% layer_bars()
pressure %>% ggvis(~temperature, ~pressure) %>% layer_lines()

## temperature levels:
pressure %>% ggvis(~temperature, ~pressure) %>% layer_points(fill= ~temperature)
## size by pressure:
pressure %>% ggvis(~temperature, ~pressure) %>% layer_points(size = ~pressure)
## both?
pressure %>% ggvis(~temperature, ~pressure) %>% layer_points(fill= ~temperature, size = ~pressure) # legend gets mixed up

## the supported way:
library(dplyr)
mtcars2 <- mtcars %>% dplyr::mutate(cyl = ordered(mtcars$cyl))

mtcars2 %>% ggvis(~mpg, ~wt, size = ~cyl, fill = ~cyl) %>% layer_points() %>%
  add_legend(c("size", "fill"))

## trying again with those (same messy result, only add_legend messing around helps):
pressure %>%
    ggvis(~temperature, ~pressure) %>%
    layer_points(size = ~pressure, fill = ~temperature) %>%
    add_legend("size", properties = legend_props(legend = list(y = 50))) # this is the solution

## one more, complex example:
faithful %>% 
    ggvis(~waiting, ~eruptions, fill := "red") %>% 
    layer_points() %>% 
    add_axis("y", title = "Duration of eruption (m)", 
             values = c(2, 3, 4, 5), subdivide = 9) %>% 
    add_axis("x", title = "Time since previous eruption (m)")

