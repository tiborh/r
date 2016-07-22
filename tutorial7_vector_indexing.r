## indexing with boolean vectors
a <- 1:7
b <- c(F,T,F)
a[b]                                    # 2 5, b repeating
max(a[b])                               # 5
sum(a[b])                               # 7
min(a[b])                               # 2

## handling NA
a <- c(1:6,NA)
sum(a)                                  # NA
sum(a,na.rm=T)                          # 21
is.na(a)                                # boolean vector F... T
a[!is.na(a)]                            # filtering out NA vals

## indeces with logical expressions
a <- sample(1:10,replace=T)
a
a[a<6]
d = data.frame(one=c(rep(letters[1:3],times=3)),two=a[1:9])
str(d)
both = d$two[(d$one == 'a') | (d$one == 'b')]
both

## | term by term
## || the result
c(T,T,F)|c(F,T,F)                           # T T F
c(T,T,F)||c(F,T,F)                          # T
c(T,T,F)&c(F,T,F)                           # F T F
c(T,T,F)&&c(F,T,F)                          # F


