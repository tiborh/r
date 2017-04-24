#!/usr/bin/env Rscript

## Import the tcltk package
require(tcltk)

the.gui <- function() {
    ## Create a new Tk toplevel window assigned to win1
    win1 <- tktoplevel()
    tktitle(win1) <- "Tk window"

    ## Create a Ttk button with a minimum size (note negative value) of six characters
    ## The command is a lot more complicated to make it survive a reassignation to win1
    ## (explanation is beyond the scope of this introductory tutorial)
    ## Assign inside win1 to avoid the inflation of variables in the global environment
    ## We assign to win1$env, instead of win1$, so that butOK is available to all
    ## shared versions of win1 (need further explanation!)
    win1$env$butOK <- ttkbutton(win1, text = "OK", width = -6,
                                command = (function(win) {
                                    force(win);
                                    function() tkdestroy(win)})(win1))
    ## Place the button on the window, using the grid geometry manager
    tkgrid(win1$env$butOK, padx = 70, pady = 30)
    tkfocus(win1$env$butOK)
    tkwait.window(win1)
}

the.gui()                               # does not wait for OK.

