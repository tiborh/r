#!/usr/bin/env Rscript

library(gWidgets)
library(gWidgetstcltk)

## You can create a GUI interface to any function using ggenericwidget.
lmwidget <- ggenericwidget(lm)
