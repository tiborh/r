#!/usr/bin/env Rscript

require(testit)
NUM.OF.LETTERS = length(LETTERS)

num.to.letter.str <- function(an.int) {
    assert(an.int >= 0)
    if (an.int == 0) {
        return("")
    } else if (an.int <= NUM.OF.LETTERS) {
        return(LETTERS[an.int])
    } else {
        next.digit <- an.int %/% NUM.OF.LETTERS
        return(paste0( num.to.letter.str(next.digit),num.to.letter.str(an.int - next.digit * NUM.OF.LETTERS)))
    }
}

args = commandArgs(trailingOnly=T)

if(length(args) < 1)
    warning("\tNo command line args.")

for (it in args)
    print(it)

num.to.convert <- ifelse(length(args) < 1, 55, as.integer(args[1]))

print("input:")
print(num.to.convert)
print("result:")
print(num.to.letter.str(num.to.convert))
