#!/usr/bin/env Rscript

source("common.r")
source("proc_tmdb_common.r")

stop.if.not.installed(c("rjson"))

fn3 <- "tmdb_5000_movies.csv"
movies <- proc.tmdb.fn(fn3)
print(str(movies))
cat("to be continued...\n")
