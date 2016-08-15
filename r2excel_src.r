intro.tab <- function(wb) {

    ## sheet
    sheet1 <- createSheet(wb, sheetName = "intro")
    
    ## header (with row height problem)
    xlsx.addHeader(wb, sheet1, value="Add table",level=1, 
                   color="black", underline=1)
    xlsx.addLineBreak(sheet1, 1)
    
    ## paragraph (author)
    author=paste("Author : Alboukadel KASSAMBARA,\n",
                 "(with minor modifications by 春茶智謀)\n",
                 "@:alboukadel.kassambara@gmail.com.",
                 "\n Website : http://ww.sthda.com", sep="")
    xlsx.addParagraph(wb, sheet1,value=author, isItalic=TRUE, colSpan=5, 
                      rowSpan=5, fontColor="darkgray", fontSize=14)
    xlsx.addLineBreak(sheet1, 3)
    
    ## table from dataset
    xlsx.addTable(wb, sheet1, head(iris), startCol=2)
    xlsx.addLineBreak(sheet1, 2)
}

header.tab <- function(wb) {
    ## headers
    sheet2 <- xlsx::createSheet(wb, sheetName = "heading")
    ##Header
    ##**************************************
    ## header level 1
    xlsx.addHeader(wb, sheet2, value="Header 1",level=1, color="black")
    ## header level 2
    xlsx.addHeader(wb, sheet2, value="Header 2",level=2, color="black")
    ## header level 3
    xlsx.addHeader(wb, sheet2, value="Header 3",level=3, color="black")
    ## header level 4
    xlsx.addHeader(wb, sheet2, value="Header 4",level=4, color="black")
    ## header level 5
    xlsx.addHeader(wb, sheet2, value="Header 5",level=5, color="black")
    ## header level 6
    xlsx.addHeader(wb, sheet2, value="Header 6",level=6, color="black")
}

par.tab <- function(wb) {
    ## Add paragraph
    sheet3 <- xlsx::createSheet(wb, sheetName = "paragraph")
    xlsx.addHeader(wb, sheet3, " Add paragraph", level=2, underline=1)
    xlsx.addLineBreak(sheet3, 2)
    paragraph="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
    xlsx.addParagraph(wb, sheet3, paragraph, fontSize=14, isItalic=TRUE, 
                      fontColor="darkred", colSpan=10, rowSpan=10)
}

link.tab <- function(wb) {
    ## add hyperlink
    sheet4 <- xlsx::createSheet(wb, sheetName = "hyperlink")
    xlsx.addHeader(wb, sheet4, "Add Hyperlink", level=2, underline=1)
    xlsx.addLineBreak(sheet4, 1)
    xlsx.addHyperlink(wb, sheet4, "http://www.lipsum.com/", "Lorem Ipsum resource", fontSize=12)
    xlsx.addLineBreak(sheet4, 2)
}

df.tab <- function(wb) {
    ## add dataframe
    sheet5 <- createSheet(wb, sheetName = "dataframe")
    ## add iris data using default settings
    data(iris)
    xlsx.addHeader(wb, sheet5, 
                   value="Add iris table using default settings")
    xlsx.addLineBreak(sheet5, 1)
    xlsx.addTable(wb, sheet5, head(iris))
    xlsx.addLineBreak(sheet5, 2)
 
    ## Customized table
    xlsx.addHeader(wb, sheet5, value="Customized table")
    xlsx.addLineBreak(sheet5, 1)
    xlsx.addTable(wb, sheet5, data= head(iris),
                  fontColor="darkblue", fontSize=14,
                  rowFill=c("white", "lightblue"),
                  row.names=F
                  )
    xlsx.addLineBreak(sheet5, 2)
}

## do not use: crashes the graphical output system
plot.tab <- function(wb) {
    sheet6 <- createSheet(wb, sheetName = "plots")
 
    ## box plot
    data(ToothGrowth)
    xlsx.addHeader(wb, sheet6, "Basic box plot")
    xlsx.addLineBreak(sheet6, 1)
    pf1 <- function(){
        ggplot(ToothGrowth, aes(dose,len,fill = factor(dose))) + geom_boxplot()
    }
    xlsx.addPlot(wb, sheet6, plotFunction=pf1())

    ## point plot
    xlsx.addHeader(wb, sheet6, "ggplot2")
    xlsx.addLineBreak(sheet6, 1)
    pf2 <- function(){
        p<-qplot(mpg, wt, data=mtcars)
        print(p)
    }
    xlsx.addPlot(wb, sheet6, plotFunction=pf2())
}

report.tab <- function(wb) {
    sheet7 <- xlsx::createSheet(wb, sheetName = "report")
    ## Add header
    ##+++++++++++++++++++++++++++++++
    ## Create the Sheet title and subtitle
    xlsx.addHeader(wb, sheet7, value="Excel file written with r2excel packages",
                   level=1, color="darkblue", underline=2)         
    xlsx.addLineBreak(sheet7, 2)
    ## Add paragraph : Author
    author=paste("Author : Alboukadel KASSAMBARA. \n",
                 "@:alboukadel.kassambara@gmail.com.",
                 "\n Website : http://ww.sthda.com", sep="")
    xlsx.addParagraph(wb, sheet7,value=author, isItalic=TRUE, colSpan=5, 
                      rowSpan=4, fontColor="darkgray", fontSize=14)
    xlsx.addLineBreak(sheet7, 3)
    ## Add table
    ##+++++++++++++++++++++++++++++
    ## add iris data using default settings
    data(iris)
    xlsx.addHeader(wb, sheet7, value="Add iris table using default settings", level=2)
    xlsx.addLineBreak(sheet7, 1)
    xlsx.addTable(wb, sheet7, head(iris), startCol=2)
    xlsx.addLineBreak(sheet7, 2)
    
    ## Customized table
    xlsx.addHeader(wb, sheet7, value="Customized table", level=2)
    xlsx.addLineBreak(sheet7, 1)
    xlsx.addTable(wb, sheet7, data= head(iris),
                  fontColor="darkblue", fontSize=14,
                  rowFill=c("white", "lightblue")
                  )
    xlsx.addLineBreak(sheet7, 2)
    ## Add paragraph
    ##+++++++++++++++++++++++++++++
    xlsx.addHeader(wb, sheet7, "Add paragraph", level=2)
    xlsx.addLineBreak(sheet7, 2)
    paragraph="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
    xlsx.addParagraph(wb, sheet7, paragraph, fontSize=14, isItalic=TRUE, 
                      fontColor="darkred", backGroundColor="gray")
    xlsx.addLineBreak(sheet7, 2)
    ## Add Hyperlink
    ##+++++++++++++++++++++++++++++
    xlsx.addHeader(wb, sheet7, " Add Hyperlink", level=2)
    xlsx.addLineBreak(sheet7, 1)
    xlsx.addHyperlink(wb, sheet7, "http://www.sthda.com", "Click-me!!", fontSize=12)
    xlsx.addLineBreak(sheet7, 2)
    ## Add box plot
    ##+++++++++++++++++++++++++++++
    data(ToothGrowth)
    xlsx.addHeader(wb, sheet7, " Add Plot", level=2)
    xlsx.addLineBreak(sheet7, 1)
    plotFunction<-function(){boxplot(len ~ dose, data = ToothGrowth, col = 1:3)}
    xlsx.addPlot(wb, sheet7, plotFunction())
}
