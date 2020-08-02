#!/usr/bin/env Rscript

## main source:
## https://www.tutorialspoint.com/r/r_arrays.htm

v1 <- 1:3
v2 <- sample(1:9,9)
v3 <- 4:6
v4 <- sample(1:9,9)

cat("v1:\n")
print(v1)
cat("v2:\n")
print(v2)
cat("2d array: array(c(v1,v2),dim=c(3,4))\n")
ar1 <- array(c(v1,v2),dim=c(3,4))
print(ar1)

cat("v3:\n")
print(v3)
cat("v4:\n")
print(v4)
cat("3d array: array(c(v1,v2,v3,v4),dim=c(3,4,2))\n")
ar2 <- array(c(v1,v2,v3,v4),dim=c(3,4,2))
print(ar2)

cat("Same with names:\n")
cat("array(c(v1,v2,v3,v4),dim=c(3,4,2),dimnames=list(row.names,col.names,tier.names)):\n")
row.names <- paste0("r.",1:3)
col.names <- paste0("c.",1:4)
tier.names <- paste0("t.",1:2)
ar2 <- array(c(v1,v2,v3,v4),dim=c(3,4,2),dimnames=list(row.names,col.names,tier.names))
print(ar2)

cat("Adding the two tiers:\n")
print(ar2[,,"t.1"]+ar2[,,"t.2"])

cat("Sum or the rows with apply(ar,1,sum)\n")
print(apply(ar2,1,sum))
cat("Sum or the columns with apply(ar,2,sum)\n")
print(apply(ar2,2,sum))
