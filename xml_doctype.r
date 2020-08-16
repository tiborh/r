#!/usr/bin/env Rscript

## source("common.r")

## source:
## https://www.rdocumentation.org/packages/XML/versions/3.99-0.5/topics/Doctype

if (!require("XML"))
    stop("'XML' package is needed.")

d = Doctype(name = "section",
            public = c("-//OASIS//DTD DocBook XML V4.2//EN",
                       "http://oasis-open.org/docbook/xml/4.2/docbookx.dtd"))
print(d)
print(as(d, "character"))

## this call switches the system to the URI associated with the PUBLIC element.
## d = Doctype(name = "section",
##             public = c("-//OASIS//DTD DocBook XML V4.2//EN"),
##             system = "http://oasis-open.org/docbook/xml/4.2/docbookx.dtd")

## print(d)
## print(as(d, "character"))
