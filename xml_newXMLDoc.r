#!/usr/bin/env Rscript

source("common.r")

if (!require("XML"))
    stop("'XML' package is needed.")

doc = newXMLDoc()
print(str(doc))
print(doc)
print(as(doc,"character"))


