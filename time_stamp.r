time.stamp <- function() {
    ts <- gsub(" ","_",Sys.time())
    ts <- gsub("[-:]","",ts)
    return(ts)
}
