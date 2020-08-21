#!/usr/bin/env Rscript

proc.user.input <- function() {
    if (!require(optparse))
        stop("'optparse' needs to be installed to run this")

    option.num <- make_option(c("-n","--num_of_lines"),
                              action="store",
                              type="integer",
                              help="Number of lines to process from CSV. (-1 == all) (optional)",
                              metavar="number")
    option.store <- make_option(c("-s","--store_result"),
                                action="store_true",
                                default=F,
                                help="If used, the result will be saved in .RData file (optional)")
    option.list <- list(option.num,option.store)
    opt.parser <- OptionParser(option_list=option.list)
    opts.parsed <- parse_args(opt.parser)

    num.lines = -1

    if (!is.null(opts.parsed$num))
        num.lines=opts.parsed$num

    return(list(num.lines=num.lines,store.res=opts.parsed$store))
}

print(proc.user.input())
