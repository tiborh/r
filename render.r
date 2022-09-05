#!/usr/bin/env Rscript

UHOME <- Sys.getenv("HOME")
RSHARED <- file.path(UHOME,"repos","r")
COMMONR <- file.path(RSHARED,"common.r")
source(COMMONR)

check.packages(c("rmarkdown","mime"))

if (NARGS < 1)
    stop("Rmd file to render is needed as argument.")

fn <- ARGS[1]
if (!file.exists(fn))
    stop("File does not exist: ",fn)

rmarkdown::render(fn)
rmarkdown::render(fn, pdf_document())
##rmarkdown::render(fn, slidy_presentation())
##rmarkdown::render(fn, beamer_presentation())
