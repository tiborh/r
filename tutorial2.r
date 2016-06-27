## getting clean data with the help of a function

cleantree <- function() {
    library(readODS)
    tree <- read_ods("data/trees91.ods", col_names = TRUE, skip = 19)
    tree <- tree[-c(1,2),]                  # cut the first two rows
    chbr <- tree$CHBR                       # to save it for later use
    tree <- sub(",",".",as.matrix(tree))    # dealing with decimal commas
    tree <- as.data.frame(tree,stringsAsFactors=F)
    tree <- sapply(tree,as.numeric)         # there is a problem with decimal commas
                                        # results in warning when dealing with CHBR column
    tree <- as.data.frame(tree,stringsAsFactors=F)
    tree$CHBR <- factor(chbr)
    tree$C <- as.integer(tree$C)
    tree$N <- as.integer(tree$N)
    tree$REP <- as.integer(tree$REP)
    tree$LFBCC <- as.integer(tree$LFBCC)
    tree$STBCC <- as.integer(tree$STBCC)
    tree$RTBCC <- as.integer(tree$RTBCC)
    tree1 <- read.csv(file="data/trees91.csv",header=TRUE,sep=",")
    print("Control:")
    print(all.equal(tree,tree1))        # two mean relative differences due to source difference
    return(tree)
}
ls()
tree <- cleantree()
str(tree)
class(tree)
head(tree)

mean(tree$LFBM)
median(tree$LFBM)
quantile(tree$LFBM)
min(tree$LFBM)
max(tree$LFBM)
var(tree$LFBM)
sd(tree$LFBM)
summary(tree$LFBM)

summary(tree)
