#!/usr/bin/env Rscript

## format(x, digits, nsmall, scientific, width, justify = c("left", "right", "centre", "none"))
##   * x is the vector input.
##   * digits is the total number of digits displayed.
##   * nsmall is the minimum number of digits to the right of the decimal point.
##   * scientific is set to TRUE to display scientific notation.
##   * width indicates the minimum width to be displayed by padding blanks in the beginning.
##   * justify is the display of the string to left, right or center.

cat("Total number of digits displayed. Last digit rounded off.\n")
str1 <- "23.123456789"
num1 <- as.numeric(str1)
cat("as string:  ",str1,"\n")
cat("as number:  ",num1,"\n")
result <- format(num1, digits = 9)
result2 <- format(num1, digits=nchar(str1))
cat("formatted:  ",result,"\n")
cat("formatted2: ",result2,"\n")

cat("Display numbers in scientific notation.\n")
str1 <- c("6","13.14521")
cat("original input:",str1,"\n")
result <- format(as.numeric(str1), scientific = TRUE)
cat("result of format:",result,"\n")

cat("The minimum number of digits to the right of the decimal point.\n")
str1 <- "23.47"
cat("original input:",str1,"\n")
result <- format(23.47, nsmall = 5)
cat("formatted:",result,"\n")

cat("Format treats everything as a string.\n")
result <- format(6)
print(result)

cat("Numbers are padded with blank in the beginning for width.\n")
str1 <- "13.7"
cat(paste0("original input: |",str1,"|\n"))
result <- format(as.numeric(str1), width = 6)
cat(paste0("|",result,"|\n"))

cat("Left justify strings.\n")
result <- format("Hello", width = 10, justify = "l")
cat(paste0("|",result,"|\n"))

cat("Justfy string with center.\n")
result <- format("Hello", width = 10, justify = "c")
cat(paste0("|",result,"|\n"))

cat("Right justify strings.\n")
result <- format("Hello", width = 10, justify = "r")
cat(paste0("|",result,"|\n"))
