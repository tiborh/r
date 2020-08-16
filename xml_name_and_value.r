#!/usr/bin/env Rscript

## source("common.r")

if (!require("XML"))
    stop("'XML' package is needed.")

xtext <- "<a id=\"021\">text</a>"
xparsed <- xmlRoot(xmlParse(xtext))
cat("original input:",xtext,"\n")
cat("the name part:",xmlName(xparsed),"\n")
cat("the value part:",xmlValue(xparsed),"\n")
cat("the attr part:",xmlGetAttr(xparsed,"id"),"\n")
cat("when attr name is not clear:\n")
print(xmlAttrs(xparsed))
