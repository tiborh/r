# create a 2 by 5 matrix
x <- 1:10                               # vector of 10
attributes(x)                           # NULL
x
attr(x,"dim") <- c(2, 5)
attributes(x)
## $dim
## [1] 2 5
str(x)                                  # int [1:2, 1:5] 1 2 3 4 5 6 7 8 9 10
class(x)                                # matrix

y <- 1:9
attr(y,"dim") <- c(3,3)
attributes(y)
y

