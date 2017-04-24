#!/usr/bin/env Rscript

require(gWidgets)
require(gWidgetstcltk)
## or gWidgetsGtk2
## or gWidgetsrJava
## or gWidgetsWWW
## or gWidgetsQt

win <- gwindow("Tab delimited file upload example") # very small window, hard to notice

## Group 1
grp_name <- ggroup(container = win)
## label
lbl_data_frame_name <- glabel(
  "Variable to save data to: ",
  container = grp_name
)
## txt box
txt_data_frame_name <- gedit("dfr", container = grp_name)

## Group 2
grp_upload <- ggroup(container = win)

## button
btn_upload <- gbutton(
  text      = "Upload tab delimited file",
  container = grp_upload,
  ## button handler:
  handler   = function(h, ...) {
      gfile(
          text    = "Upload tab delimited file",
          type    = "open",
          action  = ifelse(svalue(chk_eurostyle), "read.delim2", "read.delim"),
          handler = function(h, ...)
          {
              tryCatch(
              {
                  data_frame_name <- make.names(svalue(txt_data_frame_name))
                  the_data <- do.call(h$action, list(h$file))
                  assign(data_frame_name, the_data, envir = globalenv())
                  svalue(status_bar) <-
                      paste(nrow(the_data), "records saved to variable", data_frame_name)
              },
              error = function(e) svalue(status_bar) <- "Could not upload data"
              )
          },
          filter = list(
              "Tab delimited" = list(patterns = c("*.txt","*.dlm","*.tab")),
              "All files" = list(patterns = c("*"))
          )
      )
  }

)

use_comma_for_decimal <- function() {
  unname(Sys.localeconv()["decimal_point"] == ",")
}

## checkbox
chk_eurostyle <- gcheckbox(
  text      = "Use comma for decimal place",
  checked   = use_comma_for_decimal(),
  container = grp_upload
)

## status bar
status_bar <- gstatusbar("", container = win)
