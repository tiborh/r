#!/usr/bin/env Rscript

source("common.r")

if (!require("XML"))
    stop("'XML' package is needed.")

doc = newXMLDoc()
print(str(doc))
print(doc)
print(as(doc,"character"))

## adding some content
n = newXMLNode("top", doc = doc)
print(doc)

saved.xml <- saveXML(doc, prefix = character())
print(saved.xml)

saved.xml <- saveXML(doc, prefix = newXMLCommentNode("A comment prefix"))
print(saved.xml)

fn <- file.path(DATA.DIR,"saveXML.xml")
saveXML(doc,file=fn,encoding="UTF-8")
cat("file has been saved to:",fn,"\n")
