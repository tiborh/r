library(ggplot2)
## coord_
## coord_cartesian() is the most commonly used

## zooming in (always to be handled with caution
## scale_x_continuous(limits = ...) # or scale_y_...
## xlim(() # or ylim()
## coord_cartesian(xlim = ...)

iris.smooth <- ggplot(iris, aes(Sepal.Length, Sepal.Width, col = Species)) +
    geom_point(alpha = 0.7) + geom_smooth()

iris.smooth
some.lim = c(4.5,5.5)

iris.smooth + scale_x_continuous(limits = some.lim) # warning about removed rows, blue has no line since it has a single value only

iris.smooth + xlim(some.lim)          # not as flexible

iris.smooth + coord_cartesian(xlim = some.lim) # blue is also on the plot

## Aspect ratio
## a source of deception
## best if they are the same (1:1)
## range may be different

library(reshape2); library(zoo)
?index
data()
str(sunspots)
str(sunspot.month)
head(index(sunspot.month))
sunspots.m <- data.frame(year = index(sunspot.month),
                         value = melt(sunspot.month)$value)
str(sunspots.m)

?coord_equal
## same as coord_fixed with 1
spot.month.plot <- ggplot(sunspots.m, aes(year,value))
spot.month.plot + geom_line() + coord_equal()
## the shape of the spikes is easier to see here:
spot.month.plot + geom_line() + coord_fixed(0.055)

## Exercises:
p <- ggplot(mtcars, aes(x = wt, y = hp, col = factor(am))) +
    geom_point() + geom_smooth()

p
p + scale_x_continuous(limits = c(3,6), expand = c(0,0))
## 16 warnings

p + coord_cartesian(xlim = c(3,6))      # no warning

## Ex. Aspect Ratio
base.plot <- ggplot(iris, aes(Sepal.Length,Sepal.Width,col=Species)) +
               geom_jitter() +
               geom_smooth(method = "lm", se = F)
base.plot
base.plot + coord_equal()

## bar with dummy data:
cyl.base <- ggplot(mtcars, aes(1,fill=factor(cyl)))
cyl.base + geom_bar()

cyl.base + geom_bar() + coord_polar()                # like a target board
cyl.base + geom_bar() + coord_polar(theta = "y")
cyl.base + geom_bar(width = 1)
cyl.base + geom_bar(width = 1) + coord_polar(theta = "y")
