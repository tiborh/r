# numeric (always double precision real)
x <- 1/2                                # 0.5
y <- 1L/2L                              # 0.5
print(y)
x = 1/Inf                               # 0
print(x)
y = 1/0                                 # Inf
print(y)
y = -1/0                                # -Inf
print(y)
x = 0/0                                 # NaN (Not a Number)
print(x)
x = x+1                                 # NaN
print(x)

# attributes() can help get or set attributes
# by default it gives back NULL when nothing has been set

# vectors
x <- c(0.5, 0.6)       ## numeric
print(x)
x <- c(TRUE, FALSE)    ## logical
print(x)
x <- c(T, F)           ## logical
print(x)
x <- c("a", "b", "c")  ## character
print(x)
x <- 9:29              ## integer
print(x)
x <- c(1+0i, 2+4i)     ## complex
print(x)

# vector function
x <- vector("numeric", length = 10)     # empty, with zeros
print(x)

# if mixed, coerced
y <- c(1.7, "a")                        # character
print(y)
y <- c(TRUE, 2)                         # numeric
print(y)
y <- c("a", TRUE)                       # character
print(y)

# explicit coercion
x <- 0:6
class(x)                                # integer
y = as.numeric(x)
class(y)                                # numeric
z = as.logical(x)                       # FALSE TRUE ...
class(z)                                # logical
ch = as.character(x)
class(ch)                               #character

# meaningless coercion
x <- c("a", "b", "c")
as.numeric(x)                           # NA with warning
as.logical(x)                           # NA without warning
as.complex(x)                           # NA with warning

# lists
x <- list(1, "a", TRUE, 1 + 4i)         # list of single-item vectors
print(x)

# matrices
# 1
k <- matrix(nrow = 2, ncol = 3)         # creating an empty one
m <- matrix(0, nrow = 2, ncol = 3)      # initialised one
print(m)
dim(m)
attributes(m)

# range for initialisation:
m <- matrix(1:6, nrow = 2, ncol = 3)
print(m)

# vector to matrix
m <- 1:10
print(m)
dim(m) <- c(2, 5)
print(m)

# several vectors to one matrix
x <- 1:3
y <- 10:12
m <- cbind(x, y)                        # column bind
print(m)
n <- rbind(x, y)                        # row bind
print(n)

# factors (very much like enum)
x <- factor(c("yes", "yes", "no", "yes", "no"))

## summary table
table(x)

## internals
unclass(x)                              # 1: no, 2: yes

## if default levels are not good (which would be allotted alphabetically):
x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))
unclass(x)                              # 1: yes, 2: no

## NA and NaN (for undefined math operations)
x <- c(1, 2, NA, 10, 3, NaN)
is.na(x)                                # all NaN is also NA
is.nan(x)                               # not all NA is NaN

## data frames
## extra attribute: row.names
## usually created by calling read.table() or read.csv() (or from db)
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
nrow(x)
ncol(x)
row.names(x)
print(x)
x[1,2]                                  # first row, second column
x[1,3]                                  # third colunn
x[3,2]                                  # row 3, col 2
x["3","bar"]                              # same with name ref

## names: by default: none
x <- 1:3
names(x)

## but you can define them
names(x) <- c("foo", "bar", "norf")
print(x)                                # they print as table headers
x["bar"]

## list with names
x <- list(a = 1, b = 2, c = 3)
print(x)
x["a"]

## matrix with names
m <- matrix(1:4, nrow = 2, ncol = 2)
print(m)                                # w/o names
dimnames(m) <- list(c("a", "b"), c("c", "d"))
print(m)                                # w names
m["a","d"]                              # ref with names
