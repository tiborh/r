#!/usr/bin/env Rscript

## source("common.r")

if (!require(R6))
    stop("'R6' is needed.")

Stack <- R6Class("Stack",
                 private = list(
                     stacklist = NULL,
                     len  = NA
                 ),
                 public = list(
                     initialize  = function() {
                         private$stacklist <- list()
                         private$len <- 0
                     },
                     push = function(elem) {
                         private$stacklist <- append(private$stacklist,elem)
                         private$len <- length(private$stacklist)
                     },
                     push.as.item = function(elem) {
                         private$stacklist[[private$len + 1]] = elem
                         private$len = length(private$stacklist)
                     },
                     pop = function() {
                         if(private$len > 0) {
                             retval <- private$stacklist[[private$len]]
                             private$stacklist <- private$stacklist[1:private$len-1]
                             private$len <- length(private$stacklist)
                             return(retval)
                         } else {
                             return(NULL)
                         }
                     },
                     view = function(n=private$len) {
                         if (n <= private$len)
                             return(private$stacklist[[n]])
                         else
                             return(NULL)
                     },
                     length = function() {
                         return(private$len)
                     },
                     print = function(...) {
                         for(it in private$stacklist)
                             cat(it," ")
                         cat("\n")
                         invisible(self)
                     },
                     names = function() {
                         return(names(private$stacklist))
                     },
                     print.list = function() {
                         print(str(private$stacklist))
                         print(private$stacklist)
                     }
                 )
                 )

stack.test <- function() {
    if (!require(testit))
        stop("'testit' is needed.")

    s <- Stack$new()
    assert(is.null(s$len))
    assert(is.null(s$stacklist))
    s$initialize()
    assert(is.null(s$len))
    assert(is.null(s$stacklist))
    assert(s$length() == 0)
    assert(is.null(s$pop()))
    s$push(1:5)
    assert(s$length() == 5)
    s.last <- s$pop()
    assert(s.last == 5)
    assert(s$length() == 4)
    assert(s$view() == 4)
    assert(s$view(1) == 1)
    for (i in 1:4) {
        s$pop()
    }
    s.null <- s$pop()
    assert(is.null(s.null))
    assert(s$length() == 0)
    df <- data.frame(a=1:5,b=letters[1:5])
    s$push(df)
    assert(s$length() == 2)
    assert(s$names() == c("a","b"))
    s$initialize()
    s$push.as.item(df)
    assert(s$length() == 1)
    ##s$print.list()
    cat("Stack module test has passed.\n")
}

##stack.test()
