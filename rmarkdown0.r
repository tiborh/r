#!/usr/bin/env Rscript

if (!require(rmarkdown)) install.packages("rmarkdown")
require(rmarkdown)

fn <- "rmarkdown0.rmd"
rmarkdown::render(fn)
