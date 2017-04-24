#!/usr/bin/env Rscript

require(tcltk2)

filename <- tclvalue(tkgetOpenFile()) # Very simple, isn't it?

if (!nchar(filename)) {
  tkmessageBox(message = "No file was selected!")
} else {
  tkmessageBox(message = paste("The file selected was", filename))
}
