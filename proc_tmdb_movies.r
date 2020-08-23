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

json.to.df <- function(json.str) {
    return(plyr::ldply(lapply(fromJSON(json.str),as.data.frame), data.frame))
}

make.na.df <- function(sample.df,id) {
    na.df <- sample.df[0,]
    na.df[1,] <- NA
    na.df$movie_id = id
}

json.vect.to.df <- function(json.vect,id) {
    if(length(json.vect)==0)
        return(NULL)
    testit::assert(length(json.vect)==length(id))
    i = 1
    repeat {
        out.df <- json.to.df(json.vect[i])
        if(nrow(out.df) == 0) {
            i = i+1
            if (i > length(json.vect))
                return(NULL)
        } else {
            out.df <- cbind(out.df,movie_id=id[i])
            break
        }
    }
    if (i > 1) {
        for(j in 1:(i-1)) {
            out.df <- rbind(out.df,make.na.df(out.df,id[j]))
        }
    }
    ## print(out.df)
    for(i in 2:length(json.vect)) {
        tmp.df <- json.to.df(json.vect[i])
        if(nrow(tmp.df)==0) {
            tmp.df <- make.na.df(out.df,id[i])
            ## print(tmp.df)
        } else {
            tmp.df <- cbind(tmp.df,movie_id=id[i])
        }
        ## print(tmp.df)
        out.df <- rbind(out.df,tmp.df)
    }
    return(out.df)
}

proc.json.df <- function(json.df,id) {
    out.list <- list()
    for(a.name in names(json.df)) {
        out.list[[a.name]] <- json.vect.to.df(json.df[[a.name]],id)
    }
    return(out.list)
}

user.input <- proc.user.input()

fn1 <- "tmdb_5000_movies.csv"
movies <- proc.tmdb.fn(fn1,user.input$num.lines)
## print(str(movies))
movies.list <- proc.df(movies)
## print(str(movies.list))

other.dfs <- proc.json.df(movies.list$json,movies.list$movies$id)

warns <- warnings()
if(length(warns) > 0)
    print(warns)

## print(str(other.dfs))

movies.list$json <- NULL
movies.list <- append(movies.list,other.dfs)

print(str(movies.list))

fn2 <- file.path(DATA.DIR,"tmdb_5000_movies.RData")

if (!file.exists(fn2) || user.input$store.res) {
    save(movies.list,file=fn2)
    cat("processed data from",fn1,"has been saved into",fn2,"\n")
} else {
    cat("File",fn2,"already exists, so extracted data are not saved.\n")
}

## basic problem is that this produces a list of dfs:
## lapply(fromJSON(movies.list$json$genres[1]),as.data.frame)

## a plyr solution:
## plyr::ldply(lapply(fromJSON(movies.list$json$genres[1]),as.data.frame), data.frame)

## a dplyr solution
## dplyr::bind_rows(lapply(fromJSON(movies.list$json$genres[1]),as.data.frame))

## a data.table solution:
## data.table::rbindlist(lapply(fromJSON(movies.list$json$genres[1]),as.data.frame),use.names=T)

