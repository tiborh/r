#!/usr/bin/env Rscript

source("common.r")

## source:
## https://www.tutorialspoint.com/r/r_binary_files.htm

## Syntax
##   * writeBin(object, con)
##   * readBin(con, what, n )
## Following is the description of the parameters used −
##   * con is the connection object to read or write the binary file.
##   * object is the binary file which to be written.
##   * what is the mode like character, integer etc. representing the bytes to be read.
##   * n is the number of bytes to read from the binary file.

## Read the "cars" data frame as a csv file and store only the columns
fn.csv = file.path(DATA.DIR,"cars.csv")
fn.bin = file.path(DATA.DIR,"cars.bin")
write.table(cars, file = fn.csv, row.names = FALSE, na = "", 
   col.names = TRUE, sep = ",")

## Store 5 records from the csv file as a new data frame.
new.cars <- read.table(fn.csv,sep = ",",header = TRUE,nrows = 5)

###########
## Write ##
###########

## Create a connection object to write the binary file using mode "wb".
write.fh = file(fn.bin, "wb")

## Write the column names of the data frame to the connection object.
writeBin(colnames(new.cars), write.fh)

## Write the records in each of the column to the file.
writeBin(c(new.cars$speed,new.cars$dist), write.fh)

## Close the file for writing so that it can be read by other program.
close(write.fh)

##########
## Read ##
##########

## Create a connection object to read the file in binary mode using "rb".
read.fh <- file(fn.bin, "rb")

## First read the column names. n = 2 as we have 2 columns.
column.names <- readBin(read.fh, character(),  n = 2)

## Next read the column values. n = 12 as we have 2 column names and 10 values.
bindata <- readBin(read.fh, integer(),  n = 12)

## Print the data.
cat("Full data (from binary file):\n")
print(bindata)

speeddata = bindata[1:5]
cat("Speed data from binary file:\n")
print(speeddata)

distdata = bindata[6:10]
cat("Dist data from binary file:\n")
print(distdata)

## Combine all the read values to a dat frame.
finaldata = cbind(speeddata, distdata)
colnames(finaldata) = column.names
cat("Combined data:\n")
print(finaldata)
