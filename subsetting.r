## vectors
x <- c("a", "b", "c", "c", "d", "a")
print(x[1])                             # first element
print(x[1:4])                           # first 4 elements
print(x[x > "a"])                       # when x is greater than "a"
u <- x > "a"                            # creating a boolean vector
print(u)

## lists
x <- list(foo = 1:4, bar = 0.6)
print(x[1])                             # both name and vector
print(x[[1]])                           # only vector
x1 <- x[1]
class(x1)                               # a list
print(x1)

## names can also be used
print( x$bar )                          # the vector
print( x[["bar"]] )                     # the vector
print( x["bar"] )                       # the list

## a subset of multiple elements
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
print( x[c(1, 3)] )                     # a list is returned

## aliasing a name with a variable
name <- "foo"
print( x[[name]] )                      # a vector
print( x$name )                         # NULL because it is not a name
print( x$foo )

## nested elements
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x1 <-  x[[c(1, 3)]]
print(x1)                   # a single numeric
class(x1)                   # numeric
print( x[[1]][[3]] )        # alternatively
print( x[[c(2, 1)]] )

## matrices (matrix)
x <- matrix(1:6, 2, 3)                  # a 2 by 3 matrix
print(x)
print(x[1, 2])                          # 3
print( x[2, 1] )                        # 2
print( x[1, ] )                         # first row
print(  x[, 2] )                        # second column
print(  x[1, 2, drop = FALSE] )         # keep the dimensions
print(  x[1, , drop = FALSE] )          # same for row

## partial matching
x <- list(aardvark = 1:5)
print( x$a )                            # the named vector
print( x[["a"]] )                       # NULL
print( x[["a", exact = FALSE]] )        # closest is "a"

## dealing with NA values
x <- c(1, 2, NA, 4, NA, 5)
print(x)
bad <- is.na(x)                         # boolean matrix
print(bad)
print( x[!bad] )                        # getting the not-bad values

## subset of multiple things with no missing values
x <- c(1, 2, NA, 4, NA, 5, "A")
y <- c("a", "b", NA, "d", NA, "f", NA)
good <- complete.cases(x, y)
print(x)
print(y)
print(good)
print( x[good] )
print( y[good] )
