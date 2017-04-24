#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=T)

if(length(args) < 1)
    warning("\tNo command line args.")


for (it in args)
    print(it)

