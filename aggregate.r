#!/usr/bin/env Rscript

## source("common.r")

a <- data.frame(num=sample(seq(1:5),10,replace=T),let=sample(letters,10,replace=F))

cat("Original data:\n")
print(a)

ag <- aggregate(let~num,a,paste)

cat("Aggregated data:\n")
print(ag)
