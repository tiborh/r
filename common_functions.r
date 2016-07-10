## math

abs(-1)
round(rnorm(1),2)
sum(rnorm(5))
mean(rnorm(10))
sd(rnorm(10))


## seq and rep

seq(8,2,by=-2)                          # start, stop, by
rep(seq(8,2,by=-2),times=2)             # twice the above
rep(seq(8,2,by=-2),each=2)              # each twice
sort(rep(seq(8,2,by=-2),times=2))       # the above sorted
sort(rep(seq(8,2,by=-2),times=2),decreasing=T)       # reverse sort

## is.*() to check if it is, as.*() represent (cast) as another

is.list(list())                         # T
as.character(42)                        # "42"
is.character(as.character(42))          # T

list(1:3)                               # first element is a vector
as.list(1:3)                            # each list item is a one length vector

unlist(list(1:3))                       # [1] 1 2 3
unlist(as.list(1:3))                    # same as above,
## if several types are present, they are converted:
unlist(list(F,c(1:5),"name"))           # [1] "FALSE" "1"     "2"     "3"     "4"     "5"     "name"

## append

v <- 1:5
w <- 6:9
v
w
c(v,w)
append(v,w)                             # same as previous in a fancier way

## revert
rev(v)                                  # [1] 5 4 3 2 1
## string revert also in common.r:
paste0(rev(strsplit("alpha",split="")[[1]]),collapse="")

## regex functions

## grep and grepl
source("common.r")
cit10 <- us.cities(10)
cit10
grepl("e.",cit10,ignore.case=T)         # logical vector
cit10[grepl("e.",cit10,ignore.case=T)]  # filter for the finds
cit10[grepl("^e.",cit10,ignore.case=T)] # first
cit10[grepl(".e",cit10,ignore.case=T)]  # not first
cit10[grepl(".e$",cit10,ignore.case=T)] # last
cit10[grepl("\\s",cit10,ignore.case=T)] # having a space

## ?regex                                  # for help

## grep gives index numbers:
grep("e.",cit10,ignore.case=T)         # e is not last
cit10[grep("e.",cit10,ignore.case=T)]
cit10[grep("(.).*\\1",cit10,ignore.case=T,perl=T)] # repeated letter
cit10[grep("(.)\\1",cit10,ignore.case=T,perl=T)] # double letter


## sub and gsub
cit10
gsub("[AEIOUaeiou]","*",cit10)               # replacement of vowels
gsub("[AEIOUaeiou]",sample(c("a","e","i","o","u"),1),cit10) # replacement of vowels 2

## date and time
my.time <- as.POSIXct("2016-07-11 23:34:10")
my.time
class(my.time)                          # "POSIXct" "POSIXt"
my.time + 1                             # seconds are incremented
unclass(my.time)                        # seconds since start of epoch time,
                                        # as first element of a list

my.date <- as.Date("2016-07-11")
my.date + 1                             # days are incremented
class(my.date)                          # date
typeof(my.date)                         # doble
unclass(my.date)                        # days since start of epoch

format(my.date,"%d %B %Y")

date1 <- as.Date("31 August 2015",format="%d %B %Y")
date1

unclass(Sys.time())

diff(date.generator(5))                 # time diferences in days
diff(time.generator(5))

mean(diff(date.generator(5)))           # average time difference

?as.Date

## packages to check out:
## lubridate
## zoo
## xts
