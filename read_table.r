## read.table
## some useful attribs
# file		the name of a file, or a connection
# dec		decimal separator (by default: .)
# sep 		a string indicating how the columns are separated
# quote		what is the quote char (default: ")
# as.s		weather to convert char vars to factors (default: T),
#		a vector of booleans or indeces can be used
# header 	logical indicating if the file has a header line
# colClasses 	a character vector indicating the class of each column in the dataset
# na.strings	chars to be interpreted as ‘NA’ values
# nrows		the number of rows in the dataset
# comment.char	a character string indicating the comment character
# skip		the number of lines to skip from the beginning
# stringsAsFactors
# 		should character variables be coded as factors? (default is true)
# etc
data <- read.table("dat/salesreps1.dat",sep="|",header=T,comment.char="",na.strings="NULL",
                   colClasses=c(
                       "numeric",
                       "character",
                       rep("numeric",2),
                       "factor",        # enum-like data
                       "character",          # "Date", would be better but ambiguous data is in the file
                       rep("numeric",3)
                       )
                   )
print(data)
class(data)
unclass(data)

## saving and restoring data using text files

## for single variable
dput(data)
dput(data,file="dat/salesreps.r")
y <- dget("dat/salesreps.r")
print(y)

## multiple variables
dump(c("data", "y"), file = "dat/backup.R")
rm(data, y)                             # freeing up memory
## you may try a manual check to make sure they have ceased to exist
source("dat/backup.R")
print(data)
print(y)
