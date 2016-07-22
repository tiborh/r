## lapply can be used on lists or vectors
l <- list(a=51648794597,b=c("alpha","beta","gamma","delta","epsilon"),c="something else")

lapply(l,class)

## -------------------- ##

## create a vector of random strings
source("common.r")

v <- make.string.v(10)

## unlist to make the returned list a vector
vls <- unlist(lapply(v,nchar))
v
vls

## here sapply can also be used:
class(lapply(v,nchar))                  # list
vv <- sapply(v,nchar)
class(vv)                               # integer
## without names
sapply(v,nchar,USE.NAMES=F)

## -------------------- ##

nums <- sample(100,10)

## a simple multiplier
multip <- function(num,factor) {
    return(num*factor)
}

nums
## necessary function arguments can be added as further arguments in lapply
unlist(lapply(nums,multip,factor=3))

## -------------------- ##

## with unanymous functions:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

split_low

names <- lapply(split_low, function(x,i) { x[i] }, i=1)
years <- lapply(split_low, function(x,i) { x[i] }, i=2)

names
years

## -------------------- ##

## when the function returns a vector


cities.10 <- us.cities(10)

sort(cities.10)
sapply(cities.10,nchar)

first.n.last <- function(name) {
    name <- gsub("\\s", "", name,perl=T) # [[:space:]] is also good
    name <- tolower(name)
    letters <- strsplit(name, split="")[[1]]
    c(first=min(letters), max(letters))
}

first.n.last("New York")

f.n.l <- sapply(cities.10,first.n.last)
class(f.n.l)                            # matrix
f.n.l

## -------------------- ##

class(sapply(v,unique.letters))         # list, same as lapply (unique.etters is from common.r)

luni <- lapply(v,unique.letters)
suni <- sapply(v,unique.letters)

setdiff(luni,suni)
setdiff(suni,luni) # both empty, so they are equal

identical(luni,suni)                    # F, not because the names are different

## -------------------- ##

## vapply: the output format must be specified

vapply(cities.10,nchar,numeric(1))      # same as sapply(cities.10,nchar)
vapply(cities.10,first.n.last,character(2)) # same as sapply(cities.10,first.n.last)
## unique letters cannot be performed, as num in character(num) cannot be specified correctly
