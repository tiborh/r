#!/usr/bin/env Rscript

a <- data.frame(num=sample(seq(1:5),10,replace=T),let=sample(letters,10,replace=F))
a$c1 <- "c1"
a$c2 <- "c2"

cat("Original data:\n")
print(a)

ag <- aggregate(let~num+c1+c2,a,paste,collapse=",")

cat("Aggregated data:\n")
print(ag)
print(str(ag))

