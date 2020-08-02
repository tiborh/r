#!/usr/bin/env Rscript

## main source:
## https://www.tutorialspoint.com/r/r_matrices.htm

## matrix(data, nrow, ncol, byrow, dimnames)

## Following is the description of the parameters used:
## * data is the input vector which becomes the data elements of the matrix.
## * nrow is the number of rows to be created.
## * ncol is the number of columns to be created.
## * byrow is a logical clue. If TRUE then the input vector elements are arranged by row.
## * dimname is the names assigned to the rows and columns.

v1 <- 1:12
cat("vector:\n")
cat("matrix(v1,4,3,byrow=T):\n")
m1 <- matrix(v1,4,3,byrow=T)
print(m1)
cat("matrix(v1,3,4,byrow=F,dimnames=list(paste0(\"r.\",1:3),paste0(\"c.\",1:4))):\n")
m2 <- matrix(v1,3,4,byrow=F,dimnames=list(paste0("r.",1:3),paste0("c.",1:4)))
print(m2)

cat("Matrix operations:\n")
m1=matrix(sample(1:9,9),nrow=3)
cat("m1:\n")
print(m1)
m2=matrix(sample(1:9,9),nrow=3)
cat("m2:\n")
print(m2)

cat("addition:\n")
print(m1+m2)
cat("subtraction:\n")
print(m1-m2)

cat("multiplication:\n")
print(m1*m2)
cat("division:\n")
print(m1/m2)
