if (!require(r2excel)) {
    if(!require(devtools)) install.packages("devtools")
    devtools::install_github("kassambara/r2excel")
}
library(r2excel)
library(ggplot2)

source("r2excel_src.r")

filename <- file.path("data","r2excel-example1.xlsx")

## workbook
wb <- createWorkbook(type="xlsx")

intro.tab(wb)
header.tab(wb)
par.tab(wb)
link.tab(wb)
df.tab(wb)
## plot.tab(wb)                       # does not work and crashes all ggplot too
## report.tab(wb)                     # same problem


## save
saveWorkbook(wb, filename)

## view
## xlsx.openFile(filename) # Couldn't get a file descriptor referring to the console
