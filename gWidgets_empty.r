#!/usr/bin/env Rscript

require(gWidgets)
options("guiToolkit"="RGtk2")
##require(gWidgetstcltk)

the.gui <- function() {
    win <- gwindow("Tab delimited file upload example",width=400,height=300) 
    visible(w, set=TRUE)                # ineffective
    return(0)
}

the.gui()                               # error
