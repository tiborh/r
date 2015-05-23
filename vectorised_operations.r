## vectors
x <- 1:4; y <- 6:9
print(x)
print(y)
print(x+y)                              # added element by element
print(x*y)                              # multiplied element by element
print(x/y)                              # divided element by element
print(x + 2)                            # 2 added to each element
print(x > 2)                            # bool vector
print(x >= 2)                           # bool vector
print(x == 2)                           # bool vector

## matrices (matrix)
x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
print(x)
print(y)
print(x*y)                              # multiplied element by element
print(x/y)                              # divided element by element
print( x %*% y )                        ## true matrix multiplication
