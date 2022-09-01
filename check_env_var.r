#!/usr/bin/env Rscript

source("common.r")

if (NARGS > 0) {
    env.arg.val <- Sys.getenv(ARGS[1])
    cat(ifelse(nchar(env.arg.val) == 0,
               paste("not found:",ARGS[1]),
               paste("found:",ARGS[1],"==",env.arg.val)),"\n")
} else {
    cat("No env var has been provided to find.\n")
}
