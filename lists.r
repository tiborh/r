#!/usr/bin/env Rscript

a <- list(1,
          "a",
          1:10,
          data.frame(a=1:10,b=letters[1:10]),
          "aleph",
          T)

cat("The list:\n")
print(str(a))

names(a) <- c("number",
              "one.letter.string",
              "vector.of.nums",
              "data.frame",
              "one.word.string",
              "logical")
cat("Same, named:\n")
print(str(a))

cat("length:",length(a),"\n")

a[[6]] = NULL

cat("after nulling last element:",length(a),"\n")
print(str(a))

cat("checking equality:",all.equal(unlist(strsplit(paste0(letters),"")),letters),"\n")

cat("Lists can be merged like vectors:\n")
l1 = list("one","two","three")
l2 = list(1,2,3)
cat("l1:\n")
print(l1)
cat("l2:\n")
print(l2)
cat("c(l1,l2):\n")
print(c(l1,l2))

cat("unlist, back to vector\n")
print(unlist(a))
