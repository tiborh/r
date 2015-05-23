a <- available.packages()   # country may have to be selected at this step
head(rownames(a), 3)                    # show the names of the first few packages
head(a)                                 # more info
class(a)                                # it is a matrix
## unclass(a)                           # too much info, not recommended
install.packages("slidify")             # not available for 3.0.2
install.packages("slidify","ggplot2","devtools")
                                        # ggplot is not writeable, unable to access index for repository, you may need to sudo R

source("http://bioconductor.org/biocLite.R")
                                        # info becomes available, some data downloaded
biocLite()                              # seems to be working fine, then it fails because installed directory is not writeable, in the end if worked as sudo R
biocLite(c("GenomicFeatures","AnnotationDbi")) # same error as above, after download and build

## if any of the following does not work, try ubuntu package repo
library("ggplot2")
library("GenomicFeatures")

## once you manage to locate a library that does load, you can try:
search()                                # which lists the available functions
