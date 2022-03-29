#!/usr/bin/env Rscript

source("common.r")

stop.if.not.installed("writexl")
fn <- "writexl.xlsx"
write_xlsx(mtcars,fn)
cat("mtcars has been written into",fn,"\n")
