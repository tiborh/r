## all files in directory:
dir()
## list only r files:
list.files()

## pwd:
getwd()

## change pwd:
savedpwd <- getwd()
setwd("..")
getwd()
setwd(savedpwd)
getwd()

## including functions in another file:
source("example.r")                     # error, unless it exists

## check if library exists:
if (!require(sqldf))
    install.packages("sqldf")         # if freshly installed, next line still needs to be library(...)

## various pieces of info:
sessionInfo()

