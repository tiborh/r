#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=T)

if(length(args) < 1)
    warning("\tNo command line args.")

for (it in args)
    print(it)

num.of.vals <- 100
c1 <- as.call(list(rnorm,num.of.vals,m=50))
## (function (n, mean = 0, sd = 1) 
## .Call(C_rnorm, n, mean, sd))(100, m = 50)
c2 <- call("rnorm",num.of.vals,m=50)
## rnorm(100, m = 50)
print(str(eval(c1)))
print(str(eval(c2)))
## seemingly, the same results

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
