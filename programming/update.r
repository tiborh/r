num.of.vals <- 100
c1 <- as.call(list(rnorm,num.of.vals,m=50))
c1
c2 <- call("rnorm",num.of.vals,m=50)
c2
eval(c2)

dat <- data.frame(x1 = eval(c1),
                  x2 = eval(c1),
                  x3 = eval(c1),
                  x4 = eval(c1),
                  y  = rnorm(num.of.vals))
str(dat)

m2 <- lm( y ~ log(x1) + x2*x3, data = dat)
m2
plot(m2)

suffixX <- function(fmla,x,s) {
    upform <- as.formula(paste(". ~ .", "-",x , "+", paste(x,s,sep=""), sep=""))
    update.formula(fmla, upform)
}

newfmla <- formula(m2)
newfmla
suffixX(newfmla, "x2", "c")             # log(x1) is missed by update
suffixX(newfmla, "x1", "c")             # + member leakage

do.call("substitute", list(newfmla, setNames(list(as.name("x1c")), "x1")))
