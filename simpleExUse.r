source('simpleEx.r')
## an example run:
## The mean of x is  0.1870724 
## The summary of x is 
##  -1.094 -0.4964 0.1322 0.1871 0.9139 1.684 
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0940 -0.4964  0.1322  0.1871  0.9139  1.6840 

source('simpleEx.r',echo=TRUE)
## an example run:
## > # Define a variable.
## > x <- rnorm(10)

## > # calculate the mean of x and print out the results.
## > mux = mean(x)

## > cat("The mean of x is ",mean(x),"\n")
## The mean of x is  -0.1825873 

## > # print out a summary of the results
## > summary(x)
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -1.34000 -0.63750 -0.07048 -0.18260  0.29050  0.86790 

## > cat("The summary of x is \n",summary(x),"\n")
## The summary of x is 
##  -1.34 -0.6375 -0.07048 -0.1826 0.2905 0.8679 

## > print(summary(x))
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -1.34000 -0.63750 -0.07048 -0.18260  0.29050  0.86790 

source('simpleEx.r',print.eval=TRUE)
## The mean of x is  -0.5171978 
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -2.5350 -1.2500 -0.7960 -0.5172  0.1330  2.4820 
## The summary of x is 
##  -2.535 -1.25 -0.796 -0.5172 0.133 2.482 
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -2.5350 -1.2500 -0.7960 -0.5172  0.1330  2.4820

source('simpleEx.r',verbose=TRUE)
## 'envir' chosen:<environment: R_GlobalEnv>
## encoding = "native.enc" chosen
## --> parsed 6 expressions; now eval(.)ing them:

## >>>> eval(expression_nr. 1 )
## 		 =================

## > # Define a variable.
## > x <- rnorm(10)
## curr.fun: symbol <-
##  .. after ‘expression(x <- rnorm(10))’

## >>>> eval(expression_nr. 2 )
## 		 =================

## > # calculate the mean of x and print out the results.
## > mux = mean(x)
## curr.fun: symbol =
##  .. after ‘expression(mux = mean(x))’

## >>>> eval(expression_nr. 3 )
## 		 =================

## > cat("The mean of x is ",mean(x),"\n")
## The mean of x is  -0.205768 
## curr.fun: symbol cat
##  .. after ‘expression(cat("The mean of x is ",mean(x),"\n"))’

## >>>> eval(expression_nr. 4 )
## 		 =================

## > # print out a summary of the results
## > summary(x)
## curr.fun: symbol summary
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.5810 -0.7947 -0.2009 -0.2058  0.4251  1.0080 
##  .. after ‘expression(summary(x))’

## >>>> eval(expression_nr. 5 )
## 		 =================

## > cat("The summary of x is \n",summary(x),"\n")
## The summary of x is 
##  -1.581 -0.7947 -0.2009 -0.2058 0.4251 1.008 
## curr.fun: symbol cat
##  .. after ‘expression(cat("The summary of x is \n",summary(x),"\n"))’

## >>>> eval(expression_nr. 6 )
## 		 =================

## > print(summary(x))
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.5810 -0.7947 -0.2009 -0.2058  0.4251  1.0080 
## curr.fun: symbol print
##  .. after ‘expression(print(summary(x)))’
