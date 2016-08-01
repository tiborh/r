library(ggplot2)
## visual elements that are not part of the data
##   text:      element_text()
##   line:      element_line()
##   rectangle: element_rectangle()
## they appear in theme()

## in multi-plot plots:
##   text
##   title
##   plot.title
##   legend.title
##   axis.title (also .x .y)
##   axis.text  (also .x .y)
##   legend.text
##   strip.text(): the header on individual plots (also .x .y)

## line elements
##   line
##   axis ticks (also .x .y)
##   axis.line  (also .x .y)
##   panel.grid (.major .minor (both also with .x .y))

## rectangle elements
##   rect
##   legend.background
##   legend key
##   panel.background
##   panel.border
##   plot.background
##   strip.background (multi-plot plots)

## They inherit from each other.

## element_blank: to remove all element formatting:
## theme( text = element_blank(),
##        line = element_blank(),
##        rect = element_blank()
##      )

## examples:

mtcars$cyl = factor(mtcars$cyl)
?scale_color_brewer
z.base <- ggplot(mtcars, aes(wt,mpg,col=cyl)) +
    geom_point() + scale_color_brewer(palette = "Set2") +
    geom_smooth(method="lm",se=F) + facet_grid(. ~ cyl) +
    scale_x_continuous("Weight (1000 lbs)") +
    scale_y_continuous("Miles/(US) gallon") +
    scale_colour_discrete("Cylinders")

z.base
myPink = c("#FEE0D2")
z.base + theme(plot.background = element_rect(fill = myPink,
                                              colour = "black",
                                              size = 3))
uniform_panels <- theme(panel.background = element_blank(), 
                        legend.key = element_blank(), 
                        legend.background=element_blank(), 
                        strip.background = element_blank())
z.base + theme(plot.background = element_rect(fill = myPink,
                                              colour = "black",
                                              size = 3)) + uniform_panels

## another
z.base + theme(panel.grid = element_blank(),
            axis.line = element_line(colour="black"),
            axis.ticks = element_line(colour = "black"))

myRed = "#99000D"
myBlues = c("#9ECAE1", "#4292C6", "#08519C")
myPink = "#FEE0D2"

z.base + theme(strip.text = element_text(colour=myRed,
                                    size = 16),
                axis.title = element_text(colour=myRed,
                                            hjust=0,
                                            face="italic"),
                axis.text = element_text(colour="black")
               )

## legend:
# Move legend by position
z.base + theme(
        legend.position = c(0.85, 0.85)
    )

# Change direction
z.base + theme(
            legend.direction = "horizontal"
        )

# Change location by name
z.base + theme(
            legend.position = "bottom"
        )

# Remove legend entirely
z.base + theme(
            legend.position = "none"
        )


## positions

# Increase spacing between facets
library(grid)
z.base + theme(panel.margin.x = unit(1,"in")
        )


# Add code to remove any excess plot margin space
z.base + theme(plot.margin = unit(c(0,0,0,0), "in")
            )

