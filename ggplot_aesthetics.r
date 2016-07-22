library(ggplot2)
## which is x and y (also called mapping)
## colour
## fill
## size
## shape: of the point
## alpha: for transparency
## linetype
## labels: text on plot or axes

ggplot(mtcars, aes(x=wt,y=mpg,col=cyl)) + geom_point(shape=1,size=4)
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl, fill=cyl)) +
    geom_point(shape = 16, size = 6, alpha = 0.6)

## cylinder experiments
ggplot(mtcars,aes(wt,mpg,size=cyl)) + geom_point()
ggplot(mtcars,aes(wt,mpg,alpha=cyl)) + geom_point()
ggplot(mtcars,aes(wt,mpg,shape=cyl)) + geom_point()
ggplot(mtcars,aes(wt,mpg,label=cyl)) + geom_text() # numbers for points

## exercises:
## starting:
ggplot(mtcars, aes(wt,mpg,col=factor(cyl))) + geom_point()
## col is not the best one to set:
my_color <- "#123456"
ggplot(mtcars, aes(wt,mpg,col=cyl)) + geom_point(col=my_color) # overwrites
## better is "fill":
ggplot(mtcars, aes(wt,mpg,fill=factor(cyl))) +
    geom_point(col=my_color,size=10,shape=23,alpha=0.7) + # does not overwrite
    scale_fill_discrete(name="Number of\nCylinders")
## source: http://www.cookbook-r.com/Graphs/Legends_(ggplot2)/

## complex settings:
ggplot(mtcars, aes(x = wt, y = mpg,fill=factor(cyl))) + 
    geom_point(alpha=0.5, shape=24,size=5) +
    scale_fill_discrete(name="Number of\nCylinders")

## this one never works correctly:
ggplot(mtcars, aes(x = wt, y = mpg, fill = factor(cyl))) +
    geom_text(label="x",col="red",size=10) # no matter where fill is or factor or not

## data explained in mtcars
##   mpg -- Miles/(US) gallon
##   cyl -- Number of cylinders
##   disp -- Displacement (cu.in.)
##   hp -- Gross horsepower
##   drat -- Rear axle ratio
##   wt -- Weight (lb/1000)
##   qsec -- 1/4 mile time
##   vs -- V/S engine.
##   am -- Transmission (0 = automatic, 1 = manual)
##   gear -- Number of forward gears
##   carb -- Number of carburetors

## colouring does not work this way, without colour, not much sense:
ggplot(mtcars, aes(mpg,qsec),col=factor(cyl)) + geom_point()
## colouring shows the dependence on number of cylinders
ggplot(mtcars, aes(mpg,qsec,col=factor(cyl))) + geom_point()
## let's put transmission into the picture:
ggplot(mtcars, aes(mpg,qsec,col=factor(cyl),shape=factor(am))) +
    geom_point() +
    scale_shape_discrete(name  ="Transmission",
                         breaks=c(0, 1),
                         labels=c("Automatic", "Manual")) +
    scale_colour_discrete(name="Number of\nCylinders")

ggplot(mtcars, aes(mpg,qsec,col=factor(cyl),shape=factor(am),size=(hp/wt))) +
    geom_point() +
    scale_shape_discrete(name  ="Transmission",
                         breaks=c(0, 1),
                         labels=c("Automatic", "Manual")) +
    scale_colour_discrete(name="Number of\nCylinders") +
    scale_size_continuous(name="HP / Weight") +
    scale_y_continuous("1/4 Mile Time (sec)") +
    scale_x_continuous("Miles Per Gallon (mpg)") +
    ggtitle("mtcars")

## modifying aesthetics:

## default:
ggplot(iris, aes(Sepal.Length,Sepal.Width,col=Species)) + geom_point()
## sometimes, you need some noise:
ggplot(iris, aes(Sepal.Length,Sepal.Width,col=Species)) +
    geom_point(position="jitter")
## or, alternatively:
ggplot(iris, aes(Sepal.Length,Sepal.Width,col=Species)) +
    geom_jitter()
## modified:
ggplot(iris, aes(Sepal.Length,Sepal.Width,col=Species)) +
    geom_jitter(width=0.1)
## modified the other way:
pos.j <- position_jitter(width=0.1)
ggplot(iris, aes(Sepal.Length,Sepal.Width,col=Species)) +
    geom_point(position=pos.j)

## scale_ functions can help access scales (as shown above in an mtcars example
## the third part e.g. scale_x_<3> shows if "continuous" or "discrete" scale
ggplot(iris, aes(Sepal.Length,Sepal.Width,col=Species)) +
    geom_point() +
    scale_y_continuous("Sepal Width") +
    scale_x_continuous("Sepal Length") +
    scale_colour_discrete("Iris\nspecies")
## limits is for "from ... to" in coordinates
## e.g. limits = c(2,8)
## breaks is for the division on the axis
## e.g. seq(2,8,3)
## expand is for the gap between
## e.g. expand = c(0,0)
## labels is for the category names
## e.g. labels = c("Setosa", "Versicolour", "Virginica")
## note: if only access labels need to change, labs function can also come handy

## the way to work:
## base assigned to variable:
cyl.am <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(am)))

cyl.am + geom_bar()                     # default is stacked
cyl.am + geom_bar(position = "fill")    # stacked and fills whole space
cyl.am + geom_bar(position = "dodge")   # side by side

## cleaning up:
val = c("#E41A1C", "#377EB8")
lab = c("Manual", "Automatic")
cyl.am +
  geom_bar(position = "dodge") +
  scale_x_discrete("Cylinders") + 
  scale_y_continuous("Number") +
  scale_fill_manual("Transmission", 
                    values = val,
                    labels = lab) 

## Dummy aesthetics:
mtcars$group <- 0
ggplot(mtcars, aes(mpg,group)) + geom_point() # points in a line
ggplot(mtcars, aes(mpg,group)) + geom_point(position="jitter") # shaken up
ggplot(mtcars, aes(mpg,group)) + geom_jitter()                 # same
ggplot(mtcars, aes(mpg,group)) + geom_jitter(width=0.1)
ggplot(mtcars, aes(mpg,group)) + geom_jitter(width=0.01)
ggplot(mtcars, aes(mpg,group)) + geom_jitter(width=0.5)

ggplot(mtcars, aes(mpg,group)) + geom_jitter() +
    scale_y_continuous(limits=c(-2,2))

## Best Practices
##   Audience is much more important than high-complexity
##     (oneself, expert audience, wide audience)
##   Accuracy is more important than a nice plot
##   Correct interpretation should be helped
##     (usually, using colour for continuous variable is misleading)
ggplot(iris, aes(Species,Sepal.Length,fill=Sepal.Width)) + geom_point()

##     Scale for Accurate and Efficient Decoding of Information
## low.............>>.............>>.............>>.............High
## |           spectrum             |                       position
## colour, monochromatic, grey-scale, area, angle, length, 1D     2D

## Never use two parameters to prepresent one difference
## e.g. colour _and_ shape for species
## Try to make it intuitive
## e.g. bigger shapes for bigger engines
## do not oversimplify (unless giving a proper context):
## e.g.
ggplot(iris, aes(Species,Sepal.Length)) + geom_point()

## experiment
ggplot(iris, aes(Species,Sepal.Length,size=Sepal.Width)) + geom_point(alpha=0.3)

##               Efficiency in Decoding Separate Groups
## low.............>>.............>>.............>>.............High
## filled shapes        sequential colours        qualitative colours
## hatching (///)         shape outlines                       labels
## line width               line type                    line colours

## exercises:
## filled dots + alpha
ggplot(mtcars, aes(mpg,wt,col=factor(cyl))) + geom_point(size=4,alpha=0.5) +
    scale_colour_discrete(name="Cylinders")

## circles
ggplot(mtcars, aes(mpg,wt,col=factor(cyl))) + geom_point(size=2,shape=1) +
    scale_colour_discrete(name="Cylinders")

## large data sets:
diaplot.base <- ggplot(diamonds,aes(carat,price,col=clarity))
diaplot.base + geom_point()    # lots of dots, but two-colour bands can be seen
diaplot.base + geom_point(alpha=0.5)    # some transparency, not much help

ggplot(diamonds,aes(clarity,carat,col=price)) + geom_point(alpha=0.5) # vertical lines
ggplot(diamonds,aes(clarity,carat,col=price)) + geom_jitter(alpha=0.5) # almost like bars

