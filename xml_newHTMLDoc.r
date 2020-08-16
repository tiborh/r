#!/usr/bin/env Rscript

source("common.r")

if (!require("XML"))
    stop("'XML' package is needed.")

h <- newHTMLDoc()
print(h)
## don't know how to add sub-elements to head or body
