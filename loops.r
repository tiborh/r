## repeat: without any condition, only break can end it

repeat {
    num <- sample(1:10,1,replace=T)
    cat("number drawn: ",num,"\n")
    if (num == 3) break;
}

## while: entry condition, break and next can be used

num <- 0

while (num != 3) {
    num <- sample(1:10,1,replace=T)
    cat("number drawn: ",num,"\n")
}


## for: sequences

### looping through elements

for(a in 1:10)
    cat("Loop at number: ",a,"\n");

#### backwards

for(a in 10:1)
    cat("Loop at number: ",a,"\n");


## for: indeces

a <- sample(10)

for (i in 1:length(a))
    cat("Loop at index: ",i," and at number: ",a[i],"\n")

### Looping through Strings

b <- "Hello world!"

for (i in nchar(b):1)
    cat(substr(b,i,i))


### Looping through a Matrix

c <- matrix(1:12,nrow=3)

for(j in 1:nrow(c)) {
    for(i in 1:ncol(c))
        cat(c[j,i],"\t")
    cat("\n")
}

### Looping through a List

d <- list(a,b,c)

for (i in 1:length(d)) {
    cat("link item ",i,":\n\t")
    print(d[[i]])
}

## Using seq_along
source("common.r")
df <- data.frame(a=1:10,b=letters[1:10],c=LETTERS[1:10],d=us.cities(10),stringsAsFactors=F)
str(df)

for (i in seq_along(df)) {
    print(df[[i]])
}

## the difference comes out with empty data.frame:

df2 <- data.frame()

for(i in 1:length(df2)) {
    print(df2[[i]])
}                                       # Error in .subset2(x, i, exact = exact) (from #2) : subscript out of bounds

for (i in seq_along(df2)) {
    print(df2[[i]])
}                                       # no error, no output
