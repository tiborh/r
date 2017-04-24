#!/usr/bin/env Rscript

require(tcltk2)

filename <- tclvalue(tkgetSaveFile())

if (!nchar(filename)) {
    tkmessageBox(message = "No file was selected!")
} else {
    tkmessageBox(message = paste("The file selected was", filename))
}
