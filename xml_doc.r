#!/usr/bin/env Rscript

source("common.r")

## source:
## https://www.rdocumentation.org/packages/XML/versions/3.99-0.5/topics/newXMLDoc

if (!require("XML"))
    stop("'XML' package is needed.")

create.xml.tree <- function() {
    top <- newXMLNode("a")
    print(top)

    b <- newXMLNode("b", attrs = c(x = 1, y = 'abc'), parent = top)
    print(top)

    c <- newXMLNode("c", "With some text", parent = top)
    print(top)

    d = newXMLNode("d", newXMLTextNode("With text as an explicit node"), parent = top)
    print(top)

    d.x <- newXMLCDataNode("x <- 1\n x > 2", parent = d) # CDATA: handled as text
    print(top)

    R <- newXMLPINode("R", "library(XML)", top) # processing instructions
    print(top)

    comment <- newXMLCommentNode("This is a comment", parent = top)
    print(comment)

    o = newXMLNode("ol", parent = top)
    print(top)

    kids = lapply(letters[1:3],
                  function(x)
                      newXMLNode("li", x))
    addChildren(o, kids)
    print(top)
    
    x = newXMLNode("block", "xyz", attrs = c(id = "bob"),
                   namespace = "fo",
                   namespaceDefinitions = c("fo" = "http://www.fo.org"),parent=top)
    print(x)

    if(require(testit))
        assert(!(xmlName(x, TRUE) == "fo"))
    
    return(top)
}

xml.tree <- create.xml.tree()

doc <- newXMLDoc(node=xml.tree)
print(str(doc))
print(doc)
print(as(doc,"character"))

fn <- file.path(DATA.DIR,"doc.xml")
saveXML(doc,file=fn,encoding="UTF-8")
cat("file has been saved to:",fn,"\n")
