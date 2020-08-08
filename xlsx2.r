#!/usr/bin/env Rscript

source("common.r")

stop.if.not.installed("xlsx")

fn <- file.path(DATA.DIR,"cars.xlsx")
sn <- "cars"
xlsx::write.xlsx(cars,fn,sn,row.names=F)
cat("cars table has been written to:",fn,"\n")

cars.read <- xlsx::read.xlsx(fn,sheetName=sn)

cat("\noriginal:\n")
print(str(cars))

cat("\nRead back from xlsx:\n")
print(str(cars.read))
