#!/usr/bin/env Rscript

rep.func <- function(v,t) {
    cat("input:\n")
    print(v)
    cat("times",t,":\n")
    print(rep(v,times=t))
    cat("length.out",t,":\n")
    print(rep(v,length.out=t))
    cat("each",t,":\n")
    print(rep(v,each=t))
}

cat("with a single value 'a', all three options seem to do the same:\n")
rep.func('a',5)

cat("with vector input, the difference is more obvious:\n")
rep.func(letters[1:4],2)

cat("some combinations can be interesting:\n")
cat("rep(1:4, rep(c(1,2),2)):\n")
print(rep(1:4, rep(1:2,2)))
cat("rep(1:4, each = 2, len = 10):\n")
print(rep(1:4, each = 2, len = 10))
cat("rep(1:4, each = 2, times = 3):\n")
print(rep(1:4, each = 2, times = 3))

cat("At first glance replicate() is similar to rep:\n")
cat("rep(2,5):\n")
print(rep(2,5))
cat("replicate(5,2):\n")
print(replicate(5,2))
cat("But:\n")
cat("rep(c(1,2),5):\n")
print(rep(c(1,2),5))
cat("replicate(5,c(1,2)):\n")
print(replicate(5,c(1,2)))
