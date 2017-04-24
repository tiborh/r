#!/usr/bin/env Rscript

require(tcltk2) # For themed message boxes; library(tcltk) is fine too here

res <- tkmessageBox(title = "Greetings from R TclTk",
  message = "Hello, world!", icon = "info", type = "ok")

print(class(res))                       # tclObj
print(tclvalue(res))                    # "ok"
print(as.character(res))                # "ok"

