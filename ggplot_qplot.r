library(ggplot2)
str(iris)

## ggplot version:
ggplot(iris, aes(Sepal.Length,Sepal.Width)) + geom_point(aes(colour=Species))

## same with qplot:
qplot(Sepal.Length,Sepal.Width, data = iris) # almost same as plot
qplot(Sepal.Length,Sepal.Width, data = iris, col=Species)
qplot(Sepal.Length,Sepal.Width, data = iris, shape=Species) # not good enough
qplot(Sepal.Length,Sepal.Width, data = iris, col=Species, geom="jitter")
qplot(Sepal.Length,Sepal.Width, data = iris, col=Species, alpha=0.5) # problem, legend
## inhibit:
qplot(Sepal.Length,Sepal.Width, data = iris, col=Species, alpha=I(0.5))


## with plot
plot(Sepal.Width ~ Sepal.Length, data = iris, col=Species)
legend("topright",legend=levels(iris$Species),pch=1,col=1:length(levels(iris$Species)),inset=0.02)

library(dplyr)
iris.tidy <- iris %>%
    gather(key, Value, -Species) %>%
    separate(key,c("Part","Measure"), sep="\\.")
str(iris.tidy)

qplot(Species, Value, data = iris.tidy, col = Part, shape=Measure) # lined up
qplot(Species, Value, data = iris.tidy, col = Part, shape=Measure, geom="jitter")

## to illustrate automatic geom selection:
qplot(factor(cyl), data=mtcars)         # histogram
qplot(factor(cyl), factor(vs), data=mtcars) # scatter
qplot(factor(cyl), factor(vs), data=mtcars, geom="jitter", col=factor(cyl))

## dotplot:
ggplot(mtcars, aes(cyl, wt, fill = factor(am))) + geom_dotplot(binwidth=0.45)
qplot(cyl, wt, data=mtcars, fill = factor(am),
      geom="dotplot", binaxis="y", stackdir="center") # looks strange
qplot(cyl, wt, data=mtcars, fill = factor(am),
      geom="dotplot", binwidth=0.45) # looks pretty useless
