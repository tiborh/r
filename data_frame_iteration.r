#!/usr/bin/env Rscript

a = data.frame(a=1:5,b=sample(letters,5))

cat("The data frame:\n")
print(a)

cat("plain for in df iteration goes column by column:\n")
for (it in a) cat("item:",it,"\n")

cat("row by row iteration breaks it down to mini data frames:\n")
for (i in 1:nrow(a)) print(a[i,])

cat("Best solution might be the use an apply function:\n")
cat("by row:\n")
apply(a,1,function(x) {print(str(x))})
cat("by column:\n")
apply(a,2,function(x) {print(str(x))})
