#!/usr/bin/env Rscript

## source("common.r")

if (!require("XML"))
    stop("'XML' package is needed.")

a.node <- xmlNode("arg", attrs = c(default="T"),
                  xmlNode("name", "foo"), xmlNode("defaultValue","1:10"))

cat("the node:\n")
print(a.node)

cat("its attributes:\n")
print(xmlAttrs(a.node))
print(str(xmlAttrs(a.node)))

cat("its first subnode:\n")
print(a.node[[1]])

cat("first item in the first subnode:\n")
print(a.node[[1]][[1]])
print(str(a.node[[1]][[1]]))

cat("\nadding one more subnode:\n")
a.node[[xmlSize(a.node)+1]] <- xmlNode("tag",attrs=(c(id="name")))
print(a.node)

cat("\nsimpler with append.xmlNode:\n")
a.node <-  append.xmlNode(a.node, xmlNode("records", "1.2 3.5"))
print(a.node)

r <- xmlNode("references")
cat("\nempty node:\n")
print(r)
cat("xmlSize:",xmlSize(r),"\n")

cat("\nadding first elem:\n")
r <- append.xmlNode(r,xmlNode("first",0:9))
print(r)

## tmp <-  lapply(references, function(i) {
##     if(!inherits(i, "XMLNode"))
##         i <- xmlNode("reference", i)
##     i
## })

## r[["references"]] <- append.xmlNode(r[["references"]], tmp)
## print(r)
