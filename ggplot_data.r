library(ggplot2)
## Objects and layers:

## base package plotting:
plot(Sepal.Length ~ Sepal.Width, data = iris) # default is type="p", point
## adding petal params too:
points(Petal.Length ~ Petal.Width, data = iris, col="red") # off to the left
## major problem: plot is an image, not an object you can manipulate once it is drawn.
## legend needs to be added manually
## various plot types require their own functions

## same with ggplot:
ggplot(iris, aes(Sepal.Width,Sepal.Length)) + geom_point()
## ggplot is always the function, for all types of plots

## more can be achieved if not printed on the fly but stored in a variable:
irisplot <- ggplot(iris, aes(Sepal.Width,Sepal.Length))
## than various plots can be tried:
irisplot + geom_point()
irisplot + geom_jitter()
irisplot + stat_smooth()
irisplotpoints <- irisplot + geom_point()
print(irisplotpoints)

## exercises:
## basic plot with not factor categorical:
plot(mpg ~ wt, data=mtcars, col=cyl)
## making it factor:
mtcars$cyl <- as.factor(mtcars$cyl)
## repeating plot
plot(mpg ~ wt, data=mtcars, col=cyl)    # slight variation in colour distribution

## Basic plot 2
# Basic plot
mtcars$cyl <- as.factor(mtcars$cyl)
plot(mpg ~ wt, data=mtcars, col = cyl)

# Use lm() to calculate a linear model and save it as carModel
carModel <- lm(mpg ~ wt, data = mtcars)

# Call abline() with carModel as first argument and set lty to 2
abline(carModel, lty=2, col="blue")

# Plot each subset efficiently with lapply
# You don't have to edit this code
lapply(mtcars$cyl, function(x) {
  abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
  })

# This code will draw the legend of the plot
# You don't have to edit this code
legend(x = 5, y = 33, legend = c(levels(mtcars$cyl),"all"), 
       col = 1:4, pch = c(1,1,1,NA), bty = "n", lty=c(1,1,1,2))

## same with ggplot2:
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() + # Copy from Plot 2
  geom_smooth(method="lm", se=F) + # Copy from Plot 2
    geom_smooth(method="lm", aes(group=1), col="black",se=F, linetype=2)   # Fill in using instructions Plot 3

## adding another layer of points in ggplot2:
irisplotpoints + geom_point(aes(Petal.Width,Petal.Length),col="red") # values do not disappear
## but this is not the good thing to do: breaks grammar by mixing aesthetics into geometry
## signs:
##   no legend
##   the axis labels are wrong

## solution:
## creation of a wide table:
library(tidyr)
str(iris)

## for iris.wide:
iris.sepal <- data.frame(Species=iris$Species,Length=iris$Sepal.Length,Width=iris$Sepal.Width)
iris.sepal$Part = "Sepal"
iris.sepal$Part = factor(iris.sepal$Part)
iris.petal <- data.frame(Species=iris$Species,Length=iris$Petal.Length,Width=iris$Petal.Width)
iris.petal$Part = "Petal"
iris.petal$Part = factor(iris.petal$Part)
str(iris.sepal)
str(iris.petal)
iris.wide <- rbind(iris.petal,iris.sepal)
str(iris.wide)
rm(iris.sepal)
rm(iris.petal)
ls()

ggplot(iris.wide,aes(Length,Width,shape=Part,col=Species)) + geom_point(size=3,alpha=0.7) +
    ggtitle("Iris")

## a simpler preparation of iris.wide:
iris$rowID <- 1:nrow(iris)              # to avoid duplicate rows error
iris.wide <- iris %>%
    gather(Measure,Value, -c(Species,rowID)) %>%
    separate(Measure,c("Part","Measure"),sep="\\.") %>%
    spread(Measure,Value)
iris <- iris[-6]

## for iris.wide2:
iris.setosa <- data.frame(iris.wide[iris.wide$Species=="setosa",])
iris.versicolor <- data.frame(iris.wide[iris.wide$Species=="versicolor",])
iris.virginica <- data.frame(iris.wide[iris.wide$Species=="virginica",])
iris.setosa <- iris.setosa[-1]
iris.versicolor <- iris.versicolor[-1]
iris.virginica <- iris.virginica[-1]
iris.setosa <- gather(iris.setosa,Measure,Setosa,-Part)
iris.versicolor <- gather(iris.versicolor,Measure,Versicolor,-Part)
iris.virginica <- gather(iris.virginica,Measure,Virginica,-Part)
str(iris.setosa)
str(iris.versicolor)
str(iris.virginica)

iris.wide2 <- data.frame(Measure=iris.setosa$Measure,
                         Part=iris.setosa$Part,
                         Setosa=iris.setosa$Setosa,
                         Versicolor=iris.versicolor$Versicolor,
                         Virginica=iris.virginica$Virginica)

str(iris.wide2)
rm(iris.setosa)
rm(iris.versicolor)
rm(iris.virginica)

ggplot(iris.wide2, aes(Part,Setosa, col=Measure)) + geom_jitter()
ggplot(iris.wide2, aes(Measure,Setosa, col=Part)) + geom_jitter()
## it would be a tad unprofessional to prepare the three plots one by one
## also, it was lucky that the number of measurements were the same for each species
## therefore, starting afresh from iris.wide:

## for iris.clean
str(iris.wide)
iris.clean <- gather(iris.wide,Measure,Value,-c(Species,Part))
iris.clean$Measure = factor(iris.clean$Measure)
str(iris.clean)

ggplot(iris.clean, aes(Part,Value, col=Measure,shape=Species)) + geom_jitter()
ggplot(iris.clean, aes(Part,Value, col=Species,shape=Measure)) + geom_jitter() # best
ggplot(iris.clean, aes(Part,Value, col=Species,shape=Measure)) + geom_point() # this one shows what jitter means
ggplot(iris.clean, aes(Measure,Value, col=Part,shape=Species)) + geom_jitter()
ggplot(iris.clean, aes(Measure,Value, col=Species,shape=Part)) + geom_jitter() # second best

## same with facet:
ggplot(iris.clean, aes(x = Species, y = Value, col = Part)) +
  geom_jitter() +
  facet_grid(. ~ Measure)

## creation of the above data.frame in two easy steps:
iris.tidy <- iris %>%
    gather(key, Value, -Species) %>%
    separate(key,c("Part","Measure"), sep="\\.")
str(iris.tidy)

## another depiction:
ggplot(iris.wide, aes(x = Length, y = Width, col = Part)) +
    geom_jitter() +
    facet_grid(. ~ Species)               # each species in separate plot
