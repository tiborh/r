generate.data <- function(COLNUM = 15,ROWNUM = 15,MINVAL=1) {
    if (COLNUM <= 0)
        stop("COLNUM must be one (1) or greater")
    if (ROWNUM <= 0)
        stop("ROWNUM must be one (1) or greater")
    the.dates <- seq(Sys.Date()-(COLNUM-1), by = "day", length.out = ROWNUM)
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
        max.vals <- sapply(the.data[2:ncol(the.data)],max)
        min.of.max <- min(max.vals)
        max.of.max <- max(max.vals)
        max.vals <- sample(max.vals,length(max.vals))
        the.threshold <- 0
        for(m.val in min.of.max:max.of.max) {
            num.of.cols <- sum(max.vals >= m.val,na.rm=F)
            if (num.of.cols < MAXNUM) {
                print(paste("Threshold should be:",m.val))
                the.threshold <- m.val
                output.data <- create.other.with.threshold(the.data,the.threshold)
                break;
            }
        }
    }
    return(output.data)
}
