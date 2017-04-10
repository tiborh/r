a <- 1:5
is.vector(a)                            # T
is.atomic(a)                            # T
is.list(a)                              # F

attr(a,"an.attr") <- "Hello!"
is.vector(a)                            # F (only name attrib is allowed)
is.atomic(a)                            # T
typeof(a)

## always flat:
v1 <- c(1, c(2, c(3, 4)))
v1                                      # [1] 1 2 3 4
is.integer(v1)                          # false
is.numeric(v1)                          # true

dbl.var <- c(1, 2.4, 6.7)
typeof(dbl.var)                         # double
is.double(dbl.var)                      # T

## integer
int.var <- c(1L, 6L, 11L)
is.integer(int.var)                     # T
is.numeric(int.var)                     # T
is.double(int.var)                      # F

## coercion
bl1 <- c(F,F,T)
typeof(bl1)                             # logical
num1 <- as.numeric(bl1)
typeof(num1)                            # double
num2 <- as.integer(bl1)
typeof(num2)                            # integer

mean(num1)                              # 0.333333
mean(num2)                              # same as above
