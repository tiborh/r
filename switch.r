#!/usr/bin/env Rscript

## Program make a simple calculator that can add,
## subtract, multiply and divide using functions
add <- function(x, y) {
return(x + y)
}
subtract <- function(x, y) {
return(x - y)
}
multiply <- function(x, y) {
return(x * y)
}
divide <- function(x, y) {
return(x / y)
}
# take input from the user
cat("Select operation.\n")
cat("1.Add\n")
cat("2.Subtract\n")
cat("3.Multiply\n")
cat("4.Divide\n")
## for non-interactive: readLines will be needed. see readlines.r
## choice = as.integer(readline(prompt="Enter choice[1/2/3/4]: "))
cat("Enter choice[1/2/3/4]: ")
choice <- as.integer(readLines("stdin",n=1))
## num1 = as.integer(readline(prompt="Enter first number: "))
cat("Enter first number: ")
num1 <- as.integer(readLines("stdin",n=1))
## num2 = as.integer(readline(prompt="Enter second number: "))
cat("Enter second number: ")
num2 <- as.integer(readLines("stdin",n=1))
operator <- switch(choice,"+","-","*","/")
result <- switch(choice, add(num1, num2), subtract(num1, num2),
                 multiply(num1, num2), divide(num1, num2))
cat(paste(num1, operator, num2, "=", result,"\n"))
