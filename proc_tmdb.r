#!/usr/bin/env Rscript

source("common.r")

stop.if.not.installed(c("rjson"))

proc.tmdb.credits.cast <- function(cast.json) {
    out.df <- data.frame(cast_id=numeric(),
                         character=character(),
                         credit_id=character(),
                         gender=numeric(),
                         id=numeric(),
                         name=character(),
                         order=numeric())
    cast.list <- fromJSON(cast.json)
    for(li in cast.list) {
        out.df <- rbind(out.df,as.data.frame(li),stringsAsFactors=F)
    }
    return(out.df)
}

proc.tmdb.credits.df <- function(credits.df) {
    out.df <- data.frame(movie_id=numeric(), #1
                         title=character(),
                         cast_id=numeric(),  #3
                         character=character(),
                         credit_id=character(),
                         gender=numeric(),
                         id=numeric(),
                         name=character(),
                         order=numeric()     #9
                         )
    for(i in 1:nrow(credits.df)) {
        out.df[i,"cast_id"]=credits.df[i,"cast_id"]
        out.df[i,"title"]=credits.df[i,"cast_it"]
        out.df[i,3:9] <- proc.tmdb.credits.cast(credits.df[i,"cast"])[1,1:7]
    }
    return(out.df)
}

proc.tmdb.credits <- function(fn,maxlines=-1) {
    fp <- file.path(DATA.DIR,fn)
    if(!file.exists(fp))
        stop("File does not exist:",fp,"\n")
    tmdb.credits <- read.csv(fp,nrows=maxlines,stringsAsFactor=F)
    print(str(tmdb.credits))
    return(tmdb.credits)
}

fn1 <- "tmdb_5000_credits.csv"
credits <- proc.tmdb.credits(fn1,10)
str(credits)
stop("error in next step")
credits.df <- proc.tmdb.credits.df(credits)
print(str(credites.df))

##str(as.data.frame(fromJSON(credits[1,"cast"])[[1]]))

##fn2 <- "tmdb_5000_movies.csv"
