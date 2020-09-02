#!/usr/bin/env Rscript

source(file.path(Sys.getenv("HOME"),"repos","r","common.r"))

args = commandArgs(trailingOnly=T)

if (length(args) == 0)
    stop("Filename should be an argument.")

print(args)

if (!require(readODS))
    stop("'read_ods' is needed")

if(!file.exists(args[1]))
    stop("file not found:",args[1])

sh1 <- read_ods(args[1])
print(str(sh1))

cat("setdiff(",names(sh1)[1],",",names(sh1)[2],"):\n")
print(setdiff(sh1[[1]],sh1[[2]]))

cat("setdiff(",names(sh1)[2],",",names(sh1)[1],"):\n")
print(setdiff(sh1[[2]],sh1[[1]]))


