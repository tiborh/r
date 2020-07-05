#!/usr/bin/env Rscript

## frequent data types:
## * Vectors c() or vector(mode = "logical", length = 0)
cat("vectors always give the type of data stored in them as class\n")
## * Lists list()
cat(class(list()),"\n")
## * Matrices matrix()
cat(class(matrix()),"(matrices have a type)\n")
## * Arrays array()
cat(class(array(c(1,2,3))),"\n")
## * Factors factor()
cat(class(factor()),"\n")
cat("Number of factors in mtcars$cyl:",nlevels(factor(mtcars$cyl)),"\n")
## * Data Frames data.frame()
cat(class(data.frame()),"\n")
cat(str(data.frame(nums = c(1,2,3),
               chars = c('a','b','c'),
               logicals = c(T,F,T)
               )
    ),"\n")

cat("Atomic data types:\n")
cat(class(T),"\n")
cat(class(1),"\n")
cat(class(1L),"\n")
cat(class(2+3i),"\n")
cat(class('a'),"\n")
cat(class(charToRaw('a')),"\n")
