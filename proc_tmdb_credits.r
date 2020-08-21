#!/usr/bin/env Rscript

source("proc_tmdb_common.r")

create.empty.cast.df <- function() {
    return(data.frame(cast_id=numeric(),
                      character=character(),
                      credit_id=character(),
                      gender=numeric(),
                      id=numeric(),
                      name=character(),
                      order=numeric()
                      )
           )
}

create.empty.cast.df.with.movie.id <- function() {
    return(data.frame(create.empty.cast.df(),movie_id=numeric()))
}

create.empty.crew.df <- function() {
    return(data.frame(credit_id=character(),
                      department=character(),
                      gender=numeric(),
                      id=numeric(),
                      job=character(),
                      name=character()
                      )
           )
}

create.empty.crew.df.with.movie.id <- function() {
    return(data.frame(create.empty.crew.df(),movie_id=numeric()))
}

create.empty.movie.df <- function() {
    return(data.frame(movie_id=numeric(),
                         title=character()
                      )
           )
}

proc.tmdb.credits.df <- function(input.df) {
    movie.df <- create.empty.movie.df()
    cast.df <- create.empty.cast.df.with.movie.id()
    crew.df <- create.empty.crew.df.with.movie.id()
    if(class(input.df) == "data.frame") {
        for(i in 1:nrow(input.df)) {
            movie.id <- input.df[i,"movie_id"]
            tmp.movie.df <- create.empty.movie.df()
            tmp.movie.df[1,"movie_id"] <- movie.id
            tmp.movie.df[1,"title"] <- input.df[i,"title"]
            tmp.cast.df <- proc.tmdb.credits.json(input.df[i,"cast"],movie.id,create.empty.cast.df)
            tmp.crew.df <- proc.tmdb.credits.json(input.df[i,"crew"],movie.id,create.empty.crew.df)
            cast.df <- rbind(cast.df,tmp.cast.df)
            crew.df <- rbind(crew.df,tmp.crew.df)
            movie.df <- rbind(movie.df,tmp.movie.df)
        }
    }
    return(list(movie=movie.df,cast=cast.df,crew=crew.df))
}

user.input <- proc.user.input()

fn1 <- "tmdb_5000_credits.csv"
credits <- proc.tmdb.fn(fn1,user.input$num.lines)
## print(str(credits))

credits.list <- proc.tmdb.credits.df(credits)
print(str(credits.list))

## save paths
fn2 <- file.path(DATA.DIR,"tmdb_5000_credits.RData")

if (!file.exists(fn2) || user.input$store.res) {
    save(credits.list,file=fn2)
    cat("processed data from",fn1,"has been saved into",fn2,"\n")
} else {
    cat("File",fn2,"already exists, so extracted data are not saved.\n")
}

