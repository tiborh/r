#!/usr/bin/env Rscript

## source("common.r")

if (!require(testit))
    stop("'testit' is needed.")

cat("Starting test.\n")
for (i in 1:10000) {
    sample.length <- sample(10:15,1)
    nums <- sample(1:100,sample.length,replace=T)
    assert(median(nums) == mean(nums,trim=0.5))
}
cat("Test has passed.\n")
