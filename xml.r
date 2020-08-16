#!/usr/bin/env Rscript

source("common.r")

## source:
## https://www.tutorialspoint.com/r/r_xml_files.htm

fn <- file.path(DATA.DIR,"sample.xml")

if(!file.exists(fn))
    stop("Sample xml file not found:",fn)

## Load the package required to read XML files.
if (!require("XML"))
    stop("'XML' package is needed.")

## Also load the other required package.
if(!require("methods"))
    stop("'methods' package is needed.")

## Give the input file name to the function.
result <- xmlParse(file = fn)

## Print the result.
## print(result)

## Exract the root node form the xml file.
cat("Root node:\n")
rootnode <- xmlRoot(result)
print(rootnode)

## Find number of nodes in the root.
rootsize <- xmlSize(rootnode)

## Print the result.
cat("\nRoot size:",rootsize,"\n")

cat("\nFirst element:\n")
print(rootnode[1])
print(str(rootnode[1]))

cat("\nAs list item:\n")
print(rootnode[[1]])

cat("\nAs data frame:\n")
a.df <- xmlToDataFrame(fn)
print(str(a.df))
print(a.df)

## cat("Going over each element:\n")
## for(node.it in 1:rootsize) {
##     cat("node",node.it,":\n")
##     node.size <- xmlSize(rootnode[[node.it]])
##     for(line.it in 1:node.size) {
##         cat("item",line.it,":\n")
##         print(rootnode[[node.it]][[line.it]])
##     }
## }
