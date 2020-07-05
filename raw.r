#!/usr/bin/env Rscript

a <- "Hello"
cat(a," (original)\n")
a.raw <- charToRaw(a)
cat(a.raw," (charToRaw(txt))\n")
a.back <- rawToChar(a.raw)
cat(a.back," (rawToChar(raw))\n")
