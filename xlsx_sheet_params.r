require(xlsx)

xfile <- file.path("data","mtcars.xlsx")
file.exists(xfile)

wb <- loadWorkbook(xfile)
sheets <- getSheets(wb)
length(sheets)                          # 1
mt.sheet <- sheets[[1]]
.jmethods(mt.sheet)

sheets[[1]]$getFirstRowNum()
sheets[[1]]$getLastRowNum()
sheets[[1]]$getPhysicalNumberOfRows()

ncol(read.xlsx(xfile,1))
