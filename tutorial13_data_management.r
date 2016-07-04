## appending data:

a <- data.frame(one=c(sample(0:9,3)),two=c(sample(letters,3)))
b <- data.frame(one=c(sample(0:9,3)),two=c(sample(letters,3)))
print(a)
print(b)
typeof(a)                               #list

v <- rbind(a,b)                         # combined data frame
print(v)
typeof(v)                               # list

w <- cbind(a,b)                         # combined data frame
print(w)

## the same also works with matrices and vectors
A = matrix(1:6,ncol=3,byrow=T)
print(A)
typeof(A)                               # integer

B = matrix(seq(10,60,by=10),ncol=3,byrow=T)
print(B)
typeof(B)                               # double

V = rbind(A,B)
print(V)

W = cbind(A,B)
print(W)
typeof(W)                               # double


## Operations on lists and vectors
x <- list(a=rnorm(200,mean=1,sd=10),
          b=rexp(300,10.0),
          c=as.factor(sample(letters[1:3],6,replace=T)))
summary(x)                              # only Length, Class, and Mode
lapply(x,summary)                       # summary of each
plot(sort(rexp(500,10.0)),main="Exponential Distribution")

## mean
x <- list(a=rnorm(8,mean=1,sd=10),b=rexp(10,10.0))
xm <- lapply(x,mean)
typeof(xm)                              # list
xm$a                                    # -2.63767
xm$b                                    # 0.09335091
xms <- sapply(x,mean)                          # tries to return a vector or matrix
typeof(xms)                                    # double
class(xms)                                     # numeric
is.vector(xms)
xms[1]

## operations by factors
val <- data.frame(a=sample(1:50,6),b=sample(letters[1:2],6,replace=T))
str(val)
result = tapply(val$a,val$b,summary)    # apply the function to each subset of the data that matches each of the factors
typeof(result)                          # list
class(result)                           # array
str(result)
