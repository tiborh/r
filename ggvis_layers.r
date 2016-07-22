libary(ggvis)
## common scenarios:
## smoothing: the points are also needed:
iris %>%
    ggvis(~Sepal.Width,~Sepal.Length) %>%
    layer_smooths(span=1)
## not too much info
iris %>%
    ggvis(~Sepal.Width,~Sepal.Length) %>%
    layer_points()
## not here either
iris$SepalArea = iris$Sepal.Width*iris$Sepal.Length
## str(iris)
iris %>%
    ggvis(~Sepal.Width,~Sepal.Length) %>%
    layer_smooths(span=1) %>%
    layer_smooths(span=0.5,stroke:="red") %>%
    layer_points(fill=~Species,size=~SepalArea) %>%
    add_legend("size", properties = legend_props(legend = list(y = 100)))
## best result

## exercises:
## starting (points and line):
pressure %>% 
    ggvis(~temperature, ~pressure, stroke := "skyblue") %>% 
    layer_lines() %>%
    layer_points()

## 2 (shape):
pressure %>% 
  ggvis(~temperature, ~pressure) %>% 
  layer_lines(stroke := "skyblue") %>% 
  layer_points(shape := "triangle-up")

## 3 (global and local options):
pressure %>% 
  ggvis(~temperature, ~pressure, stroke := "skyblue", 
              strokeOpacity := 0.5,strokeWidth := 5) %>% 
  layer_lines() %>% 
    layer_points(fill = ~temperature, shape := "triangle-up", size := 300)

## 4 (multiple layers)
pressure %>%
  ggvis(~temperature, ~pressure) %>%
  layer_lines(opacity := 0.5) %>%
  layer_points() %>%
  layer_model_predictions(model = "lm",stroke:="navy") %>%
  layer_smooths(stroke:="skyblue")

## 5
pressure %>% 
  ggvis(~temperature, ~pressure, stroke := "darkred") %>% 
  layer_lines(stroke := "orange", strokeDash := 5, strokeWidth := 5) %>% 
  layer_points(size := 100, fill := "lightgreen", shape := "circle") %>%
    layer_smooths()

## also see ggvis_lines.r, where layers have further plot lines and much more
