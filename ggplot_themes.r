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


## recycling themes

z <- ggplot(iris, aes(Sepal.Length, Sepal.Width, col=Species)) +
    geom_jitter(alpha=0.7) +
    scale_color_brewer("Species",
                       palette = "Dark2",
                       labels = c("Setosa",
                                  "Versicolor",
                                  "Virginica")) +
    scale_y_continuous("Width (cm)", limits = c(1.75, 4.5),
                       expand = c(0,0)) +
    scale_x_continuous("Length (cm)", limits = c(4, 8),
                       expand = c(0,0)) +
    ggtitle("Sepals") +
    coord_fixed(1)
z

theme.iris <- theme(panel.background = element_blank(),
                    legend.background = element_blank(),
                    legend.key = element_blank(),
                    panel.grid = element_blank(),
                    axis.text = element_text(colour = "black"),
                    ## axis.line = element_line(colour = "black"), # buggy
                    axis.line.x = element_line(colour = "black"),
                    axis.line.y = element_line(colour = "black"))

z + theme.iris

source("iris_wide.r")

m <- ggplot(iris.wide, aes(Length,Width,col = Part)) +
    geom_jitter(alpha=0.5) +
    geom_point() + facet_grid(. ~ Species)

m
m + theme.iris

source("iris_tidy.r")

## discrete x-axis:
p <- ggplot(iris.tidy, aes(Measure, Value, col = Part)) +
    geom_point(position = position_jitter(0.1), alpha = 0.6,
               size = 0.4) +
    scale_y_continuous("Value (cm)", limits = c(0,8),
                       expand = c(0,0)) +
    facet_wrap(~ Species)

p
p + theme.iris

theme.iris.disX <- theme.iris +
    theme(axis.line.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.text.x =  element_text(angle = 45,
                                      hjust = 1))
p + theme.iris.disX

## built-in templates:
z + theme_classic()
m + theme_classic()
m + theme_classic() + theme(strip.background = element_blank())

## ggthemes package
if (!require(ggthemes)) install.packages("ggthemes")
library(ggthemes)
z + theme_tufte()                       # most puritanical

## setting the default, saving the original
original <- theme_update(panel.background = element_blank(),
                         legend.background=element_blank(), 
                         legend.key = element_blank(), 
                         panel.grid = element_blank(),
                         axis.text = element_text(colour = "black"),
                         axis.line.x = element_line(colour = "black"),
                         axis.line.y = element_line(colour = "black"),
                         axis.ticks = element_line(colour = "black"),
                         strip.background = element_blank())
z
theme_set(theme_tufte())
z
m
theme_set(original)
z


## exercises:
mtcars$cyl <- factor(mtcars$cyl)
z2 <- ggplot(mtcars,aes(wt,mpg,col=cyl)) + geom_point() +
#    scale_color_brewer(palette = "Blues") + # buggy with facets
    geom_smooth(method="lm",se=F) + facet_wrap(~ cyl)


z2

myRed <- "#99000D"
myPink <- "#FEE0D2"

# Theme layer saved as an object, theme_pink
theme_pink <- theme(panel.background = element_blank(),
                    legend.key = element_blank(),
                    legend.background = element_blank(),
                    strip.background = element_blank(),
                    plot.background = element_rect(fill = myPink, color = "black", size = 3),
                    panel.grid = element_blank(),
                    axis.line = element_line(color = "black"),
                    axis.ticks = element_line(color = "black"),
                    strip.text = element_text(size = 16, color = myRed),
                    axis.title.y = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.title.x = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.text = element_text(color = "black"),
                    legend.position = "none")
  
# Apply theme_pink to z2
z2 + theme_pink

# Change code so that old theme is saved as old
old <- theme_update(panel.background = element_blank(),
             legend.key = element_blank(),
             legend.background = element_blank(),
             strip.background = element_blank(),
             plot.background = element_rect(fill = myPink, color = "black", size = 3),
             panel.grid = element_blank(),
             axis.line = element_line(color = "black"),
             axis.ticks = element_line(color = "black"),
             strip.text = element_text(size = 16, color = myRed),
             axis.title.y = element_text(color = myRed, hjust = 0, face = "italic"),
             axis.title.x = element_text(color = myRed, hjust = 0, face = "italic"),
             axis.text = element_text(color = "black"),
             legend.position = "none")

# Display the plot z2
z2

# Restore the old plot
theme_set(old)
z2

z2 + theme_tufte() + theme(
                        legend.position = c(0.9, 0.9),
                        legend.title = element_text(face = "italic",
                                                    size = 12),
                        axis.title = element_text(face = "bold",
                                                    size = 14)
                     )
