library(data.table)
mtcars
str(mtcars)
mtcarsDT <- as.data.table(mtcars)
mtcarsDT
str(mtcarsDT)

mtcarsDT[
    mpg > 20,                           # sql where
    .(AvgHP = mean(hp),
      "MinWT(kg)" = min(wt*453.6)),     # sql select
    by = .(cyl, under5gears = gear < 5) # sql order by
]


## creation:
DT <- data.table(A = 1:6, B = letters[1:3], C = rnorm(6), D = T)
DT
str(DT)

## accepted as data.frame in packages which do not know data.table

## Indexing:

DT[1:3]
## same as:
DT[1:3,]
## last row:
DT[.N]                                  # .N = n() of dplyr

## Column selection:
DT[,.(B,C)]

## Aggregation:
DT[, .(TotalA = sum(A), MeanC = mean(C))]

## plotting
DT[, plot(A,C)]

## several operations
DT[, {
    print(A)
    hist(C)
    NULL } ]

## task:
D <- 5
str(D)
## .() always returns a data table
DT[, .(D)]                              # 6 T in a column, data.table
DT[, D]                                 # 6 T in a row, vector

DTB <- data.table(A=1:5, B=letters[1:5], C=6:10)
DTB[, .(D)]                             # 1: 5 (colname: D)
DTB[, D]                                # [1] 5

DTB[1]                                  # first row
class(DTB[1])                           # [1] "data.table" "data.frame"

DTA <- data.table(A=1:6, B=letters[1:2], C=7:12)
DTA
DTA[, .(SumA=sum(A),MeanC=mean(C)), by = .(B)]

## DT[i, j, by = k] is pronounced:
## Take DT, subset rows using i, then calculate j grouped by by k.

## select rows 1,3 and rows B,C:
DTA[c(1,3),.(B,C)]

## ans with two columns: B and val, where val is the product of A and C.
ans <- DTA[,.(B,"val"=A+C)]

## another example:
target <- data.table(B = c("a", "b", "c", "d", "e", "a", "b", "c", "d", "e"), 
                     val = as.integer(c(6:10, 1:5)))
DTB[, .(B = c(B,B), val = c(C,A))]


## grouping with functions

DTC <- data.table(A=1:10,B=sample(1:50,10,replace=T))
DTC
DTC[, .(SumB = sum(B)), by = .(Mod2 = A%%2)] # odd and even numbers

## if column names are not important:
DTC[, sum(B), by = A%%2]

## row select can also be introduced:
DTC[2:8, sum(B), by = A%%2]

iris.dt <- data.table(iris)
str(iris.dt)

iris.dt[, .(Mean.Sepal.Length = mean(Sepal.Length)), by = Species]

iris.dt[, .(Mean.Sepal.Length = mean(Sepal.Length)), by = .(Species = substr(Species,1,1))]

iris.dt[, .(num = .N), by = .(petal.area.10 = 10 * round(Sepal.Length * Sepal.Width / 10))]

## multiple numbers in j

set.seed(1L)
DT <- data.table(A = rep(letters[2:1], each = 4L), 
                 B = rep(1:4, each = 2L), 
                 C = sample(8))

DT2 <- DT[,.(C=sum(C)),by = .(A,B)]
DT2
DT[,.(C=cumsum(C)),by = .(A,B)]

## The last two value of each C by A
DT2[,.(C=tail(C,2)),by=A]

## in one step by chaining:
DT[,.(C=cumsum(C)),by = .(A,B)][,.(C=tail(C,2)),by=A]

## Chaining
DTD <- data.table(A=rep(letters[3:1],2),B=1:6)
DTD

## the two-step way:
ans <- DTD[, .(SumB=sum(B)), by = A]
ans[order(A)]

## the one-step way:
ans <- DTD[, .(SumB=sum(B)), by = A][order(A)]
ans

## Get the median of each of the four columns Sepal.Length, Sepal.Width, Petal.Length and Petal.Width while grouping by Species. Reuse the same column names (e.g. the column containing the median Sepal.Length is still called Sepal.Length). Next, order Species in descending order

## the repetitive way
iris.dt[,.(Sepal.Length=median(Sepal.Length),
           Sepal.Width=median(Sepal.Width),
           Petal.Length=median(Petal.Length),
           Petal.Width=median(Petal.Width)),
        by=Species][order(Species,decreasing=T)]

## with .SD (Subset of data) .() is not needed because lapply provides a list:
iris.dt[, lapply(.SD, median), by=Species][order(Species,decreasing=T)]


## another example:
DTE <- data.table(x=sample(1:2,7,replace=T), y=seq(1,13,by=2), z=seq(2,14,by=2))
DTE[, lapply(.SD, mean),by=x]

## .SDcols to specify which columns to work with
DTF <- data.table(grp=sample(c(6,8),5,replace=T),
                  Q1=sample(1:5,5,replace=T),
                  Q2=sample(1:5,5,replace=T),
                  Q3=sample(1:5,5,replace=T),
                  H1=sample(1:5,5,replace=T),
                  H2=sample(1:5,5,replace=T))
## sum of the Q columns:
DTF[, lapply(.SD,sum),by=grp,.SDcols=c("Q1","Q2","Q3")]

## Select all but the first row of groups 6 and 8, returning only the grp column and the Q columns
DTF[, .SD[-1],by=grp,.SDcols=c("Q1","Q2","Q3")]

## DTE is used again:
## Sum of all columns and the number of rows
DTE[, .(x1=x,x,y,z,N=c(1))][,lapply(.SD,sum),by=x1][,.(x=x1,x,y,z,N)]
DTE[, lapply(c(.SD,N=.N), sum), by=x, .SDcols = c("x","y","z")]

## Cumulative sum of column x and y while grouping by x and z > 8
DTE[, lapply(.SD, cumsum), by = .(by1 = x, by2 = z>8), .SDcols = c("x", "y")]

## 1. the maximum of both x and y
## 2. combine the result from previous and group the result by by1.
DTE[, lapply(.SD, cumsum), by = .(by1 = x, by2 = z>8), .SDcols = c("x", "y")][, lapply(.SD, max), by = .(by1), .SDcols = c("x", "y")]

## := operator
DTG <- data.table(x=sample(1:2,5,replace=T),y=6:10)
print(DTG)
## reversing the order by reversing columns (no output, in-place reversal)
DTG[, c("x","z") := .(rev(x), rev(y))]    # rev == reverse

## removal of column by NULL
DTG[, a := y]                           # first adding an extra col
DTG[, b := sample(6:10)]                # one more
print(DTG)
DTG[, c("a","b") := NULL]
print(DTG)
## it can be done with a variable, but its name needs to be (bracket)-ed
Cols2Del = c("a","b")
DTG[, (Cols2Del):= .(sample(6:10),sample(6:10))]
print(DTG)
DTG[, (Cols2Del) := NULL]
print(DTG)
DTG[, paste0("X", 1:4) := rep(list(sample(6:10)),4)] # prefix
print(DTG)
DTG[, paste0("X", 1:4) := NULL] # deleting them
print(DTG)

## Functional := used as `:=`
DTG[, `:=` (a = sample(6:10), b = 1)]
print(DTG)

## after regenerating the two-column version:
DTG[2:4, z:=sum(y), by=x]
print(DTG)                              # undealt with rows are NA for z

## Exercises:
DTH <- data.table(A = letters[sample(1:2,5,replace=T)], B = 1:5)
print(DTH)
## add "Total" which sums B for each group of A
DTH[, Total:=sum(B),by=A]
## Add 1 to column B, in rows 2 and 4
DTH[c(2,4), B:=B+1]
## Total2 contains sum(B) grouped by A but just over rows 2 to 4.
DTH[2:4, Total2:=sum(B), by=A]
## Remove column "Total"
DTH[, Total := NULL]
## list notation also works:
DTH[[3]]

DTI <- data.table(A = sample(1:2,5,replace=T), B = 1:5)
print(DTI)

## Update B with B + 1
## add a new column C with A + B,
## add D with constant 2.
DTI[, `:=` (B = B+1,
            C = A+B,
            D = c(2))]
## deletion by number:
DTI[, c(3,4) := NULL]

## set() to set a data cell
DTJ <- data.table(x=1:5,y=sample(c(1,8),5,replace=T),z=sample(1:5,5,replace=T))
print(DTJ)
for (i in 1:5) set(DTJ, i, 3L, i+1)   # third column is changed, value becomes i+1 in each loop
## usage: set(data.table, row, col, value)

## setnames() to set or modify column names
setnames(DTJ,"z","newname")
print(DTJ)

## setcolorder() : to set the order of columns
setcolorder(DTJ, c("newname","x","y"))
print(DTJ)

## Exercises:
DTK <- data.table(A=sample(1:5,10,T),
                  B=sample(1:5,10,T),
                  C=sample(1:5,10,T),
                  D=sample(1:5,10,T))
print(DTK)
## Loop through columns 2,3 and 4,
## for each one select 3 rows at random
## set the value of those cells to NA.

rows.cols <- dim(DTK)

for (i in 2:4) {
    samprows <- sample(rows.cols[1],3)
    set(DTK,samprows,i,NA)
}
print(DTK)

## Change the column names to lowercase
setnames(DTK,names(DTK),tolower(names(DTK)))
print(DTK)

## Add a suffix "_2" to all column names
setnames(DTK,names(DTK),paste0(names(DTK),"_2"))
print(DTK)

## Reverse the order of the columns
setcolorder(DTK, rev(names(DTK)))
print(DTK)

## indexing
DTA[B == "a"]                           # filtering rows for one value
DTB[B %in% c("a","c","e")]              # filtering rows for a group of values
## if same appears not in "i", but in "j", a vector of boolean values is returned
v1 <- DTA[,B == "a"]
v2 <- DTB[,B %in% c("a","c","e")]
print(v1)
print(v2)
## passing them back to the table:
DTA[v1]
DTB[v2]
## what happens is: automatic indexing

## exercises
## work with iris.dt
iris.dt
setnames(iris.dt,names(iris.dt),gsub("Sepal.","",names(iris.dt)))
iris.dt[, c("Petal.Length","Petal.Width") := NULL]
print(iris.dt)

## Area is greater than 20:
iris.dt[Width * Length > 20]

## Add boolean column is_large which is T when area is greater than 25
iris.dt[, "is_large" := Width * Length > 25]

## Keys, setkey()
setkey(DTA,B)
str(DTA) # sorted by B
DTA["b"] # looks up in the key column, it would not be allowed in a DF
DTA["b", mult="first"]                # only the first row is returned
DTA["b", mult="last"]                 # only the last row is returned
DTA <- rbind(DTA,list(7,"c",13))
DTA <- rbind(DTA,list(8,"c",14))
str(DTA)                                # key is lost
setkey(DTA,B)
DTA
DTA[c("b","c")]                         # multiple lookup
DTA[c("c","d")]                         # "d" is not found
DTA[c("c","d"), nomatch = 0]            # only those found are returned

setkey(DTA,B,C)                         # two keys
DTA[.("b",8)]                           # two-key lookup
DTA[.("b",6)]                           # 6 is not found, so NA
DTA[.("b")]                             # just the first key

## advanced examples:
DTA[c('b','c'),.SD[c(1,.N)],by=.EACHI]  # first and last
DTA[c('b','c'),{print(.SD);.SD[c(1,.N)]},by=.EACHI] # print it out

## ordered joins:
## let's go back to this one:
DTA[.("b",6)]                           # 6 is not found, so NA
DTA[.("b",6), roll=T]                   # still not found, not in the whole table
DTA[.("b",7), roll=T]                   # it is still not found, rolling down does not look up
DTA[.("b",7), roll="nearest"]           # found, because it also looks upwards
DTA[.("b",13), roll=T]                  # rolling down has found it
DTA[.("b",7), roll=+Inf]                # won't work
DTA[.("b",7), roll=-Inf]                # works
DTA[.("c",11), roll=-2]                 # found
DTA[.("c",11), roll=-1]                 # not found
DTA[.("c",15:16), roll=T]            # found, even if not in the table
DTA[.("c",15:16), roll=T, rollends = F] # not found

## Exercises:
## keys can be defined at creation:
DTL <- data.table(A = letters[sample(1:3,7,T)], 
                 B = sample(1:9,7,T), 
                 C = 6:12, 
                 key = "A,B")
DTL
## getting the keys:
key(DTL)                                # vector "A" "B"
DTL[.("b",(-2):10),roll=T,rollends=T]   # roll forwards, rollends carries backwards too.
