#!/usr/bin/env Rscript

source("common.r")

## based on:
## https://www.tutorialspoint.com/r/r_time_series_analysis.htm

prepare.data <- function(fn) {
    out.data <- read.table(fn, sep = "", header = F,
                           na.strings ="-999.00", stringsAsFactors= F)
    ## for(i in 3:8) {
    ##     cat("i ==",i,"\n")
    ##     print(length(levels(factor(as.character(out.data[,i])))))
    ## }
    out.data <- data.frame(date=as.POSIXct(paste(out.data$V1,out.data$V2,"1",sep="-")),data=out.data$V8)
    out.data <- aggregate(out.data["data"],list(month=cut(out.data$date, breaks="month")),mean,na.rm=T)
    out.data$month <- as.POSIXct(out.data$month)
    return(out.data)
}

fn.98 <- file.path(DATA.DIR,"cmap_mon_v2008_98.txt")
fn.99 <- file.path(DATA.DIR,"cmap_mon_v2008_99.txt")

cat("processing 98 data set:\n")
data.98 <- prepare.data(fn.98)
print(str(data.98))

cat("processing 99 data set:\n")
data.99 <- prepare.data(fn.99)
print(str(data.99))

fn <- file.path(IMG.DIR,"timeseries2_line.png")
png(file=fn)
combined.ts <- ts(data=matrix(c(data.98$data,data.99$data),nrow=12),start=1,frequency=12)
dimnames(combined.ts)[[2]] <- c("1998","1999")
dimnames(combined.ts)[[1]] <- month.abb
print(combined.ts)
plot(combined.ts,main="1998 vs 1999")
dev.off()
cat("Combined timeseries has been written to:",fn,"\n")

cat("time series sucks as always, so another way:")

fn <- file.path(IMG.DIR,"timeseries2_fixed.png")
png(file=fn)
par(mfrow=c(2,1))
plot(data.98,main="1998",type="l")
plot(data.99,main="1999",type="l")
dev.off()
cat("Fixed timeseries has been written to:",fn,"\n")
