#!/usr/bin/env Rscript

if (!require(rmarkdown)) install.packages("rmarkdown")
require(rmarkdown)

fn <- "rmarkdown1.rmd"
rmarkdown::render(fn)
