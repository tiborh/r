#!/usr/bin/env Rscript

## source("common.r")

a = data.frame(a = 1:3, b = sample(letters,3))
cat("a data set:\n")
print(a)

cat("What happens when we cbind something longer?\n")
cat("e.g. this: ")
c = sample(LETTERS,6)
print(c)

cat("This will be the result:\n")
print(cbind(a,c))

cat("same dynamically:\n")
print(cbind(a,sample(LETTERS,6)))

cat("providing for column name:\n")
print(cbind(a,c=sample(LETTERS,6)))

cat("playing similar with first row only:\n")
print(cbind(a[1,],c=sample(LETTERS,3)))

cat("you can get rid off warning with \"row.names=NULL\"\n")
print(cbind(a[1,],c=sample(LETTERS,3),row.names=NULL))

cat("same logic when the bind is shorter:\n")
print(cbind(a,c="A"))
