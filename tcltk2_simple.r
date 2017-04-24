#!/usr/bin/env Rscript

# NOTE THAT THIS DOES NOT WORK YET WITH THE VERSION OF TCLTK2 AVAILABLE ON CRAN
require(tcltk2)
# You can configure the window at creation. If you specify a manager, it will be
# automatically used for each child widget created, unless specified otherwise
win3 <- tk2toplevel(title = "Tk2 window", manage = "grid", padx = 70, pady = 30)
# Create and place the same button (note the simpler syntax)
win3$butOK <- tk2button(text = "OK", width = -6, command = TkCmd_destroy(parent))
