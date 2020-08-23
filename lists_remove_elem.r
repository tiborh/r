#!/usr/bin/env Rscript

## source("common.r")

## source:
## https://statisticsglobe.com/remove-element-from-list-in-r

p <- function(li) {
    cat(paste0(deparse(substitute(li)),":\n"))
    print(li)
}

l1 <- list(a=1:10, b=sample(letters,5))
p(l1)
l2 <- list(b=sample(1:10,7), c=sample(LETTERS,8))
p(l2)
l3 <- append(l1,l2)
p(l3)

cat("Remove by index: li[-2]\n")
p(l3[-2])

cat("Remove two this way: li[-c(2,4)]\n")
p(l3[-c(2,4)])

l4 <- l3

cat("Remove with NULL assignment: li[2]=NULL\n")
l4[2] = NULL
p(l4)

cat("Remove with by name and !=\n")
p(l3[names(l3) != "b"])

cat("Remove by name: li[!(names(li) %in% \"b\")]\n")
p(l3[!(names(l3) %in% "b")])
cat("or:\n")
p(l3[!(names(l3) %in% c("a","c"))])
