library(datasets)
data(iris)
head(iris)

#iris.two.cols <- iris[,c("Sepal.Length","Species")]      # two cols selected
#print(iris.two.cols)
#iris.filter <- iris.two.cols$Species=="virginica" # certain row values are selected
#print(iris.filter)
#iris.filtered1 <- iris.two.cols[iris.filter,]
#print(iris.filtered1)
#iris.filtered2 <- iris[iris.filter,c("Sepal.Length","Species")] # one step
#print(iris.filtered2)
#mean(iris.filtered1[,"Sepal.Length"])   # the mean of the Sepal.Length col
iris.filter <- iris[,c("Sepal.Length","Species")]$Species=="virginica"
mean(iris[iris.filter,"Sepal.Length"])  # the simplest way

iris.mean1 <- lapply(iris[,1:4],mean)                 # averages as list
class(iris.mean1)
print(iris.mean1)
iris.mean2 <- sapply(iris[,1:4],mean)                 # averages as numeric vector
class(iris.mean2)
print(iris.mean2)

apply(iris[, 1:4], 1, mean)             # means of rows
rowMeans(iris[, 1:4])                   # same
colMeans(iris[, 1:4])                   # column means
apply(iris, 1, mean)                    # lots of NA's
apply(iris[, 1:4], 2, mean)             # col means

library(datasets)
data(mtcars)
head(mtcars)
tail(mtcars)
nrow(mtcars)                            # 32

apply(mtcars, 2, mean)                  # col means
colMeans(mtcars)                        # same and simpler

split(mtcars, mtcars$cyl)               # grouped to cylinders
mean(mtcars$mpg, mtcars$cyl)            # error: 'trim' must be numeric of length one

tapply(mtcars$mpg, mtcars$cyl, mean)
mtcars.hp.avgs <- tapply(mtcars$hp, mtcars$cyl, mean)
class(mtcars.hp.avgs)
mtcars.hp.avgs[1]
mtcars.hp.avgs[2]
mtcars.hp.avgs[2][1]
mtcars.hp.avgs[3][1]
mtcars.hp.avgs[1]-mtcars.hp.avgs[3]
ls()                                    # list of objects
debug(ls)
ls()
