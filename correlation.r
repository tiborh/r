x <- 1:100
y <- rexp(100)
cor.test(x,y)                           # no correlation
y <- sort(y)
plot(x,y)
cor.test(x,y)                           # good correlation
y <- sort(rnorm(100))
plot(x,y)
cor.test(x,y)                           # good correlation
cor.test(x,x)                           # perfect correlation
