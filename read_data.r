## see read_table for examples of dput/dget and dump/source

## getting data from compressed files
data <- read.csv("dat/AssetsImportCompleteSample.csv",header=T,skip=1)
print(data)
unclass(data)
rm(data)

## the conventional way:
fh <- file("dat/AssetsImportCompleteSample.csv", "r")
data <- read.csv(fh,header=T,skip=1)
close(fh)

## gzipped:
fh <- gzfile("/usr/share/man/man1/cat.1.gz","r")
x <- readLines(fh,25)
close(fh)

fh <- gzfile("dat/headofcat.gz","w")
writeLines(x,fh)
close(fh)

fh <- bzfile("dat/headofcat.bz2","w")
writeLines(x,fh)
close(fh)

## from url
fh <- url("http://www.harcsa.net", "r")
x <- readLines(fh)
head(x)
tail(x)
