#!/usr/bin/env Rscript

if (!require(rmarkdown)) install.packages("rmarkdown")
require(rmarkdown)

fn <- "random.rmd"
rmarkdown::render(fn)
