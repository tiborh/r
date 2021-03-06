## simple vector
a <- c(3,5,7,9)                     # vector
print(a)                            # [1] 3 5 7 9
names(a) = c("一","二","三","四")   # names to data
print(a)                            # 一 二 三 四
                                        #  3  5  7  9
## empty vector:
v1 <- vector(mode="integer",length=10)
## filling it up
v1 = 1:10
typeof(v1)



a[1]                                # first element
a[0]                                # type of the variable
a[5]                                # NA
a[-1]                               # all minus the first
a[-(1:2)]                           # only the second two
a[c(1,4)]                           # first and fourth
a[c(-1,-4)]                         # all but first and fourth
a["一"]                             # named access
a[c("二","三")]                     # accessing two values
## a["二":"四"] won't work

mean(a)                                 # 6
var(a)                                  # [1] 6.666667
typeof(a)                               # double

b <- numeric(10)
print(b)                                # 10 zeros
typeof(b)                               # list

b <- b + 5                              # each is 5
b <- b - 1
print(b)
sqrt(b)                                 # 2
exp(b)                                  # 54.59815 == e ^ 4
log(b)
exp(log(b))                             # same
(b + sqrt(b))/(exp(2)+1)
a[5] <- 11                           # to avoid the message:
## In a + b : longer object length is not a multiple of shorter object length
a + b                                   # a is used twice over to match b
(a+3)/(sqrt(5-b)*2-1)
min(a,b)                                # 3
pmin(a,b)                               # [1] 3 4 4 4 4 3 4 4 4 4

c <- character(10)
typeof(c)                               # character
c                                       # empty strings

c <- c("零","一","二","三","四","五","六","七","八","九","十")
summary(c)                              # length, character, mode
typeof(c)                               # "character"

## some more vector operations

d <- sample(0:10)
mean(d)
median(d)
quantile(d)
sd(d)
var(d)
summary(d)
min(d)
max(d)
sum(d)
sort(d)
sort(d,decreasing=T)

e <- sample(-50:50,10)
e > 0                                   # a vector of booleans
names(e) = c[2:11]
e > 0                                   # result has the same names
e[e>0]                                  # pick out the positive values only

## logical operations on vectors
f <- sample(10,5)
g <- sample(10,5)
print(f)
print(g)
f>g
f==g
f<g
f<g | g<f              # if f==g gives back all FALSE, this one gives back all TRUE
f < 5 | g > 5                           # one logival vector from two unrelated sources
3 < f & g < 7
5 <= f | 5 <= g                         # one or both condition
## as TRUE == 1, sum can be used as a count() function, which is missing from R:
sum(5 <= f | 5 <= g)

## data frames
a <- 1:4
b <- sample(seq(2,8,2))                 # randomise order of elements
c <- factor(sample(sample(LETTERS,2),4,replace=TRUE))
abc <- data.frame(first=a,second=b,f=c)
print(abc)
summary(abc)

## logical
typeof(TRUE)

a <- c(TRUE,FALSE,TRUE)
b <- c(FALSE,FALSE,TRUE)
typeof(a)                               # each is "logical"
class(a)
mode(a)
F<T                                     # under the hood F is zero, T is one
T<F
T==1                                    # T
F==0                                    # T

a|b                                     # T F T
a||b                                    # T
xor(a,b)                                # T F F
a&b                                     # F F T
a&&b                                    # F

a <- TRUE
if (a) print("good")
b <- FALSE
if (!b) print("bad")

## one way tables
a <- factor(sample(sample(LETTERS,2),10,replace=TRUE))
b <- table(a)
b                                       # a summary of data
attributes(b)
typeof(b)                               # integer
class(b)                                # table
mode(b)                                 # numeric
str(b)
summary(b)

## matrix

## recipe 1
matrix(0,3,4)                           # a simple matrix of zeroes
matrix(1:12,3,4)                        # fill it up with numbers

## recipe 2
a <- 1:8                               # starting with a vector
dim(a) <- c(2,4)                       # giving it a dimension
print(a)
class(a)                                # matrix

## recipe 3
a <- matrix(c(4:2),ncol=3,byrow=TRUE)   # ncol = number of columns, nrow is also possible
print(a)
colnames(a) <- c(LETTERS[1:3])
rownames(a) <- c("a")
print(a)
str(a)
summary(a)
attributes(a)
typeof(a)                               # integer
class(a)                                # matrix
a <- as.table(a)
class(a)                                # table

## recipe 4
## matrix from vectors
r1 <- 1:3
r2 <- 4:6
r3 <- 7:9
c(r1,r2,r3)                             # vectors merged into one
m1 <- matrix(c(r1,r2,r3),byrow=T,nrow=3)
print(m1)
colnames(m1) = c(LETTERS[1:3])
rownames(m1) = c(letters[1:3])

## recipe 5
## all in one step:
m1 <- matrix(c(r1,r2,r3),byrow=T,nrow=3,dimnames=list(c(letters[1:3]),c(LETTERS[1:3])))
print(m1)
rowSums(m1)
colSums(m1)
sum(m1)
plot(m1,main="Three Points Using Columns A and B")

## adding them to table
Total = rowSums(m1)                     # to have the "name" too
m1 = cbind(m1,Total)
Total = colSums(m1)
m1 = rbind(m1,Total)
print(m1)
## Two matrices can be combined the same way:
m1 <- matrix(1:9,byrow=T,nrow=3,dimnames=list(c(letters[1:3]),c(LETTERS[1:3])))
m2 <- matrix(10:18,byrow=T,nrow=3,dimnames=list(c(letters[4:6]),c(LETTERS[1:3])))
m3 <- rbind(m1,m2)
print(m3)

## matrix access:
m3[1]                                   # meaning [1,1]
m3[2]                                   # meaning [2,1]
m3[1,]                                  # first row
m3["a",]
m3[,1]                                  # first column
m3[,"A"]
m1[-1,]                                 # all but first row
m1[,-1]                                 # all but first col
m3[3:5,]                                # rows 3 to 5

m1*2
m1/2
m2-m1                                   # row names of the first are kept
m1+m2
m1*m2                                   # corresponding element pairs

## two-way tables
a <- sample(c("never","sometimes","often","usually","always"),20,replace=T)
b <- sample(c("yes","no","maybe"),20,replace=T)
print(a)
print(b)
ab <- table(a,b)
print(ab)
class(ab)                               # table

## manual composition
sexsmoke <- matrix(c(70,120,65,140),ncol=2,byrow=T)
rownames(sexsmoke) <- c("male","female")
colnames(sexsmoke) <- c("smoke","nosmoke")
print(sexsmoke)
class(sexsmoke)                         # matrix
sexsmoke <- as.table(sexsmoke)
class(sexsmoke)                         # table

## factors
gender.vector <- c("Male", "Female", "Female", "Male", "Male")
typeof(gender.vector)                   # "character"
class(gender.vector)                    # "character"
str(gender.vector)                      #  chr [1:5] "Male" "Female" "Female" "Male" "Male"
factor.gender.vector <- factor(gender.vector)
typeof(factor.gender.vector)            # "integer"
class(factor.gender.vector)             # "factor"
str(factor.gender.vector)               #  Factor w/ 2 levels "Female","Male": 2 1 1 2 2
levels(factor.gender.vector)
as.integer(factor.gender.vector)        # same as in str()

## ordered factor
temperature.vector <- c("high", "medium", "high", "medium","low", "high","low", "medium")
factor.temperature.vector <- factor(temperature.vector, order = TRUE, levels = c("low", "medium", "high"))
levels(factor.temperature.vector) = c("L","M","H") # renaming levels
factor.temperature.vector
summary(temperature.vector)             #    Length     Class      Mode 
                                        #         8 character character
summary(factor.temperature.vector)      #    low medium   high 
                                        #      2      3      3
ftv <- factor.temperature.vector
plot(summary(factor.temperature.vector)) # three points, no names
ftv[1]                                   # factor name is returned, not the integer number
ftv[2]
ftv[3]
ftv[1] < ftv[2]                          # works when they are ordered

## low disappears in the following:
factor.temperature.vector <- factor(temperature.vector, order = TRUE) # alphabetical levels
levels(factor.temperature.vector) <- factor(temperature.vector,order=T) # order of appearance

## string
a <- "Alma"
typeof(a)                               # "character"
class(a)                                # "character"

nchar(a)                                # string length (4)
length(a)                               # vector length (1)
