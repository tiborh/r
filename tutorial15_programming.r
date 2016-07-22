## if/else is shown in lots of other places
## noteworthy: {} can be omitted along the same lines as in C/C++/Java

## for -> more like Perl's foreach:
for(i in seq(0,1,by=0.3))
    cat(i,"\n")

x <- c(1,2,4,8,16)
for (anItem in x)
    cat("anItem:\t",anItem,"\n")

## while
i <- 1
x <- 1
while(x < 4) {
    x <- rnorm(1,mean=2,sd=3)
    cat("trhing this value: ",x," (", i," times in loop)\n")
    i <- i + 1
}

## repeat (intrinsically, infinite loop) only break can free from it
rm(x)
repeat {
    x <- rnorm(1)
    print(x)
    if(x < -2.0) break
}
## x survives the loop
cat("Final value: ",x,"\n")

## switch: it is a function, returns the item with the index the first item provides, if it can be found, limitation: it can only be an enumerated list
switch(1,2)                             # 2
?switch
## from help:
?gl
ff <- gl(3,1, labels=LETTERS[3:1])
ff                                      # C B A, Levels C B A
ff[1]                                   # C
gl(1,4)                                 # 1 1 1 1 Levels: 1
gl(1,4,20)                              # 20 1's, Levels: 1
gl(2,2,20)                              # 1 1 2 2 1 1 ... (20 items)
gl(2,1,20)                              # 1 2 1 2 ... (20 times)
str(ff)
switch(ff[1], A = "I am A", B="Bb..", C=" is C")# -> "I am A"
## [1] "I am A"
## Warning message:
## In switch(ff[1], A = "I am A", B = "Bb..", C = " is C") :
##   EXPR is a "factor", treated as integer.
##  Consider using 'switch(as.character( * ), ...)' instead.

y <- rnorm(5)
y
x <- "sd"
z <- switch(x,"mean"=mean(y),"median"=median(y),"variance"=var(y),"sd"=sd(y))
z
x <- "median"
z <- switch(x,"mean"=mean(y),"median"=median(y),"variance"=var(y),"sd"=sd(y))
z

## switch in function
samp <- function(a,b) {
    value = switch(a,"median"=median(b),"mean"=mean(b),"variance"=var(b))
    largeVals = length(c[c>1])
    aList <- list(value,largeVals)
    names(aList) = c(a,"LargeVals")
    return(aList)
}

c <- 1:5
res <- samp("median",c)
res

## scan: to read input
?scan
## example from help:
cat("TITLE extra line", "2 3 5 7", "11 13 17", file = "ex.data", sep = "\n")
pp <- scan("ex.data", skip = 1, quiet = TRUE)
pp                                      # all in one vector
scan("ex.data", skip = 1)               # same, with Read 7 items
scan("ex.data", skip = 1, nlines = 1) # only 1 line after the skipped one
scan("ex.data", what = list("","","")) # flush is F -> read "7" (4 records)
scan("ex.data", what = list("","",""), flush = TRUE) # 3 records
unlink("ex.data") # tidy up

scan(text = "1 2 3")                    # inline usage

a <- scan(what=double(0))               # user input, empty line is end of inputs
a                                       # one vector
typeof(a)                               # double
class(a)                                # numeric
str(a)                                  # num [1:2] 3.4 2.3

a <- scan(what=double(0))
## Error in scan(what = double(0)) : scan() expected 'a real', got 'yo'

a <- scan(what=double(0),nmax=1,multi.line = FALSE) # only one line
str(a)
summary(a)

