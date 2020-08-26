#!/usr/bin/env Rscript

## source("common.r")

my.mean <- function(nums,na.rm=F) {
    if(na.rm)
        nums <- na.omit(nums)
    return(sum(nums)/length(nums))
}

is.odd <- function(num) {
    if (num %% 2)
        return(T)
    else
        return(F)
}

my.median <- function(nums) {
    nums.sorted <- sort(nums)
    nums.len <- length(nums.sorted)
    half.ind <- ceiling(nums.len/2)
    if(is.odd(nums.len))
        return(nums.sorted[half.ind])
    else
        return(my.mean(c(nums.sorted[half.ind],nums.sorted[half.ind+1])))
}

## source:
## https://www.tutorialspoint.com/r/r_mean_median_mode.htm
## match(vals,ref.tabl): first occurrence of each val (of vals) in ref.tabl. (list of indices is the result)
## tabulate(vals): gives the number of occurrunces of each integer in vals: the index gives the number it refers to
get.mode <- function(nums) {
    nums.uniq <- unique(nums)
    return(nums.uniq[which.max(tabulate(match(nums,nums.uniq)))])
}

print.result <- function(nums) {
    nums.txt <- deparse(substitute(nums))
    cat("The values of",nums.txt,":\n")
    print(nums)
    cat("Sorted:\n")
    print(sort(nums))
    cat("Mean:",my.mean(nums,na.rm=T),"\n")
    cat("Median:",my.median(nums),"\n")
    cat("Mode:",get.mode(nums),"\n") # which element occurs the most frequently
}

a <- sample(1:100,10,replace=T)
b <- sample(1:100,9,replace=T)

print.result(a)
print.result(b)

c <- sample(c(1:10,NA),11,replace=T)
print.result(c)

d <- sample(c(1:10),20,replace=T)
print.result(d)

e <- sample(letters[1:10],20,replace=T)
cat("e:\n")
print(e)
cat("sorted:\n")
print(sort(e))
cat("the mode of e:",get.mode(e),"\n")

