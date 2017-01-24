#!/usr/bin/env Rscript

source("max_data_src.r")

the.data <- generate.data(17)
str(the.data)

other.data <- create.other(the.data)
str(other.data)

MAX.NUM <- 12
other.data <- create.other(the.data,MAXNUM=MAX.NUM)
str(other.data)

## col.num <- ncol(the.data)
## data.cols <- col.num-1                  # Date does not count
## nu.to.reduce <- data.cols - MAXNUM
## cols.to.take.out <- nu.to.reduce + 1    # + the new aggregate col


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
the.plot <- ggplot(clean.data,aes(Date,Value,fill=Key)) + geom_bar(stat="identity") +
    scale_fill_brewer("Area",palette = "Set3")

if (interactive()) {
    print(the.plot)
} else {
    fn <- "max_data.png"
    ggsave(fn,the.plot,dpi=150)
    print(paste("plot written to:",fn))
}
