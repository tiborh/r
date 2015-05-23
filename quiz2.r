cube <- function(x, n) {
    x^3
}

cube(3)

x <- 1:10
if(x > 5) {                             # warning, only first is used
    x <- 0
}
print(x)                                # 1:10

x <- c(6,1:10)
if(x > 5) {                             # warning, only first is used
    x <- 0
}
print(x)                                # 0

f <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}

f1 <- function(x) {
    g <- function(y) {
        y + z
    }
 #   z <- 4
    x + g(x)
}

f(3)                                    # 10
z <- 10
f(3)                                    # same

if (exists("z")) rm(z)
f1(3)                                   # error, z not found
z <- 10
f1(3)                                   # 16 (due to lexical scoping)

x <- 5
y <- if(x < 3) NA else 10
print(y)                                #10

if (exists("f")) rm(f)
h <- function(x, y = NULL, d = 3L, debug=F) {
    z <- cbind(x, d)
    if (debug==T) print(z)
    if(!is.null(y))
        z <- z + y
    else
        z <- z + f
    g <- x + y / z
     if(d == 3L)
        return(g)
    g <- g + 10
    g
}

# the sequence of environments to look in is determined
# when the function is defined, but the value is determined
# when the function is called. 
h(3)                                    # f not found, free variable
h(3,1,debug=T)                          # (x,d) [1,] 3.25 3.25
h(3,1,4,debug=T)                        # 13.25 13.2
parent.frame()
