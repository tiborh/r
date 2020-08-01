#!/usr/bin/env Rscript

## from man page:
x <- 1:9; names(x) <- x
cat("x:\n")
print(x)
print(str(x))
## Multiplication & Power Tables
cat("x %o% x:\n")
print(x %o% x)

y <- 2:8; names(y) <- paste(y,":", sep = "")
cat("y:\n")
print(y)
cat("outer(y, x, \"^\")\n")
print(outer(y, x, "^"))

cat("outer(month.abb, 1999:2003, FUN = \"paste\")\n")
print(outer(month.abb, 1999:2003, FUN = "paste"))
     
cat("three way multiplication table:\n")
cat("x %o% x %o% y[1:3]\n")
print(x %o% x %o% y[1:3])
