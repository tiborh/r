#!/usr/bin/env Rscript

## source("common.r")

check_url <- function(u) {
    tryCatch(
        {
            ##message("This is the 'try' part")
            ##readLines(con=url, warn=FALSE)
            url(u)
        },
        error=function(cond) {
            message(paste("not found:", u))
            message("error msg:")
            message(cond)
            return(NA)
        },
        warning=function(cond) {
            message(u)
            message("warning msg:")
            message(cond)
            # Choose a return value in case of warning
            return(NULL)
        },
        finally={
            ##message(paste0(url,": Checked"))
            message(paste0(u,": checked"))
        }
    )    
}


urls <- c("https://harcsa.net","harcsa.net","https://silurus.in","http://this.should.not.exist")


res <- lapply(urls,check_url)
