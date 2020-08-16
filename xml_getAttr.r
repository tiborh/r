#!/usr/bin/env Rscript

source("common.r")

fn <- file.path(DATA.DIR,"doc.xml")

if(!file.exists(fn))
    stop("file does not exist:",fn)

if (!require("XML"))
    stop("'XML' package is needed.")

xml <- xmlRoot(xmlTreeParse(readLines(fn),asText=T))
len <- length(xml)
for (it in 1:len) {
    print(xml[[it]])
}
x.attr <- xmlGetAttr(xml[[1]],'x')
print(x.attr)
y.attr <- xmlGetAttr(xml[[1]],'y')
print(y.attr)
xy <- xmlAttrs(xml[[1]])
print(xy)
