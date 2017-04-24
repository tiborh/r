#!/usr/bin/env Rscript

require(tcltk2)

getcsv <- function() {
    name <- tclvalue(tkgetOpenFile(
        filetypes = "{ {CSV Files} {.csv} } { {All Files} * }"))
    if (name == "")
        return(data.frame()) # Return an empty data frame if no file was selected
    data <- read.csv(name)
    assign("csv_data", data, envir = .GlobalEnv)
    cat("The imported data are in csv_data\n")
}

win1 <- tktoplevel()
win1$env$butSelect <- tk2button(win1, text = "Select CSV File", command = getcsv)
tkpack(win1$env$butSelect)
tkfocus(win1)
tkwait.window(win1)

# The content of the CSV file is placed in the variable 'csv_data' in the global environment
