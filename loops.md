Loops
================
`tibor`
`2016-07-10`

Tutorials as Light R Markdown Documents
=======================================

Loops
-----

Contents of `loops.r`

``` r
## repeat: without any condition, only break can end it

repeat {
    num <- sample(1:10,1,replace=T)
    cat("number drawn: ",num,"\n")
    if (num == 3) break;
}
```

    ## number drawn:  2 
    ## number drawn:  6 
    ## number drawn:  1 
    ## number drawn:  5 
    ## number drawn:  9 
    ## number drawn:  9 
    ## number drawn:  2 
    ## number drawn:  2 
    ## number drawn:  10 
    ## number drawn:  5 
    ## number drawn:  4 
    ## number drawn:  4 
    ## number drawn:  10 
    ## number drawn:  6 
    ## number drawn:  6 
    ## number drawn:  2 
    ## number drawn:  1 
    ## number drawn:  8 
    ## number drawn:  3

``` r
## while: entry condition, break and next can be used

num <- 0

while (num != 3) {
    num <- sample(1:10,1,replace=T)
    cat("number drawn: ",num,"\n")
}
```

    ## number drawn:  9 
    ## number drawn:  6 
    ## number drawn:  8 
    ## number drawn:  10 
    ## number drawn:  4 
    ## number drawn:  2 
    ## number drawn:  10 
    ## number drawn:  10 
    ## number drawn:  10 
    ## number drawn:  6 
    ## number drawn:  10 
    ## number drawn:  3

``` r
## for: sequences

### looping through elements

for(a in 1:10)
    cat("Loop at number: ",a,"\n");
```

    ## Loop at number:  1 
    ## Loop at number:  2 
    ## Loop at number:  3 
    ## Loop at number:  4 
    ## Loop at number:  5 
    ## Loop at number:  6 
    ## Loop at number:  7 
    ## Loop at number:  8 
    ## Loop at number:  9 
    ## Loop at number:  10

``` r
#### backwards

for(a in 10:1)
    cat("Loop at number: ",a,"\n");
```

    ## Loop at number:  10 
    ## Loop at number:  9 
    ## Loop at number:  8 
    ## Loop at number:  7 
    ## Loop at number:  6 
    ## Loop at number:  5 
    ## Loop at number:  4 
    ## Loop at number:  3 
    ## Loop at number:  2 
    ## Loop at number:  1

``` r
## for: indeces

a <- sample(10)

for (i in 1:length(a))
    cat("Loop at index: ",i," and at number: ",a[i],"\n")
```

    ## Loop at index:  1  and at number:  4 
    ## Loop at index:  2  and at number:  5 
    ## Loop at index:  3  and at number:  6 
    ## Loop at index:  4  and at number:  9 
    ## Loop at index:  5  and at number:  2 
    ## Loop at index:  6  and at number:  7 
    ## Loop at index:  7  and at number:  3 
    ## Loop at index:  8  and at number:  1 
    ## Loop at index:  9  and at number:  8 
    ## Loop at index:  10  and at number:  10

``` r
### Looping through Strings

b <- "Hello world!"

for (i in nchar(b):1)
    cat(substr(b,i,i))
```

    ## !dlrow olleH

``` r
### Looping through a Matrix

c <- matrix(1:12,nrow=3)

for(j in 1:nrow(c)) {
    for(i in 1:ncol(c))
        cat(c[j,i],"\t")
    cat("\n")
}
```

    ## 1    4   7   10  
    ## 2    5   8   11  
    ## 3    6   9   12  

``` r
### Looping through a List

d <- list(a,b,c)

for (i in 1:length(d)) {
    cat("link item ",i,":\n\t")
    print(d[[i]])
}
```

    ## link item  1 :
    ##   [1]  4  5  6  9  2  7  3  1  8 10
    ## link item  2 :
    ##  [1] "Hello world!"
    ## link item  3 :
    ##       [,1] [,2] [,3] [,4]
    ## [1,]    1    4    7   10
    ## [2,]    2    5    8   11
    ## [3,]    3    6    9   12
