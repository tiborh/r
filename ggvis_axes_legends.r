library(ggvis)

## axes:
##   The first argument specifies which axis to customize.
##   title - the title of the axis you specified in the first argument.
##   values - determine where labelled tick marks will appear on each axis.
##   subdivide - insert unlabelled tick marks between the labelled tick marks on an axis.
##   orient - control where the axis appears. For the x axis, you can use "top" or "bottom", for the y axis, you can use "left" or "right".

faithful %>% 
    ggvis(~waiting, ~eruptions) %>% 
    layer_points(fill=~waiting,size=~eruptions) %>%
    add_axis("x",title="Time since previous eruption (m)",values=seq(50,90,10),subdivide=9,orient="top") %>%
    add_axis("y",title="Duration of eruption (m)",values=2:5,subdivide=9,orient="right") %>%
    add_legend("fill", title="Time Since Prev.") %>%
    add_legend("size", title="Length", properties = legend_props(legend = list(y = 50)))


## 2 (factorised):
faithful %>% 
    ggvis(~waiting, ~eruptions, opacity := 0.6, 
          fill = ~factor(round(eruptions))) %>% 
    layer_points() %>%
    add_legend("fill", title="~ duration (m)",orient="left")


## 3
faithful %>% 
    ggvis(~waiting, ~eruptions, opacity := 0.6, 
          fill = ~factor(round(eruptions)), shape = ~factor(round(eruptions)), 
          size = ~round(eruptions)) %>%
    add_legend("fill", title="~ duration (m)") %>%
    add_legend("shape", title="~ duration (m)", properties = legend_props(legend = list(y = 100))) %>%
    add_legend("size", title="~ duration (m)", properties = legend_props(legend = list(y = 200))) %>%
    layer_points()
## c("fill","shape","size") would also be fine, if spacing were correct


## property mappings, scales

## scale functions:
##   scale_datetime(),
##   scale_logical(),
##   scale_nominal(),
##   scale_numeric(),
##   scale_singular().

iris %>%
    ggvis(~Sepal.Width,~Sepal.Length) %>%
    layer_points(fill=~Species)
## the colour mapping can be changed: Scale function
iris %>%
    ggvis(~Sepal.Width,~Sepal.Length) %>%
    layer_points(fill=~Species,stroke=~Species) %>%
    scale_nominal("fill",range=c("yellow","orange","red"))

## a better colour scheme:
iris %>%
    ggvis(~Sepal.Width,~Sepal.Length) %>%
    layer_points(fill=~Species) %>%
    scale_nominal("fill",range=c("darkgreen","seagreen","palegreen"))
## nominal gives the precise colours

## exercises:
mtcars %>% 
  ggvis(~wt, ~mpg, fill = ~disp, stroke = ~disp, strokeWidth := 2) %>%
  layer_points() %>%
  scale_numeric("fill", range = c("red", "yellow")) %>%
  scale_numeric("stroke", range = c("darkred", "orange"))
## numeric gives the endpoints

mtcars %>% ggvis(~wt, ~mpg, fill = ~hp) %>%
  layer_points() %>%
  scale_numeric("fill", range = c("green", "beige"))


## factors need only nominal:
mtcars %>% ggvis(~wt, ~mpg, fill = ~factor(cyl)) %>%
  layer_points() %>%
  scale_nominal("fill", range=c("purple","blue","green"))

## opacity scale:
mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = ~factor(cyl), opacity = ~hp) %>%
    layer_points() %>%
    scale_numeric("opacity", range=c(0.2,1.0))

## domain in place of range:
mtcars %>% ggvis(~wt, ~mpg, fill = ~disp) %>%
    layer_points() %>%
    scale_numeric("y", domain = c(0, NA)) %>%
    scale_numeric("x", domain = c(0, 6))

## colour variable:
str(mtcars)                             # not yet any colour
the.colours <- colours()
car.colours <- sample(the.colours,length(mtcars[[1]]))
mtcars$colour = car.colours

mtcars %>% 
    ggvis(x = ~wt, y = ~mpg, fill = ~colour) %>% 
    layer_points()

## testing for string colours (lots of them do not work)
mtcars %>% 
    ggvis(x = ~wt, y = ~mpg, fill := ~colour) %>% 
    layer_points()

