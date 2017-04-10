x <- 1:9
names(x) <- x                         # row or col names
## Multiplication & Power Tables
x %o% x                                 # same as outer(x,x)
outer(x,x)

y <- 2:8;
names(y) <- paste(y,":", sep = "")
outer(y, x, "^")
     
outer(month.abb, 1999:2003, FUN = "paste")
     
## three way multiplication table:
x %o% x %o% y[1:3]
