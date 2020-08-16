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
menu <- xmlParse(xml)
print(menu)

