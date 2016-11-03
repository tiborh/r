#!/usr/bin/env Rscript

one <- function() {
    stopifnot(1==2)
}

two <- function() {
    if (1!=2)
        stop("one is not equal to two")
}

one()                                   # Error: 1 == 2 is not TRUE
two()                                   # more info
## Error in two() (from assert.r!289803wt#2) : one is not equal to two
