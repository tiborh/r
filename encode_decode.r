#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=T)

if(length(args) < 1)
    stop("No command line args.")

require(base64enc)
require(testit)

trim.trailing <- function (x) sub("\\s+$", "", x)

assert("encode-decode example has failed",
       args[1] == rawToChar(base64decode(base64encode(charToRaw(args[1]),newline="\n"))))

for (it in args) {
    print(it)
    print(base64encode(charToRaw(it)))
}
