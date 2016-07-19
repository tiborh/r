library(ggvis)
## Important syntax points:
##   piping: %>%
##   vector "value" ~variable
##   := to set properties

iris %>%
    ggvis(x= ~Sepal.Width, y= ~Sepal.Length) %>%
    layer_points(fill=~Species, size=~Petal.Width) %>%
    add_legend("size", properties = legend_props(legend = list(y = 100)))


## trying a slight variation:

iris %>%
    ggvis(x= ~Sepal.Width, y= ~Sepal.Length, fill=~Species, size=~Petal.Width) %>%
    layer_points() %>%
    add_legend("size", properties = legend_props(legend = list(y = 100))) # also good

## trying to make the points red:

iris %>%
    ggvis(x= ~Sepal.Width, y= ~Sepal.Length, fill="red", size=~Petal.Width) %>%
    layer_points() %>%
    add_legend("size", properties = legend_props(legend = list(y = 100)))
## oops, the points are blue and the name of the property is "red"
## Reason: it is in the data field and not in the visual space

## Solution: set operator needs to be used: := "red"
iris %>%
    ggvis(x= ~Sepal.Width, y= ~Sepal.Length) %>%
    layer_points(fill:="red", size=~Petal.Width)
## now it looks good, the colour legend has also gone away, so no need for add_legend

## also setting the size:
iris %>%
    ggvis(x= ~Sepal.Width, y= ~Sepal.Length) %>%
    layer_points(fill:="red", size:=100)
## or not setting at all:
iris %>% ggvis(x= ~Sepal.Width, y= ~Sepal.Length) %>% layer_points()

## some examples:
faithful %>% ggvis(~waiting, ~eruptions) %>% layer_points()
pressure %>% ggvis(~temperature, ~pressure) %>% layer_points(size=~pressure)
faithful %>%
    ggvis(~waiting, ~eruptions) %>%
    layer_points(size=~eruptions,fill:="blue",stroke:="black",opacity:=0.5)
faithful %>%
    ggvis(~waiting, ~eruptions) %>%
    layer_points(fillOpacity=~eruptions,size:=100,fill:="red",stroke:="red",shape:="cross")

## Point properties:
##   stroke (border colour)
##   shape: One of circle (default),  square,  cross,  diamond, triangle-up, or triangle-down (symbol only)
##   fill (colour)
##   fillOpacity (level of transparence)
