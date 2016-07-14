make.string.v <- function(num,maxStrLen=12) {
    v <- c()
    for (i in 1:num)
        v <- append(v,paste0(sample(c(letters," ","'"),sample(maxStrLen,1),replace=T),collapse=""))
    v = gsub("^\\s+|\\s+$", "", v)      # removing leading and trailing space(s)
    return(v)
}

unique.letters <- function(name) {
    name <- gsub("\\s", "", name) # [[:space:]] is also good
    name <- tolower(name)
    letters <- strsplit(name, split="")[[1]]
    sort(unique(letters))
}

us.cities <- function(num) {
    file.path = './data/us_cities.txt'
    
    if (!file.exists(file.path))
        download.file("https://wiki.skullsecurity.org/images/5/54/US_Cities.txt",file.path)

    us.cities <- scan(file=file.path,what=character(),sep="\n",quiet=T)
    ## str(us.cities)                          # 20500 items
    names <- sample(us.cities,num)

    return(names)
}

str.rev <- function(str) {
    paste0(rev(strsplit(str,split="")[[1]]),collapse="")
}

date.generator <- function(num) {
    return(sort(as.Date(sample(unclass(Sys.Date()),num),format="%s",origin="1970-01-01")))
}

time.generator <- function(num) {
    return(sort(as.POSIXct(sample(unclass(Sys.time()),num),format="%s",origin="1970-01-01 00:00:00")))
}