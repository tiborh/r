## string length:
nchar("A string")                       # 8

## --------------------

## case shift:

tolower("ABC")
toupper("abc")
if (!require(R.utils)) install.packages("R.utils")
library(R.utils)
## https://cran.r-project.org/web/packages/R.utils/R.utils.pdf
capitalize("alpha")
decapitalize("Alpha")
toCamelCase("Once upon a time")
timestamp()   

## --------------------

## split a string:
str(strsplit)
## function (x, split, fixed = FALSE, perl = FALSE, useBytes = FALSE)

## examples

## single string:
unlist(strsplit("1548-06-12","-"))      # in vector

## monospacing
strsplit("A text I want to display with spaces", NULL) # one-item list, all chars split
noquote(strsplit("A text I want to display with spaces", NULL)[[1]])

## list
strsplit(c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857"),':')

## --------------------

## append:

a <- "An example"
b <- "string"

paste(a,b)

b <- " string"

paste0(a,b)

## --------------------

## substring

## aStr <- paste0(sample(letters,sample(12,1)),collapse="")

aStr <- paste0(sample(letters,12),collapse="")

aStr
## end:
substr(aStr,5,nchar(aStr))
## start:
substr(aStr,1,nchar(aStr)-4)

## --------------------

## comparison and sorting:

"alpha" > "beta"                        # F
"a" == "alpha"                          # F
"a" < "A"                               # T

source("common.r")

v <- make.string.v(10)
v
sort(v)
class(sapply(v,unique.letters))         # list



## reverse
paste0(rev(strsplit("alpha",split="")[[1]]),collapse="")
str.rev("beta")
