#!/usr/bin/env Rscript

if (!require(rmarkdown)) install.packages("rmarkdown")
require(rmarkdown)

args = commandArgs(trailingOnly=T)
if (!length(args))
    stop("Rmd file to render is needed as argument.")

fn <- args[1]
if (!file.exists(fn))
    stop("File does not exist: ",fn)
rmarkdown::render(fn)
rmarkdown::render(fn, pdf_document())
