## Inhibit Interpretation/Conversion of Objects
m1 <- matrix(1:9,nrow=3)
print(m1)
##      [,1] [,2] [,3]
## [1,]    1    4    7
## [2,]    2    5    8
## [3,]    3    6    9
require(pander)
pander(m1)
## - - -
## 1 4 7
## 2 5 8
## 3 6 9
## - - -
df0 <- data.frame(x = m1,y = m1, z = m1)
print(df0)
##   x.1 x.2 x.3 y.1 y.2 y.3 z.1 z.2 z.3
## 1   1   4   7   1   4   7   1   4   7
## 2   2   5   8   2   5   8   2   5   8
## 3   3   6   9   3   6   9   3   6   9
typeof(df0)                             # list
length(df0)                             # 9
str(df0)
## 'data.frame':	3 obs. of  9 variables:
##  $ x.1: int  1 2 3
##  $ x.2: int  4 5 6
##  $ x.3: int  7 8 9
##  $ y.1: int  1 2 3
##  $ y.2: int  4 5 6
##  $ y.3: int  7 8 9
##  $ z.1: int  1 2 3
##  $ z.2: int  4 5 6
##  $ z.3: int  7 8 9
pander(df0)
## -----------------------------------------------------
##  x.1   x.2   x.3   y.1   y.2   y.3   z.1   z.2   z.3 
## ----- ----- ----- ----- ----- ----- ----- ----- -----
##   1     4     7     1     4     7     1     4     7  
##   2     5     8     2     5     8     2     5     8  
##   3     6     9     3     6     9     3     6     9  
## -----------------------------------------------------
df1 <- data.frame(x = I(matrix()),y = I(matrix()),z = I(matrix()))
print(df1)
##    x  y  z
## 1 NA NA NA
length(df1)                             # 3
pander(df1)
## -----------
##  x   y   z 
## --- --- ---
## NA  NA  NA 
## -----------
df2 <- data.frame(x = I(m1),y = I(m1),z = I(m1))
print(df2)
##   x.1 x.2 x.3 y.1 y.2 y.3 z.1 z.2 z.3
## 1   1   4   7   1   4   7   1   4   7
## 2   2   5   8   2   5   8   2   5   8
## 3   3   6   9   3   6   9   3   6   9
str(df2)                                # data.frame
## 'data.frame':	3 obs. of  3 variables:
##  $ x: 'AsIs' int [1:3, 1:3] 1 2 3 4 5 6 7 8 9
##  $ y: 'AsIs' int [1:3, 1:3] 1 2 3 4 5 6 7 8 9
##  $ z: 'AsIs' int [1:3, 1:3] 1 2 3 4 5 6 7 8 9
typeof(df2)                             # list
length(df2)                             # 3
## pander(df2)
## Error in `[<-.data.frame`(`*tmp*`, , j, value = c("1", "2", "3", "4",  : 
##   replacement has 9 rows, data has 3
