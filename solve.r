#!/usr/bin/env Rscript

## This generic function solves the equation ‘a %*% x = b’ for ‘x’,
##     where ‘b’ can be either a vector or a matrix.

## from the man page:
hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
h8 <- hilbert(8)
cat("h8 (hilbert(8)):\n")
print(h8)
sh8 <- solve(h8)
cat("h8 solved (solve(h8))\n")
print(sh8)
cat("round(sh8 %*% h8, 3)\n")
print(round(sh8 %*% h8, 3))
     
A <- hilbert(4)
cat("hilbert(4) as complex:\n")
A[] <- as.complex(A)
print(A)
## might not be supported on all platforms
cat("Trying to solve it:\n")
print(try(solve(A)))
