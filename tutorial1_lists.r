## list is composed of diverse elements
# Vector with numerics from 1 up to 10
my.vector <- 1:10 

# Matrix with numerics from 1 up to 9
my.matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my.df <- mtcars[1:10,]

# Construct list with these different elements:
my.list <- list(my.vector,my.matrix,my.df)

my.list

## naming:
names(my.list) = c("vec","mat","df")

## in one step:
my.list <- list(vec=my.vector,mat=my.matrix,df=my.df)

## selecting elements: double square brackets: [[ ]] or names
my.list[[1]]
my.list[["vec"]]
my.list$vec

## an element
my.list$vec[2]

## adding more element(s)
jp.nums <- c("零","一","二","三","四","五","六","七","八","九","十")
my.list <- c(my.list,jp.nums)           # each element will be a separate list item
my.list <- my.list[c(-14:-4)]
## adding vector as one list element
jp.nums <- list(jp.nums)                # conversion to list
my.list <- c(my.list,jp.nums=jp.nums)
