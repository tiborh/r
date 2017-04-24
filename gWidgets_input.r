#!/usr/bin/env Rscript

require(gWidgets)
options(guiToolkit="tcltk")
##options(guiToolkit="RGtk2")

INPUT <- function(message) {
    CHOICE <- NA
    w <- gbasicdialog(
        title=message,
        handler = function(h,...)
            CHOICE <<- svalue(input)
    )
    input <- gedit("", initial.msg="", cont=w, width=10)
    addHandlerChanged(input, handler=function (h, ...) {
        CHOICE <<- svalue(input)
        dispose(w)
    })
    visible(w, set=TRUE)
    return(CHOICE)
}

repeat{
    x=INPUT("Input an integer")
    if(!is.na(as.integer(x))) break
}
print(x)
