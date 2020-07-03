#!/usr/bin/env Rscript

get.filename <- function() {
    args <- commandArgs()
    fn <- basename(strsplit(args[grepl("^--file=",args)],"=")[[1]][2])
    return(fn)
}

fn  <- get.filename()
cat(paste0("The name of the script is '",fn,"'.\n"))
