## simple vector
a <- c(3,5,7,9)                     # vector
a
a[1]                                # first element
a[0]                                # type of the variable
a[5]                                # NA
a[-1]                               # all minus the first
a[-(1:2)]                           # only the second two
a[c(1,4)]                           # first and fourth
a[c(-1,-4)]                         # all but first and fourth
mean(a)
var(a)
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

## csv
help(read.csv)                          # the help of the function
heisenberg <- read.csv(file="data/simple.csv",head=TRUE,sep=",")
heisenberg
heisenberg[0]                           # short summary
heisenberg[1]                           # first column
heisenberg[1][1]                        # no help, still the first col
summary(heisenberg)                     # more info
heisenberg$trial                        # column by name
heisenberg$trial[0]                     # writes the levels, and type
heisenberg$mass[0]
names(heisenberg)                       # the vector of heads

## examples from help(read.csv)
test1 <- c(1:5, "6,7", "8,9,10")
test1                                   # string array
test1[0]
tf <- tempfile()                        
writeLines(test1, tf)                   # temp file has data one at a line
test2 <- read.csv(tf, fill = TRUE)      # 1 column
test2[0]                                # data frame
ncol <- max(count.fields(tf, sep = ","))
ncol                                    # 3
test3 <- read.csv(tf, fill = TRUE, header = FALSE,
                  col.names = paste0("V", seq_len(ncol)))
test3                                   # 3 cols, 7 rows, lots of NA
test3[0]

dir()                                   # what is in current dir?
getwd()                                 # pwd

## install.packages("readODS")             # uncomment if following line does not work
library(readODS)
## return only the first sheet read_ods("multisheet.ods", sheet = 2, formula_as_formula = TRUE)
## return the second sheet with formula read as formula read.ods("multisheet.ods")
## for backward compatibility purpose, not recommended.
help(read_ods)
tree <- read_ods("data/trees91.ods", col_names = TRUE, skip = 19)
head(tree)
tree <- tree[-c(1,2),]                  # cut the first two rows
dim(tree)                               # rows and cols
class(tree)                             # data frame
typeof(tree)                            # list
str(tree)                               # structure
ls()
tree1 <- read.csv(file="data/trees91.csv",header=TRUE,sep=",");
str(tree1)
head(tree1)
levels(tree1$CHBR)
## problem: data in tree is string, whereas data in tree1 is numeric
help(as.numeric)                        # does not work on lists
help(sapply)                            # the way to work with lists
sapply(tree,as.numeric)                 # there is a problem with decimal commas
tree2 <- sub(",",".",as.matrix(tree))
head(tree2)
tree3 <- sapply(tree1,as.numeric)       # problem1: CHBR should not be numeric
                                        # problem 2: structure is absolutely different too
head(tree3)
str(tree3)
tree3[0]                                # atomic vector
tree3 <- as.data.frame(tree3)
str(tree3)
tree3$CHBR <- factor(tree$CHBR)
levels(tree3$CHBR)
## now the numeric to integer
tree3$C <- as.integer(tree3$C)
tree3$N <- as.integer(tree3$N)
tree3$REP <- as.integer(tree3$REP)
tree3$LFBCC <- as.integer(tree3$LFBCC)
tree3$STBCC <- as.integer(tree3$STBCC)
tree3$RTBCC <- as.integer(tree3$RTBCC)
all.equal(tree1,tree3)                  # TRUE
## now we can safely remove other trees
rm(tree,tree1,tree2)
tree <- tree3
rm(tree3)
attributes(tree)
summary(tree$CHBR)                      # which factor used how many times
summary(tree$C)                         # number related statistics
levels(tree$C)                          # null
tree$C <- factor(tree$C)                # now summary shows which number how many times, and they are the levels too

## fix-width data
help(read.fwf)
dat = read.fwf('data/fixedWidth.dat',widths=c(-17,15,7),col.names=c('temp','offices'))
print(dat)
str(dat)

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
a <- matrix(c(4:2),ncol=3,byrow=TRUE)
colnames(a) <- c(LETTERS[1:3])
str(a)
summary(a)
attributes(a)
typeof(a)                               # integer
class(a)                                # matrix
a <- as.table(a)
class(a)                                # table

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
