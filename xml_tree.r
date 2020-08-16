#!/usr/bin/env Rscript

source("common.r")

if (!require("XML"))
    stop("'XML' package is needed.")

x = summary(rnorm(1000))
d = xmlTree()
d$addNode("table", close = FALSE)
d$addNode("tr", .children = sapply(names(x), function(x) d$addNode("th", x)))
d$addNode("tr", .children = sapply(x, function(x) d$addNode("td", format(x))))
d$closeNode()

saveXML(d,encoding="UTF-8",file=file.path(DATA.DIR,"xml_table.xml"))
