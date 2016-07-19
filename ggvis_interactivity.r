library(ggvis)
library(shiny)

## the following widgets are available:
##   input_checkbox(),
##   input_checkboxgroup(),
##   input_numeric(),
##   input_radiobuttons(),
##   input_select(),
##   input_slider(),
##   input_text()

faithful %>% 
    ggvis(~waiting, ~eruptions, fillOpacity := 0.5, 
          shape := input_select(label = "Choose shape:", 
                                choices = c("circle", "square", "cross", 
                                            "diamond", "triangle-up", "triangle-down")), 
          fill := "black") %>% 
    layer_points()

## same for fill too:
faithful %>% 
    ggvis(~waiting, ~eruptions, fillOpacity := 0.5, 
          shape := input_select(label = "Choose shape:", 
                                choices = c("circle", "square", "cross", 
                                            "diamond", "triangle-up", "triangle-down")), 
          fill := input_select(label = "Choose colour:", 
                               choices = c("black", "red", "blue", "green"))) %>% 
    layer_points()

## radio buttons:
mtcars %>% 
    ggvis(~mpg, ~wt,
          fill := input_radiobuttons(label = "Choose colour:", 
                                     choices = c("black", "red", "blue", "green"))) %>% 
    layer_points()

## input text:
mtcars %>% 
  ggvis(~mpg, ~wt, 
        fill := input_text(value="black", label = "Choose colour:")) %>% 
    layer_points()

## map as name to have them as variables and not as strings
mtcars %>% 
    ggvis(~mpg, ~wt) %>% 
    layer_points(fill=input_select(label="Choose fill variable: ", choices=names(mtcars), map=as.name))

## input numeric:
mtcars %>% 
  ggvis(~mpg) %>% 
  layer_histograms(width = input_numeric(value=1,label="Choose a binwidth:"))

## input slider:
mtcars %>% 
  ggvis(~mpg) %>% 
  layer_histograms(width = input_slider(min=1,max=20,label="Choose a binwidth:"))
