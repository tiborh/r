source("common.r")
stop.if.not.installed(c("rjson"))

proc.user.input <- function() {
    if (!require(optparse))
        stop("'optparse' needs to be installed to run this")

    option.num <- make_option(c("-n","--num_of_lines"),
                              action="store",
                              type="integer",
                              help="Number of lines to process from CSV. (-1 == all) (optional)",
                              metavar="number")
    option.store <- make_option(c("-s","--store_result"),
                                action="store_true",
                                default=F,
                                help="If used, the result will be saved in .RData file (optional)")
    option.list <- list(option.num,option.store)
    opt.parser <- OptionParser(option_list=option.list)
    opts.parsed <- parse_args(opt.parser)

    num.lines = -1

    if (!is.null(opts.parsed$num))
        num.lines=opts.parsed$num

    return(list(num.lines=num.lines,store.res=opts.parsed$store))
}

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
