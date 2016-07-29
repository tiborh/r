x <- as.POSIXct(c("2011-02-01", "2011-02-01", "2011-02-01"))
mo <- strftime(x, "%m")
yr <- strftime(x, "%Y")
amt <- runif(3)
dd <- data.frame(mo, yr, amt)

dd.agg <- aggregate(amt ~ mo + yr, dd, FUN = sum)
dd.agg$date <- as.POSIXct(paste(dd.agg$yr, dd.agg$mo, "01", sep = "-"))
