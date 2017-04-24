#!/usr/bin/env Rscript

require(gWidgets)
##options("guiToolkit"="RGtk2")
options("guiToolkit"="tcltk")

hello.w <- function(msg = "Hello world") {
    w <- gbasicdialog(
        title=msg,
        ## handler = function(h,...)
        ##
    )
    ##dispose(w)
    visible(w, set=TRUE)
    return(0)
}

hello.w()

