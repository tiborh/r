#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=T)

if (length(args) < 2) {
    warning(paste("number of args:",length(args)))
    stop("two files are needed as arguments")
}

fp1 <- file.path(args[1])
fp2 <- file.path(args[2])

if (!file.exists(fp1))
    stop("file does not exist: ",fp1)
if (!file.exists(fp2))
    stop("file does not exist: ",fp2)

q <- scan(fp1,what=character())
d <- scan(fp2,what=character())

print(paste("from",fp1[length(fp1)],"to",fp2[length(fp2)]))
first2second <- setdiff(q,d)
## intersect12 <- intersect(q,d)

print("Difference:")
print(paste("length:",length(first2second)))
print(first2second)

## print("Intersection:")
## print(paste("length:",length(intersect12)))
## print(intersect12)

print(paste("from",fp2[length(fp2)],"to",fp1[length(fp1)]))
second2first <- setdiff(d,q)
intersect21 <- intersect(d,q)

print("Difference:")
print(paste("length:",length(second2first)))
print(second2first)

print("Intersection:")
print(paste("length:",length(intersect21)))
print(intersect21)
