#!/usr/bin/env Rscript

infinity <- function(n) {
    cat("How long does it take to crash? counter:",n,"\n")
    infinity(n+1)
}

infinity(1)
