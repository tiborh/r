require(utils)
     
expand.grid(height = seq(60, 80, 5), weight = seq(100, 300, 50),
            sex = c("Male","Female"))
     
x <- seq(0, 10, length.out = 100)
y <- seq(-1, 1, length.out = 20)
d1 <- expand.grid(x = x, y = y)
d2 <- expand.grid(x = x, y = y, KEEP.OUT.ATTRS = FALSE)
object.size(d1) - object.size(d2)
##-> 5992 or 8832 (on 32- / 64-bit platform)

str(d1)
summary(d1$y)
str(d2)

## each with each
expand.grid(1:10,1:10)

## compare with:
outer(1:10,1:10)                        # FUN is multiplicatioun by default
