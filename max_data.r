generate.data <- function(COLNUM = 15,ROWNUM = 15,MINVAL=1) {
    the.dates <- seq(Sys.Date()-14, by = "day", length.out = ROWNUM)
    src.data = data.frame(the.dates)
    for( i in MINVAL:(MINVAL+COLNUM-1) ) {
        src.data <- cbind(src.data,sample(seq(1,i+1),size=ROWNUM,replace=T))
    }
    names(src.data)[1] <- "Date"
    names(src.data)[2:(COLNUM+1)] <- LETTERS[1:COLNUM]
    return(src.data)
}

create.other.with.threshold <- function(the.data,THRESHOLD=6) {
    output.data <- data.frame(the.data[1])
    small.values.index <- which(sapply(the.data[2:16],max) < THRESHOLD)+1
    output.data$Other <- rowSums(the.data[small.values.index])
    output.data <- merge(output.data,the.data[,-small.values.index],by="Date")
    return(output.data)
}

create.other <- function(the.data,THRESHOLD=6,MAXNUM=0) {
    output.data <- data.frame(the.data[1])
    if (MAXNUM==0) {
        output.data <- create.other.with.threshold(the.data,THRESHOLD)
    } else {
        ## make a run with minimum threshold value
        ## increment the value until the length is equals or lower than desired number of cols
        warning("MAXNUM functionality has not yet been implemented.")
    }
    return(output.data)
}
the.data <- generate.data()
str(the.data)
other.data <- create.other(the.data)
str(other.data)

MAXNUM <- 12
col.num <- ncol(the.data)
data.cols <- col.num-1                  # Date does not count
nu.to.reduce <- data.cols - MAXNUM
cols.to.take.out <- nu.to.reduce + 1    # + the new aggregate col

library(tidyr)
clean.data <- gather(other.data,Key,Value,-Date)
clean.data$Key <- factor(clean.data$Key)
#levels(factor(clean.data$Date))
str(clean.data)

## library(dplyr)
## clean.data <- clean.data %>% select(max(Value) < 5)

library(ggplot2)
library(RColorBrewer)
require(ggthemes)
ggplot(clean.data,aes(Date,Value,fill=Key)) + geom_bar(stat="identity") +
    scale_fill_brewer("Area",palette = "Set3")
