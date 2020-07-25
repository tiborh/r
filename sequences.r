#!/usr/bin/env Rscript

cat("Predefined sequences:\n")
cat("letters:\n")
print(letters)
cat("LETTERS:\n")
print(LETTERS)

cat("Sequences with colons:\n")
cat("1:5 == ",1:5,"\n")
cat("-5:5 == ",-5:5,"\n")
cat("5:-5 == ",5:-5,"\n")
cat("-3.0:3.0 == ",-3.0:3.0,"\n")
cat("-1.1:1.1 == ",-1.1:1.1,"\n")
print(str(-1:1))
print(str(-1.1:1.1))

cat("seq can be used for more advanced cases:\n")
cat("empty seq() ==",seq(),"\n")
cat("with single number (5) ==",seq(5),"\n")
cat("1:5 ==",seq(1,5,2),"\n")
cat("-5,5.5,by=1.5 ==",seq(-5,5.5,1.5),"\n")
cat("length.out=8  == ",seq(length.out=8),"\n")
cat("along.with=rnorm(10) (meaning: same length as) ==",seq(along.with=rnorm(10)),"\n")

cat("misc seq:\n")
cat("seq.int(1.5,5.5) ==",seq.int(1.5,5.5),"\n")
cat("seq_along(letters[1:5]) ==",seq_along(letters[1:5]),"\n")
cat("seq_len(5) ==",seq_len(5),"\n")
