#!/usr/bin/env Rscript

if (!require(optparse))
    stop("'optparse' needs to be installed to run this")

option.print <- make_option(c("-p","--print"),
                           action="store",
                           type="character",
                           help="Print input on screen",
                           metavar="string")
option.list <- list(option.print)
cat("option.list:\n")
print(option.list)
opt.parser <- OptionParser(option_list=option.list)
cat("opt.parser:\n")
print(opt.parser)
opts.parsed <- parse_args(opt.parser)
cat("opts.parsed:\n")
print(opts.parsed)

if (is.null(opts.parsed$print)) {
    print_help(opt.parser)
    stop("At least one argument must be supplied (string)", call.=FALSE)
}
print(paste("printing:",opts.parsed$print))
