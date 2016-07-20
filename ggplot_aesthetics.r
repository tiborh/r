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

