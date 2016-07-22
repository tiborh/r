str(cars)
class(cars[1,])                                # data.frame
is.vector(cars[1, ])                           # F
one.col.frame <- data.frame(one=1:10)
str(one.col.frame)
class(one.col.frame[1,])                # "integer", that is vector
is.vector(one.col.frame[1,])            # T

last.row.unsafe <- function(df) {
    df[nrow(df),]
}

last.row <- function(df) {
    df[nrow(df), , drop=F]              # one.col.frame will remain data.frame
}


str(last.row(cars))
str(last.row(one.col.frame))

str(cars[1])
str(cars[[1]])

## experiment:
df <- data.frame(
  a = 1L,
  b = 1.5,
  y = Sys.time(),
  z = ordered(1)
)

str(df)

class(sapply(df[1:4], class))           # list
class(sapply(df[3:4], class))           # matrix

## 2nd experiment:
A <- sapply(df[1:4], class)
B <- sapply(df[3:4], class)
C <- sapply(df[1:2], class)

class(A)                                # list
class(B)                                # matrix
class(C)                                # character

library(purrr)
X <- map(df[1:4], class)
Y <- map(df[3:4], class)
Z <- map(df[1:2], class)

str(X)
str(Y)
str(Z)

class(X[[1]])
is.vector(X[[1]])
X %>% map_chr(1)
class(map_chr(X,1))                     # get first element
class_list <- map(X, class)             # 
any(map_dbl(class_list,length) > 1)     # check if any is greater than 1

class(X)                                # list
class(Y)                                # list
class(Z)                                # list

#?any
