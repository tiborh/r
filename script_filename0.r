#!/usr/bin/env Rscript

get.filename <- function() {
    args <- commandArgs()
    print(args)
    fn <- args[grepl("^--file=",args)]
    cat(fn,"\n")
    print(strsplit(fn,"="))
    print(str(strsplit(fn,"=")))
    print(strsplit(fn,"=")[[1]])
    print(strsplit(fn,"=")[[1]][2])
    fn.out <- basename(strsplit(fn,"=")[[1]][2])
    cat("|",fn.out,"|\n")
    return(fn.out)
}

fn  <- get.filename()
print(fn)
