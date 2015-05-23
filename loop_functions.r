## lapply( a_list, a_function, ...) --> "a_list" if not a function, then coerced to be one, or error
x <- list(a=1:5, b=rnorm(10))
y <- lapply(x,mean)
print(y)
class(y)

x <- list(a=1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
y <- lapply(x,mean)
print(y)

x <- 1:4
y <- lapply(x, runif)                   # uniform distribution of random elements
print(y)

z <- runif(10,1,6)                      # number of elems, minimum value, maximum value
print(z)
z1 <- round(z,0)
print(z1)

## trying it in one step:
z1a <- round(runif(10,1,6),0)
print(z1a)
## or
z1b <- sapply(runif(10,1,6),round,0)
print(z1a)

## this one would make a list out of the result
z2 <- lapply(z,round,0)
print(z2)                               # a list of one-element arrays
## lets try to simplify it
z3 <- sapply(z,round,0)
print(z3)

## anonymous functions
x <- list(a = matrix(1:4,2,2), b = matrix(1:6,3,3))
print(x)
## extract first col of each
lapply(x, function(elt) elt[,1])

## result is put into a matrix
x <- list(a = matrix(1:4,2,2), b = matrix(1:6,2,3))
sapply(x, function(elt) elt[,1])

## apply(X, MARGIN, FUN, ...)
## X is an array
## MARGIN is an int vector showing which margins should be retained
## MARGIN here is more like dimensions of a matrix, for example

x <- matrix(rnorm(200),20,10)
print(x)                                # 10 cols 20 rows
apply(x,2,mean)                         # mean of each col
apply(x,1,sum)                          # sum of each row

## special functions
rowSums(x)                              # apply(x,1,sum)
rowMeans(x)                             # apply(x,1,mean)
colSums(x)                              # apply(x,2,sum)
colMeans(x)                             # apply(x,2,mean)

## quantile: sample quantiles corresponding to the given probabilities
apply(x,1,quantile,probs=c(0.25,0.75))

rnorm(2*2*10)                           # 40 numbers
c(2,2,10)
a <- array(rnorm(2*2*10), c(2,2,10))
print(a)
class(a)
apply(a,c(1,2),mean)
## same
rowMeans(a,dims=2)
rowMeans(a)

## mapply
## function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)
## 1, FUN function to apply
## 2, arguments to apply over
## 3, other arguments to FUN
## 4, SIMPLIFY: whether result is to be simplified
## explanation: parallel processing of multiple lists with multiple args

## simple example:
rep(1,4)                                # repeat 1 four times
z <- list(rep(1,4),rep(2,3),rep(3,2),rep(4,1),rep(5,0))
## replicates values
print(z)
z1 <- mapply(rep, 1:4, 4:1)
print(z1)

mapply(noise,1:5, 1:5, 2)               # is equivalent to
list(noise(1,1,2), noise(2,2,3), noise(3,3,2), noise(4,4,2), noise(5,5,2))


noise(5,1,2)                 # number of elements, mean, standard deviation
noise(1.5,1.5,2)             # "number" is handled flexibly

mapply(noise,1:5,1:10,0.2)                 # noise on five elements
noise(10,2,0.2)

z2 <- list(c(1:5),c(6:10))
z3 <- c(0.1,0.2,0.3,0.4,0.5)
mapply(noise,z,z2,z3)

## tapply is applied on a subset of a vector
## function(x, index, fun = NULL, ..., simplify = TRUE)
## index: a factor or list of factors
## fun: function to apply
## ... arguments passed to fun
## should result be simplified?

x <- c(rnorm(10), runif(10,5,10), rnorm(10,1))
f <- gl(3,10)                           # 3: number of levels: 10: number of replications
## Generate factors by specifying the pattern of their levels.
##       n: an integer giving the number of levels.
##       k: an integer giving the number of replications.
##  length: an integer giving the length of the result.
##  labels: an optional vector of labels for the resulting factor levels.
## ordered: a logical indicating whether the result should be ordered or
##          not.
print(x)
print(f)
length(x)
length(f)

tapply(x,f,mean)                        # the mean of three groups determined by level in f
tapply(x,f,mean,simplify=F)             # returns a list

tapply(x, f, range)                     # ‘range’ returns a vector containing the minimum and maximum
                                        # of all the given arguments. with this setup it refers to groups


## split
## ‘split’ divides the data in the vector ‘x’ into the groups defined by ‘f’.
## third argument is "drop" (bool) which tells if empty factor levels should be dropped

split(x,f)                              # divided by level
lapply(split(x,f), mean)                # same as tapply(x,f,mean,simplify=F)

library(datasets)
head(airquality)
tail(airquality)

## split by month
s <- split(airquality,airquality$Month)
print(s)
lapply(s,function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")])) # the more complicated one (list)
sapply(s,function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")])) # simplifies previous (matrix)
sapply(s,function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")],na.rm=T)) # weed out "na"

x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
print(x)
print(f1)
print(f2)

list(f1,f2)                             # list of two number series
split(x,list(f1,f2))
str(split(x,list(f1,f2)))               # more compact
str(split(x,list(f1,f2),drop=T))        # drop embty levels
