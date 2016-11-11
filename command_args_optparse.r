#!/usr/bin/env Rscript

if (!require(optparse))
    stop("'optparse' needs to be installed to run this")

option.print <- make_option(c("-p","--print"),
                           action="store",
                           help="Print something on screen",
                           default="something")
option.list <- list(option.print)
opt.parser <- OptionParser(option_list=option.list)
opts.parsed <- parse_args(opt.parser)

print(paste("printing:",opts.parsed$print))
