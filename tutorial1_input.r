## csv
help(read.csv)                          # the help of the function
heisenberg <- read.csv(file="data/simple.csv",head=TRUE,sep=",")
heisenberg
heisenberg[0]                           # short summary
heisenberg[1]                           # first column
heisenberg[1][1]                        # no help, still the first col
summary(heisenberg)                     # more info
heisenberg$trial                        # column by name
heisenberg$trial[0]                     # writes the levels, and type
heisenberg$mass[0]
names(heisenberg)                       # the vector of heads

## examples from help(read.csv)
test1 <- c(1:5, "6,7", "8,9,10")
test1                                   # string array
test1[0]
tf <- tempfile()                        
writeLines(test1, tf)                   # temp file has data one at a line
test2 <- read.csv(tf, fill = TRUE)      # 1 column
test2[0]                                # data frame
ncol <- max(count.fields(tf, sep = ","))
ncol                                    # 3
test3 <- read.csv(tf, fill = TRUE, header = FALSE,
                  col.names = paste0("V", seq_len(ncol)))
test3                                   # 3 cols, 7 rows, lots of NA
test3[0]

dir()                                   # what is in current dir?
getwd()                                 # pwd

## install.packages("readODS")             # uncomment if following line does not work
library(readODS)
## return only the first sheet read_ods("multisheet.ods", sheet = 2, formula_as_formula = TRUE)
## return the second sheet with formula read as formula read.ods("multisheet.ods")
## for backward compatibility purpose, not recommended.
help(read_ods)
tree <- read_ods("data/trees91.ods", col_names = TRUE, skip = 19)
head(tree)
tree <- tree[-c(1,2),]                  # cut the first two rows
dim(tree)                               # rows and cols
class(tree)                             # data frame
typeof(tree)                            # list
str(tree)                               # structure
ls()
tree1 <- read.csv(file="data/trees91.csv",header=TRUE,sep=",");
str(tree1)
head(tree1)
levels(tree1$CHBR)
## problem: data in tree is string, whereas data in tree1 is numeric
help(as.numeric)                        # does not work on lists
help(sapply)                            # the way to work with lists
sapply(tree,as.numeric)                 # there is a problem with decimal commas
tree2 <- sub(",",".",as.matrix(tree))
head(tree2)
tree3 <- sapply(tree1,as.numeric)       # problem1: CHBR should not be numeric
                                        # problem 2: structure is absolutely different too
head(tree3)
str(tree3)
tree3[0]                                # atomic vector
tree3 <- as.data.frame(tree3)
str(tree3)
tree3$CHBR <- factor(tree$CHBR)
levels(tree3$CHBR)
## now the numeric to integer
tree3$C <- as.integer(tree3$C)
tree3$N <- as.integer(tree3$N)
tree3$REP <- as.integer(tree3$REP)
tree3$LFBCC <- as.integer(tree3$LFBCC)
tree3$STBCC <- as.integer(tree3$STBCC)
tree3$RTBCC <- as.integer(tree3$RTBCC)
all.equal(tree1,tree3)                  # TRUE
## now we can safely remove other trees
rm(tree,tree1,tree2)
tree <- tree3
rm(tree3)
attributes(tree)
summary(tree$CHBR)                      # which factor used how many times
summary(tree$C)                         # number related statistics
levels(tree$C)                          # null
tree$C <- factor(tree$C)                # now summary shows which number how many times, and they are the levels too

## fix-width data
help(read.fwf)
dat = read.fwf('data/fixedWidth.dat',widths=c(-17,15,7),col.names=c('temp','offices'))
print(dat)
str(dat)
