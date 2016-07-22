library(ggvis)
## line properties:
##   stroke (colour)
##   strokeWidth
##   strokeOpacity
##   strokeDash
##   fill (surrounded space with colour)
##   fillOpacity

## lines and _paths_ are different entities
## ribbons are shaded areas bounded by one or more lines
## smooths are smooth lines to data
## model_predictions
## also: rects and text is possible

x <- -10:10
y <- x*x
xy <- data.frame(x=x,y=y)
xy %>% ggvis(~x,~y) %>% layer_lines(stroke:="red",fill:="yellow")

x <- seq(0,2*pi,0.01)
s <- sin(x)
c <- cos(x)
t <- tan(x)
xy2 <- data.frame(x=x,sin=s,cos=c,tan=t)

## this one looks quite good:
xy2 %>%
    ggvis(~x,~s) %>%
    layer_paths(stroke:="blue",fill:="blue",strokeOpacity:=0.5,fillOpacity:=0.3) %>%
    layer_paths(data=xy2, x=~x, y=~c,
                stroke:="red",fill:="red",strokeOpacity:=0.5,fillOpacity:=0.3)

## this one is ruled by the tangent:
xy2 %>%
    ggvis(~x,~s) %>%
    layer_paths(stroke:="blue",fill:="blue",strokeOpacity:=0.5,fillOpacity:=0.3) %>%
##    add_legend("stroke",orient="right",title="Plots") %>% # do not use!
    layer_paths(data=xy2, x=~x, y=~c,
                stroke:="red",fill:="red",strokeOpacity:=0.5,fillOpacity:=0.3) %>%
    layer_paths(data=xy2, x=~x, y=~t,
                stroke:="green",fill:="green",strokeOpacity:=0.5,fillOpacity:=0.3) %>%
    scale_numeric("y", domain=c(-1,1), clamp = TRUE, nice = FALSE) %>%
    add_axis("y", title="y") %>%
    add_axis("x", title = "x") %>%      # this is used for the hack below to work
    add_axis("x", orient = "top", ticks = 0, title = "Sine, Cosine, and Tangent",
           properties = axis_props(
             axis = list(stroke = "white"),
             labels = list(fontSize = 0)))


## practice:
## both lines and points:
pressure %>% ggvis(~temperature, ~pressure) %>% layer_points() %>% layer_lines()
## dash
pressure %>% ggvis(~temperature, ~pressure) %>% layer_lines(stroke:="red",strokeWidth:=2,strokeDash:=6)

## rectangle:
xy3 <- data.frame(x=c(1,1,5,5,1),y=c(1,5,5,1,1))
xy3 %>% ggvis(~x,~y) %>% layer_paths(fill:="darkorange")

## smooth:
mtcars %>% compute_model_prediction(mpg ~ wt, model = "lm") # linear model
mtcars %>% compute_smooth(mpg ~ wt)             # for loess model
mtcars %>% ggvis(~wt, ~mpg)
mtcars %>% compute_smooth(mpg ~ wt) %>% ggvis(~pred_, ~resp_) %>% layer_lines()
## same with linear model:
mtcars %>% compute_model_prediction(mpg ~ wt, model = "lm") %>% ggvis(~pred_, ~resp_) %>% layer_lines()
## superimposing the model on the dots
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>% layer_smooths()
