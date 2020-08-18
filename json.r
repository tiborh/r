#!/usr/bin/env Rscript

source("common.r")

fn <- file.path(DATA.DIR,"prize.json")
url <- "http://api.nobelprize.org/v1/prize.json"

if(!require(RCurl))
    stop("'RCurl' is needed.")

if(!require(rjson))
    stop("'rjson' is needed.")

process.laureate  <- function(a.laureate) {
    out.df <- data.frame(id=a.laureate$id,
                         firstname=a.laureate$firstname,
                         surname=NA,
                         motivation=a.laureate$motivation,
                         share=a.laureate$share)
    if ("surname" %in% names(a.laureate))
        out.df$surname <- a.laureate$surname
    ## cat("a laureate:\n")
    ## print(str(out.df))
    return(out.df)
}

process.laureates.list <- function(laureates.list) {
    out.df <- data.frame(id=character(),
                         firstname=character(),
                         surname=character(),
                         motivation=character(),
                         share=character())
    for(li in laureates.list) {
        out.df <- rbind(out.df,process.laureate(li))
    }
    ## cat("number of rows:",nrow(lout.df),"\n")
    if (nrow(out.df)==0)
        out.df[1,] <- NA
    ## cat("laureates df:\n")
    ## print(str(out.df))
    return(out.df)
}

process.prize.list <- function(prizes.list.item) {
    out.df <- data.frame(year=prizes.list.item$year,
                         category=prizes.list.item$category)
    laureates.cols <- process.laureates.list(prizes.list.item$laureates)
    out.df <- cbind(out.df,laureates.cols)
    ## cat("prize.df:\n")
    ## print(str(out.df))
    return(out.df)
}

process.prizes.list <- function(prizes.list) {
    out.df <- data.frame(year=character(),
                         category=character(),
                         id=character(),
                         firstname=character(),
                         surname=character(),
                         motivation=character(),
                         share=character())
    for(li in prizes.list) {
        out.df <- rbind(out.df,process.prize.list(li))
    }
    return(out.df)
}

if (file.exists(fn)) {
    cat("reading from file:",fn,"\n")
    prize.json <- readLines(fn)
    prize.json  <- paste(prize.json,collapse=" ")
    cat("length of prize.json:",nchar(prize.json),"\n")
} else if(url.exists(url)) {
    cat("reading from url:",url,"\n")
    prize.json <- getURL(url)
    cat("length of prize.json:",nchar(prize.json),"\n")
    prize.json <- gsub("\r","",prize.json)
    cat("saving to file:",fn,"\n")
    write(prize.json,fn)
} else {
    stop("Neither file:",fn,"\nnor url:",url,"seem to exist.")
}

cat("prize.json:\n")
print(str(prize.json))
prize.data <- fromJSON(prize.json)
cat("class of prize.data:",class(prize.data),"\n")
cat("length of prize.data:",length(prize.data),"\n")
cat("length of first item:",length(prize.data[[1]]),"\n")
cat("str of prize.data[[1]][[1]]:\n")
print(str(prize.data[[1]][[1]]))

## prizes.df <- as.data.frame(prize.data[[1]])
## print(str(prizes.df))
prizes.df <- process.prizes.list(prize.data[[1]])
print(str(prizes.df))
