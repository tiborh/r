#!/usr/bin/env Rscript

## print(base::commandArgs())
cat("without arg:\n")
print(commandArgs())
cat("with trailingOnly=T:\n")
print(commandArgs(trailingOnly=T))

## library("optparse")
## print(OptionParser())



