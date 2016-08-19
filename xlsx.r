library(xlsx)
## documentation:
## https://cran.r-project.org/web/packages/xlsx/xlsx.pdf

intro <- function() {
    ## intro: reading/writing as one chunk:

    ## reading
    file1 <- system.file("tests", "test_import.xlsx", package = "xlsx")
    str(file1)                                    # path to the file
    res <- read.xlsx(file1, 2) # read the second sheet
    ## str(res)
    ## res

    ## writing:
    file2 <- paste(tempfile(), "xlsx", sep=".")
    ## file2                                   # e.g. [1] "/tmp/RtmpNyfLTP/file6048730adf11.xlsx"
    write.xlsx(USArrests, file=file2)

    ## ?read.xlsx
    read.xlsx(file2,1)

    file3 <- file.path("data","test20160816.xlsx")
    ## ?write.xlsx
    write.xlsx(mtcars,file2,"mtcars",row.names=F) # no options of where to start, only "append"
}

## options()                               # to show system defaults

## workbook
intro.workbooks <- function() {
    ## createWorkbook(type="xlsx")
    ## loadWorkbook(file)
    ## saveWorkbook(wb, file)
    file1 <- system.file("tests", "test_import.xlsx", package = "xlsx")

    wb <- loadWorkbook(file)
    str(wb)                             # same as with xlconnect
    .jmethods(wb)                       # all callable java methods
    wb$getNumberOfSheets()              # 1

    wb2 <- createWorkbook(type="xlsx")
    wb2$getNumberOfSheets()             # 0
}

## sheets
intro.sheets <- function() {
    ## createSheet(wb, sheetName="Sheet1")
    ## removeSheet(wb, sheetName="Sheet1")
    ## getSheets(wb)

    wb <- createWorkbook(type="xlsx")
    sh1 <- createSheet(wb, sheetName="mtcars")
    .jmethods(sh1)
    sh2 <- createSheet(wb, sheetName="iris")
    saveWorkbook(wb,file.path("data","mtcars.xlsx"))
    sheets <- getSheets(wb)
    class(sheets)                       # list
    str(sheets)
    removeSheet(wb,"iris")
    saveWorkbook(wb,file.path("data","mtcars.xlsx"))
}

auto.col.width <- function() {
    dc <- dir()
    wb <- createWorkbook(type="xlsx")
    sh1 <- createSheet(wb, "dir_content")
    addDataFrame(as.data.frame(dc),sh1,row.names=F,startRow=2,startColumn=2)
    autoSizeColumn(sh1, 2)
    fn <- file.path("data","dircontent.xlsx")
    saveWorkbook(wb,fn)
}

auto.filter <- function() {
    wb <- createWorkbook(type="xlsx")
    sh1 <- createSheet(wb, "mtcars")
    addDataFrame(mtcars,sh1,row.names=F)
    addAutoFilter(sh1, paste0("A1:",LETTERS[ncol(mtcars)],"1"))
    fn <- file.path("data","mtcars.xlsx")
    saveWorkbook(wb,fn)
}

add.img.sample <- function() {
    file <- system.file("tests", "log_plot.jpeg", package = "xlsx")
    wb <- createWorkbook()
    sheet <- createSheet(wb, "Pic")
    addPicture(file, sheet)
    fn <- file.path("data","inserted_picture.xlsx")
    saveWorkbook(wb,fn)
}

add.img <- function() {
    wb <- createWorkbook(type="xlsx")
    sh1 <- createSheet(wb,"mtcars")
    library(dplyr)
    plot.d <- mtcars %>% select(gear,carb) %>% group_by(carb,gear) %>% summarise(n())
    library(tidyr)
    plot.table <- as.data.frame(spread(plot.d,gear,num,fill=0))
    addDataFrame(plot.table,sh1,row.names=F)
    names(plot.d)[3] = "num"
    library(ggplot2)
    img.path <- file.path("img","testplot.png")
    d.plot <- ggplot(plot.d,aes(carb,num,fill=factor(gear))) + geom_bar(stat="identity")
    ggsave(img.path,d.plot,width=4,height=3)
    ## png(img.path, height=600, width=800, res=250, pointsize=8)
    ## ggplot(plot.d,aes(carb,num,fill=factor(gear))) + geom_bar(stat="identity")
    ## dev.off()
    addMergedRegion(sh1, 1, 27, ncol(plot.table)+1, ncol(plot.table)+9)
    addPicture(img.path,sh1,scale=1,startColumn=ncol(plot.table)+1) # no good, image is small
    saveWorkbook(wb,fn)
}

add.merged.cell <- function() {
    wb <- createWorkbook()
    sh1 <- createSheet(wb, "merged")
    rows <- createRow(sh1, 1:10) # 10 rows
    cells <- createCell(rows, colIndex=1:8) # 8 columns
    cat("Merge cells \n")
    setCellValue(cells[[1,1]], "A title that spans 3 columns")
    addMergedRegion(sh1, 1, 1, 1, 3) # start row, end row, start col, end col
    wb.path <- file.path("data","merged.xlsx")
    saveWorkbook(wb,wb.path)
}

## cell style:
cs <- CellStyle(wb) +
    Font(wb, heightInPoints=20, isBold=TRUE, isItalic=TRUE,
         name="helvetica", color="orange") +
    Fill(backgroundColor="lavender", foregroundColor="lavender",
         pattern="SOLID_FOREGROUND") +
    Alignment(h="ALIGN_RIGHT")
setCellStyle(cell.1, cellStyle1)
## save workbook after this
