x <- 1:10                               # vector of 10
attributes(x)                           # NULL
x
attr(x,"dim") <- c(2, 5)                # vector to matrix by changing attributes
attributes(x)
x

x <- cbind(a = 1:3, pi = pi) # simple matrix with dimnames
print(x)
attributes(x)
## $dim
## [1] 3 2

## $dimnames
## $dimnames[[1]]
## NULL

## $dimnames[[2]]
## [1] "a"  "pi"

## strip an object's attributes:
attributes(x) <- NULL
x # now just a vector of length 6

mostattributes(x) <- list(mycomment = "really special", dim = 3:2,
   dimnames = list(LETTERS[1:3], letters[1:5]), names = paste(1:6))
x # dim(), but not {dim}names
attributes(x)
## $mycomment
## [1] "really special"

## $dim
## [1] 3 2

a <- data.frame(a = 1:5, b = letters[1:5])
attributes(a)
## $names
## [1] "a" "b"

## $row.names
## [1] 1 2 3 4 5

## $class
## [1] "data.frame"

attr(a,"row.names") <- c(LETTERS[1:5])
print(a)
##   a b
## A 1 a
## B 2 b
## C 3 c
## D 4 d
## E 5 e

## attributes(a)
## $names
## [1] "a" "b"
## $row.names
## [1] "A" "B" "C" "D" "E"
## $class
## [1] "data.frame"

b <- cbind(a = 1:3, b = 4:6, c = 7:9)
class(b)                                # matrix
print(b)
##      a b c
## [1,] 1 4 7
## [2,] 2 5 8
## [3,] 3 6 9

## the danger of changing attibs:
attr(b,"class") <- "data.frame"
class(b)                                # data.frame
str(b)
## corrupt data (loses the values):
## 'data.frame':	0 obs. of  9 variables:
##  'data.frame' int [0 , 1:9] character(0) character(0) character(0) character(0) character(0) character(0) character(0) character(0) character(0)
##  - attr(*, "dimnames")=List of 2
##   ..$ : NULL
##   ..$ : chr  "a" "b" "c"
## Warning message:
## In format.data.frame(x, trim = TRUE, drop0trailing = TRUE, ...) :
##   corrupt data frame: columns will be truncated or padded with NAs
print(b)
## NULL
## <0 rows> (or 0-length row.names)

attr(b,"class") <- "matrix"
str(b)                                  # restored, without the warning
print(b)
##      a b c
## [1,] 1 4 7
## [2,] 2 5 8
## [3,] 3 6 9
## attr(,"class")
## [1] "matrix"

attributes(b) <- NULL
str(b)
##  int [1:9] 1 2 3 4 5 6 7 8 9

