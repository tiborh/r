# create a 2 by 5 matrix
x <- 1:10                               # vector of 10
attributes(x)                           # NULL
print(x)                                # [1]  1  2  3  4  5  6  7  8  9 10
attr(x,"dim") <- c(2, 5)
attributes(x)
## $dim
## [1] 2 5
str(x)                                  # int [1:2, 1:5] 1 2 3 4 5 6 7 8 9 10
class(x)                                # matrix
str(x)                                  # int [1:2, 1:5] 1 2 3 4 5 6 7 8 9 10
print(x)
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    3    5    7    9
## [2,]    2    4    6    8   10
y <- 1:9
attr(y,"dim") <- c(3,3)
attributes(y)
print(y)

