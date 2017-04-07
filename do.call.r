## from examples:

do.call("complex", list(imag = 1:3))    # 0+1i 0+2i 0+3i

## if we already have a list (e.g., a data frame)
## we need c() to add further arguments
tmp <- expand.grid(letters[1:2], 1:3, c("+", "-")) # data.frame from vectors or factors
do.call("paste", c(tmp, sep = ""))                 # paste each cols of each row

do.call(paste, list(as.name("A"), as.name("B")), quote = TRUE) #  chr "A B"

add <- function(a,b) { return(a + b) }
A <- 3
B <- 4
add(A,B)                                # 7
do.call(add, list(as.name("A"),as.name("B"))) # 7

## examples of where objects will be found.
A <- 2
f <- function(x) print(x^2)
f(A)
env <- new.env()
assign("A", 10, envir = env)
assign("f", f, envir = env)
f <- function(x) print(x)
f(A)                                      # 2
do.call("f", list(A))                     # 2
do.call("f", list(A), envir = env)        # 4
do.call(f, list(A), envir = env)          # 2
do.call("f", list(quote(A)), envir = env) # 100
do.call(f, list(quote(A)), envir = env)   # 10
do.call("f", list(as.name("A")), envir = env) # 100

eval(call("f", A))                      # 2
eval(call("f", quote(A)))               # 2
eval(call("f", A), envir = env)         # 4
eval(call("f", quote(A)), envir = env)  # 100
