generate.data <- function(COLNUM = 15,ROWNUM = 15) {
    the.dates <- seq(as.Date("2017-02-03"), by = "day", length.out = ROWNUM)
    src.data = data.frame(the.dates)
    for( i in 1:COLNUM ) {
        src.data <- cbind(src.data,sample(seq(1,i+1),size=ROWNUM,replace=T))
    }
    names(src.data)[1] <- "Date"
    names(src.data)[2:(COLNUM+1)] <- LETTERS[1:COLNUM]
    return(src.data)
}

the.data <- generate.data()
str(the.data)

THRESHOLD <- 6
small.values.index <- which(sapply(the.data[2:16],max) < THRESHOLD)+1
print(small.values.index)
the.data$Other <- rowSums(the.data[small.values.index])
the.data <- the.data[,-small.values.index]
str(the.data)

library(tidyr)
clean.data <- gather(the.data,Key,Value,-Date)
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
