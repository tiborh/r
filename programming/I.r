m1 <- matrix(1:9,nrow=3)
m1
df1 <- data.frame(x = I(matrix()),y = I(matrix()),z = I(matrix()))
df2 <- data.frame(x = I(m1),y = I(m1),z = I(m1))
## df1$x = m1                             # error: replacement has 3 rows, data has 1

df2
##   x.1 x.2 x.3 y.1 y.2 y.3 z.1 z.2 z.3
## 1   1   4   7   1   4   7   1   4   7
## 2   2   5   8   2   5   8   2   5   8
## 3   3   6   9   3   6   9   3   6   9
str(df2)                                # data.frame
typeof(df2)                             # list
