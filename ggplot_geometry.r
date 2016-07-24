library(ggplot2)
## 37 different geometries are available
## 3 most important ones:
##   scatter plots: points, jitter, ablines
##   bar plots: histogram, bar, error bar
##   line plots

## geom_ all have specific aesthetic mappings
##   e.g. geom_point() needs an x and y
##   optional: alpha, colour, fill, shape, size
##   aes() inside geom:
ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
    geom_point(aes(col=Species))        # same as if col were in ggplot part
iris.root <- ggplot(iris, aes(Sepal.Length, Sepal.Width, col=Species))
iris.base <- iris.root + geom_point()
## data layer inside geom:
#detach("package:dplyr", unload=TRUE)
#detach("package:tidyr", unload=TRUE)

str(iris)
## aggregate:             dataset,   list of by,         function
iris.summary <- aggregate(iris[1:4], list(iris$Species), mean)
names(iris.summary)[1] <- "Species"     # from Group.1
str(iris.summary)
print(iris.summary)

## applying the second layer:
iris.base + geom_point(data=iris.summary, shape =15, size = 5,alpha = 0.5)
## colour is inherited

## another variation:
iris.base + geom_point(data=iris.summary, shape = 21, size = 5,
                       fill = "#00000000",alpha = 0.3) # shape is inherited

## crosshairs (to show the average):
iris.base +
    geom_vline(data = iris.summary,
               aes(xintercept = Sepal.Length, col=Species),
               lty=2) +
    geom_hline(data = iris.summary,
               aes(yintercept = Sepal.Width, col=Species),
               lty=2)
## note: the statistics layer can take care of it much better

## jitter
iris.root + geom_jitter()               # basic
iris.root + geom_jitter(alpha = 0.6)    # shading
iris.root + geom_jitter(shape = 1)      # using circles
iris.root + geom_jitter(alpha = 0.7, shape = 1) # both
iris.root + geom_jitter(alpha = 0.7, shape = 13) # another shape

## jitter and scale:
iris.root + geom_jitter() + scale_colour_brewer(palette = "Dark2")

## shape, size, and colour could be a great help with large data sets

ggplot(diamonds, aes(carat, price)) +
    geom_point(alpha = 0.3, shape = ".")
ggplot(diamonds, aes(carat, price, col=color)) +
    geom_point(alpha = 0.3)
str(diamonds)
## some quick analytics:
plot(carat ~ color, data=diamonds)
plot(price ~ color, data=diamonds)
plot(price ~ carat, data=diamonds, pch=".")
plot(price ~ carat, data=diamonds, pch=".", col=color)

## further exercises:
str(mtcars)
mtcars$cyl = factor(mtcars$cyl)
mtcars.root <- ggplot(mtcars, aes(cyl,wt))
mtcars.root + geom_point()              # lines
mtcars.root + geom_jitter()             # too much jitter
mtcars.root + geom_jitter(width=0.1)    # much better
mtcars.root + geom_jitter(width=0.2)
mtcars.root + geom_jitter(width=0.5)    # it depends

if (!require(car)) install.packages("car")
library(car)
data()
dim(Vocab)

# Examine the structure of Vocab
str(Vocab)

## not much, because both are discrete
ggplot(Vocab,aes(education,vocabulary)) + geom_point()

## better, but too blotty:
ggplot(Vocab,aes(education,vocabulary)) + geom_jitter()

## even better, but still too blotty
ggplot(Vocab,aes(education,vocabulary)) + geom_jitter(alpha=0.2)

## perhaps the best output
ggplot(Vocab,aes(education,vocabulary)) + geom_jitter(alpha=0.2,shape=1)

## quite good too:
ggplot(Vocab,aes(education,factor(vocabulary))) + geom_jitter(shape=".")

## basic plot's box plot is not bad either:
plot(vocabulary ~ factor(education), data=Vocab)
## the other way around:
plot(education ~ factor(vocabulary), data=Vocab)
## the double factor:
plot(factor(education) ~ factor(vocabulary), data=Vocab)
plot(factor(vocabulary) ~ factor(education), data=Vocab, col=vocabulary)

plot(factor(education) ~ vocabulary, data=Vocab, col=factor(education))
