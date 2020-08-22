#!/usr/bin/env Rscript

source("proc_tmdb_common.r")

is.json <- function(str) {
    if (class(try(fromJSON(str),silent=T)) == "list")
        return(T)
    else
        return(F)
}

proc.df <- function(input.df) {
    output.list <- list()
    col.names <- names(input.df)
    json.names <- vector(mode="character")
    for(colnum in 1:ncol(input.df)) {
        cat(colnum,"\n")
        cat("name of column:",col.names[colnum],"\n")
        dat.type <- class(input.df[,colnum][[1]])
        cat("data type:",dat.type,"\n")
        if(dat.type=="character") {
            if (is.json(input.df[,colnum][1])) {
                cat("json data\n")
                json.names <- union(json.names,col.names[colnum])
            } else {
                cat("non-json data\n")
            }
        }
    }
    col.names <- setdiff(col.names,json.names)
    movies.df <- subset(input.df,select=col.names)
    other.df <- subset(input.df,select=json.names)
    return(list(movies=movies.df,json=other.df))
}

proc.json.df <- function(json.df,id) {
    print(str(json.df))
    print(str(id))
    cat("to be continued...\n")
    return(list())
}

fn3 <- "tmdb_5000_movies.csv"
movies <- proc.tmdb.fn(fn3)
print(str(movies))
movies.list <- proc.df(movies)
print(str(movies.list))
proc.json.df(movies.list$json,movies.list$movies$id)
