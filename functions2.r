#f <- function(<arguments>) {
#    ## something
#}

## for arguments
# 1. exact match for named
# 2. partial match
# 3. positional match

# named arguments with possible default values

f <- function(a,b,c=1) {
    ## something
    return(a+b+c)
}

formals(f)                              # lists the arguments
args(f)                                 # show arguments

mydata <- rnorm(100)                    # normal distribution rnorm(n, mean=0, sd=1)
                                        # sd: vector of standard deviations
print(mydata)

sd(mydata)                              # standard deviation
sd(x = mydata)
sd(x = mydata, na.rm=FALSE)
sd(na.rm=FALSE,x = mydata)              # the order is not a problem
sd(na.rm=FALSE,mydata)                  # not recommended but works

#lm(y-x, mydata, model = F, 1:10)       # fitting linear models, does not work here

## Lazy evaluation
f <- function(a,b) {
    a^2
}
f(2)                                    # b is not used in the function so it is not required

## another side effect of lazy evaluation:
f <- function(a,b) {
    print(sqrt(2))                      # executed
    print(b)                            # error
}
f(2)

## variable number of arguments
myplot <- function(x,y, type = "l", ...) {
    plot(x,y, type = type, ...)
}
x <- 1:20
y <- sqrt(x)

## partical matching does not work in some
args(paste)                             # function (..., sep = " ", collapse = NULL)
args(cat)                               # function (..., file = "", sep = " ", fill = FALSE,
                                        #           labels = NULL, append = FALSE)
paste("a","b",sep=":")
a <- 1:20
b <- 21:30
paste(a,b)
paste(a,b,sep=".")

## scoping: if you call search(), it will show what order a symbol is searched for
lm <- function(...) {
    print("pooh")
}

lm()                                    # linear model has been masked
rm(lm)
lm()                                    # error for lack of arguments

rm(z)

## lexical scoping:
f <- function(x,y) {
    print(z)                            # undpredictable, free variable (rm(z) may cause an error)
    x^2+y/z
}

f(1,2)

## a environment contains of pairs of symbols and values
## functions and non-functions have separate namespaces

rm(x)
rm(n)
## enclosure returns a function
make.power <- function(n) {
    pow <- function(x) {
        x^n
    }
    pow
}

cube <- make.power(3)
square <- make.power(2)

cube(3)
square(2)

## what's inside?
ls(environment(cube))
get("n",environment(cube))
get("pow",environment(cube))

## lexical scoping

rm(x)

y <- 10

f <- function(x) {
    y <- 2
    y^2 + g(x)
}

g <- function(x) {
    x*y
}

f(3)                                    # 34 (2^2 + 3*10)

g <- function(x) {
    a <- 3
    x+a+y
}

g(2)

## sometimes, lexical scoping can cause problems (defining environment may be difficult to find)

## optimizations (optim, nlm, optimize)

## constructor function:
set.seed(1)
normals <- rnorm(100,1,2)

make.NegLogLik <- function(data, fixed=c(F,F), debug=F) { # negative log likelihood
    params <- fixed
    function(p) {
        params[!fixed] <- p
        nu <- params[1]
        sigma <- params[2]
        if (debug) {
            cat("params: ",params,"\n")
            cat("nu: ",nu,"\n")
            cat("sigma: ",sigma,"\n")
        }
        a <- -0.5*length(data)*log(2*pi*sigma^2)
        b <- -0.5*sum((data-nu)^2) / (sigma^2)
        -(a+b)                          # maximised needs to be negated
    }
}

sample <- c(1:5)
samp.res <- make.NegLogLik(sample,debug=T)
ls(environment(samp.res))               # "data", "fixed", "params"
get("data",environment(samp.res))       # 1:5
get("fixed",environment(samp.res))      # F F
get("params",environment(samp.res))     # F F
samp.res(2)
samp.res(c(2,3))

nLL <- make.NegLogLik(normals,c(FALSE,2))
optim(c(nu=0,sigma=1),nLL)$par
optimize(nLL, c(-1,3))$minimum
x <- seq(0.5, 1.5, len = 100)           # sequence from 1.7 to 1.9
y <- sapply(x, nLL)
plot(x, exp(-(y-min(y))), type = 'l')

nLL <- make.NegLogLik(normals,c(1,FALSE))
optimize(nLL, c(1e-6,10))$minimum
x <- seq(1.7, 1.9, len = 100)           # sequence from 1.7 to 1.9
y <- sapply(x, nLL)
plot(x, exp(-(y-min(y))), type = 'l')
