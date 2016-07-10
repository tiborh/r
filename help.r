## for all of the below look at the Help tab from

## the views of buttom right window

## for starters (opens up in browser):
help.start()

## accessing help file
?rnorm
## same as:
help(rnorm)

## search help files
help.search("rnorm")
RSiteSearch("stats")

##for the following two, the response should come through Console

##get arguments
args("rnorm")
## function (n,mean = 0, sd = 1)
## NULL

rnorm
## function (n, mean = 0, sd = 1) 
##  .External(C_rnorm, n, mean, sd)
## <bytecode: 0x59d93c8>
## <environment: namespace:stats>

str(apply)
## function (X, MARGIN, FUN, ...)

## to see only the examples (plots are drawn)
example(min)

## check the search list:
search()                                # a list of loaded envs

## functions with "plot" in their names:
apropos("plot", mode="function")

## get the functions of a library:
library(help = "stats")

## datasets available:
data()

## available vignettes:
vignette()

## vignette open:
vignette("intro")                       # The curl package: a modern R interface to libcurl
