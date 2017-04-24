#!/usr/bin/env Rscript

## Import the tcltk package
require(tcltk)

the.gui <- function() {
    ## Create a new Tk toplevel window assigned to win1
    win1 <- tktoplevel()

    ## Create a Tk button whose function (command) is to destroy the window win1
    butOK <- tkbutton(win1, text = "OK",
                      command = function() tkdestroy(win1))
    ## Place the button on the window, using the grid geometry manager
    tkgrid(butOK)
    tkfocus(win1)
    tkwait.window(win1)
}

the.gui()                               # does not wait for OK.

