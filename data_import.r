source("clean_states.r")

## utils package (default)

my.file.path = file.path(".","data","states.csv")
my.file.path
?read.table
readLines(con=my.file.path,n=5)
states <- read.table(my.file.path,header=T,sep=",")
states <- clean.states(states)
str(states)
head(states)

my.file.path0 = file.path(".","data","states0.csv")
readLines(con=my.file.path0,n=5)
#states0 <- read.table(my.file.path0,header=T,sep=",",stringsAsFactors=F)
states0 <- read.csv(my.file.path0,stringsAsFactors=F)
states0 <- clean.states0(states0)
str(states0)
tail(states0)
states0[which.min(states0$Statehood),]
states0[which.max(states0$Statehood),]

mfp <- file.path(".","data","states.txt")
states1 <- read.delim(mfp)
str(states1)
states1 <- clean.states(states1)

## with the usage of colClasses, certain columns can be excluded:
states0 <- read.table(my.file.path0,header=T,sep=",",stringsAsFactors=F)

## note: read.csv2 and read.delim2 has the field separator as ; in place of ,

## readr package:
if (!require(readr)) install.packages("readr")
library(readr)
?read_delim
vignette("column-types")
states <- read_delim(my.file.path,delim=",") # utils is better, col_types is a pain when there are too many columns
str(states)
## skip and nmax helps to process huge data in chunks
## read_csv and read_tsv are also available


## data.table
#if (!require(data.table)) install.packages("data.table")
if (!require(dtplyr)) install.packages("dtplyr")
library(dtplyr)
## fread is the key function here:
states <- fread(my.file.path)           # again, a pain: numbers are not recognised, factors are not recognised.
str(states)

class(fread(my.file.path))              # "data.table" "data.frame"
class(read_tsv(mfp))                    # "tbl_df"     "tbl"        "data.frame"

if(!require(xlsx)) install.packages("xlsx")
library(xlsx)
##vignette("xlsx")   # not much
?xlsx::read.xlsx
xfp <- file.path("data","sample.xlsx")
nuOfSheets <- length(getSheets(loadWorkbook(xfp)))
nuOfSheets

if(!require(readODS)) install.packages("readODS")
library(readODS)
ofp <- file.path("data","sample.ods")
ls(package:readODS)
ods_sheets(ofp)                         # list of sheet names
get_num_sheet_in_ods(ofp)               # how many
getNrOfSheetsInODS(ofp)                 # same
?read.ods                               # by default, all sheets are read into list
?read_ods                               # more parameters

if(!require(gnumeric)) install.packages("gnumeric")
library(gnumeric)
ls(package:gnumeric)
## ?read.gnumeric.range
## ?read.gnumeric.sheet.info
gfp <- file.path("data","sample.gnumeric")
read.gnumeric.sheet.info(gfp)           # concise and useful info
## ?read.gnumeric.sheet                    # almost the same as range
?read.gnumeric.sheets
gsl <- read.gnumeric.sheets(gfp)
str(gsl)                                # list of two, automatic column names

if(!require(readxl)) install.packages("readxl")
library(readxl)
ls(package:readxl)
## ?excel_sheets                           # list sheets
excel_sheets(xfp)                       # list of sheet names
?read_excel                             # both xls and xlsx are read
## lapply to read sheets:
xlsx.list <- lapply(excel_sheets(xfp),read_excel,path=xfp,col_names=F) # very stupid: col names are T by default
str(xlsx.list)

if(!require(gdata)) install.packages("gdata")
library(gdata)
ls(package:gdata)                       # lots of functions, just like xlsx
help(gdata)                             # only xls is handled, xlsx is not

if(!require(XLConnect)) install.packages("XLConnect")
library(XLConnect)
ls(package:XLConnect)                   # feature-rich
wb <- loadWorkbook(xfp)
class(wb)                               # "workbook", a connection to the file
str(wb)
getSheets(wb)                           # a vector of the sheet names
sh1 <- readWorksheet(wb,getSheets(wb)[1], header=F)
str(sh1)                                # incorrect (lack of) name recognition
## partial read:
sh1p <- readWorksheet(wb,1,startRow=10,endRow=19,startCol=5,endCol=9,header=F)
sh1p                                    # a manageable subset
createSheet(wb,"added")
writeWorksheet(wb,mtcars,"added")       # complete with formatted header
saveWorkbook(wb,file.path("data","sample_modified.xlsx")) # otherwise, data is lost
