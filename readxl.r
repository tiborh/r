#!/usr/bin/env Rscript

source("common.r")

testxl <- function(xl.fn) {
    if (!file.exists(xl.fn))
        stop(paste("File does not exist:",xl.fn))
    stop.if.not.installed("readxl")
    xl.dat <- read_excel(xl.fn,1,range="A1:D4")
    return(xl.dat)
}

ifelse(length(ARGS)>0,print(testxl(ARGS[1])),stop("excel filename is needed\n"))

