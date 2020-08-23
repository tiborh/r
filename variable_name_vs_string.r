#!/usr/bin/env Rscript

## source("common.r")

## based on:
## https://stackoverflow.com/questions/6034655/convert-string-to-a-variable-name

text.to.var <- function(name,value) {
    assign(name,value)
    cat("name of the variable:",name,"\n")
    cat("value of the variable:",eval(parse(text=name)),"\n")
    return(eval(parse(text=name)))
}

print.var <- function(v) {
    cat("name of the variable:",deparse(substitute(v)),"\n")
    cat("value of the variable:",v,"\n")
    return(deparse(substitute(v)))
}

cat("Q: How can I translate a variable name into string?\n")
cat("A: deparse(substitute(x))\n")
cat("Q: How can I convert a string into variable name?\n")
cat("A: eval(parse(text=\"x\"))\n")
cat("Q: Can I assign a value to the variable in one step?\n")
cat("A: assign(\"name\",value)\n")
n <- text.to.var("x",5)
cat("returned by text.to.var:",n,"\n")
cat("returned by print.var:",print.var(n),"\n")
