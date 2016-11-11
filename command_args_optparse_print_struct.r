#!/usr/bin/env Rscript

if (!require(optparse))
    stop("'optparse' needs to be installed to run this")
## install.packages("optparse")
## library(optparse)

## help is already defined: you cannot overwrite it
## option.help <- make_option(c("-h","--help"),
##                            action="store_true",
##                            help="Usage help",
##                            default=F)
option.print <- make_option(c("-p","--print"),
                           action="store",
                           help="Print something on screen",
                           default="something")
## option.list <- list(option.help,option.print)
option.list <- list(option.print)
print("the structure of options in list:")
print(str(option.list))

opt.parser <- OptionParser(option_list=option.list)
print("Structure in parser:")
print(str(opt.parser))

opts.parsed <- parse_args(opt.parser)
print("Structure of parsed options")
print(str(opts.parsed))

print("printing out options")
print("help")
print(opts.parsed$help)
print("print")
print(opts.parsed$print)
