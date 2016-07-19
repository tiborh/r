library(ggvis)
## smooths was the first introduced in ggvis_lines.r

## some others:
##   model_predictions
##   bars
##   histograms
##   densities
## they are usually called in the background

## histograms (width is guessed):
faithful %>% ggvis(~waiting) %>% layer_histograms()
## bin width is set:
faithful %>% ggvis(~waiting) %>% layer_histograms(width=5)

## inside histograms, the following provides data:
faithful %>% compute_bin(~waiting)      # Guessing width = 2 # range / 27
faithful %>% compute_bin(~waiting,width=5)

## The full chain:
faithful %>%
    compute_bin(~waiting,width=5) %>%
    ggvis(x = ~xmin_, x2 = ~xmax_, y = 0, y2 = ~count_) %>%
    layer_rects()


## Density plots (a smoother version of the histogram):
faithful %>% ggvis(~waiting) %>% layer_densities(fill:="green")


## shortcuts:
## long form:
mtcars %>% 
    compute_count(~factor(cyl)) %>% 
    ggvis(x = ~x_, y = 0, y2 = ~count_, width = band()) %>% 
    layer_rects()

## short form:
mtcars %>% ggvis(~cyl) %>% layer_bars(width=1.75) %>% add_axis("x",values=c(4,6,8))
## better option is with factors
mtcars %>% ggvis(~factor(cyl)) %>% layer_bars() %>% add_axis("x",title="Number of Cylinders")

## combination with non-ggvis functions
## e.g. dplyr
library(dplyr)
## starting from:
mtcars %>% ggvis(~wt,~mpg) %>% layer_points %>% layer_paths() # meaningless doodle
mtcars %>% ggvis(~wt,~mpg) %>% arrange(wt) %>% layer_points %>% layer_paths() # arranged
mtcars %>% ggvis(~wt,~mpg) %>% layer_points %>% layer_lines() # same result

## group_by: to create separate entities
mtcars %>% group_by(am) %>% ggvis(~mpg, ~wt, stroke = ~factor(am)) %>% layer_smooths()
mtcars %>% group_by(cyl) %>% ggvis(~mpg, ~wt, stroke = ~factor(cyl)) %>% layer_smooths()
## Warning message:
## In bind_rows_(x, .id) : Unequal factor levels: coercing to character

## density:
mtcars %>% group_by(cyl) %>% ggvis(~mpg) %>% layer_densities() # greyscale graphs
mtcars %>% group_by(cyl) %>% ggvis(~mpg) %>% layer_densities(fill=~factor(cyl)) # coloured by cyl
## Warning message:
## In bind_rows_(x, .id) : Unequal factor levels: coercing to character

## interaction (grouped by two or more variables):
## starting from:
mtcars %>% group_by(cyl) %>% ggvis(~mpg) %>% layer_densities(fill=~factor(cyl))
## interaction for cyl and am
mtcars %>% group_by(cyl,am) %>% ggvis(~mpg) %>% layer_densities(fill=~interaction(cyl, am))
mtcars %>% group_by(cyl,am)
interaction(mtcars$cyl,mtcars$am)       # am is 0 or 1, so each cyl has a .0 and .1 suffix
str(mtcars)

## one more example:
mtcars %>% 
  group_by(am) %>% 
  ggvis(~mpg, ~hp) %>% 
  layer_smooths(stroke = ~factor(am)) %>% 
  layer_points(fill = ~factor(am))

