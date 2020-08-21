proc.tmdb.fn <- function(fn,maxlines=-1) {
    fp <- file.path(DATA.DIR,fn)
    if(!file.exists(fp))
        stop("File does not exist:",fp,"\n")
    tmdb.data <- read.csv(fp,nrows=maxlines,stringsAsFactor=F)
    ## print(str(tmdb.credits))
    return(tmdb.data)
}
proc.tmdb.credits.json <- function(input.json,movie.id,create.empty.df) {
    out.df <- create.empty.df()
    if(class(input.json) == "character") {
        input.list <- fromJSON(input.json)
        for(li in input.list) {
            out.df <- rbind(out.df,as.data.frame(li),stringsAsFactors=F)
        }
    }
    if(nrow(out.df) == 0)
        out.df[1,] = NA
    out.df$movie_id = movie.id
    return(out.df)
}
