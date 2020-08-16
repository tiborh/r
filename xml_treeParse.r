#!/usr/bin/env Rscript

## source("common.r")

if (!require("RCurl"))
    stop("'RCurl is needed.")
if (!require("XML"))
    stop("'XML' package is needed.")

url <- "https://www.w3schools.com/xml/simple.xml"

if (!url.exists(url))
    stop("url does not exist:",url)

xml <- getURL(url)
menu <- xmlTreeParse(xml, asText=TRUE)
print(menu[[1]][[1]])

menu2 <- xmlParse(xml)
print(menu2)
