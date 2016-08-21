library( ReporteRs )

ppt.maker <- function() {
    nu.of.slides <- 11
    page.num = 1
                                        # Create a PowerPoint document
    doc = pptx( )
                                        # Slide 1 : Title slide
                                        #+++++++++++++++++++++++
    doc <- addSlide(doc, "Title Slide")
    doc <- addTitle(doc,"Create a PowerPoint document from R software")
    doc <- addSubtitle(doc, "R and ReporteRs package")
    doc <- addDate(doc)
    doc <- addFooter(doc, "Isaac Newton")
    doc <- addPageNumber(doc, paste0(page.num,"/",nu.of.slides))
    page.num = page.num + 1
                                        # Slide 2 : Add plot
                                        #+++++++++++++++++++++++
    doc <- addSlide(doc, "Title and Content")
    doc <- addTitle(doc, "Bar plot")
    plotFunc<- function(){
        barplot(VADeaths, beside = TRUE,
                col = c("lightblue", "mistyrose", "lightcyan",
                        "lavender", "cornsilk"),
                legend = rownames(VADeaths), ylim = c(0, 100))
        title(main = "Death Rates in Virginia", font.main = 4)
    }
    doc <- addPlot(doc, plotFunc )
    doc <- addPageNumber(doc, paste0(page.num,"/",nu.of.slides))
    page.num = page.num + 1

                                        # Slide 3 : Add table 
                                        #+++++++++++++++++++++++
    doc <- addSlide(doc, "Two Content")
    doc <- addTitle(doc,"iris data sets")
    doc <- addFlexTable(doc, FlexTable(iris[1:10,] ))
    doc <- addParagraph(doc, "iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.")
    doc <- addPageNumber(doc, paste0(page.num,"/",nu.of.slides))
    page.num = page.num + 1

                                        # Silde 4 : Add R script
                                        #+++++++++++++++++++++
    doc <- addSlide(doc, "Content with Caption")
    doc <- addTitle(doc, "R Script for histogram plot")
    doc <- addPlot(doc, function() hist(iris$Sepal.Width, col=4))
    r_code ="data(iris); hist(iris$Sepal.Width, col = 4)"
    doc <- addRScript(doc, text=r_code)
    doc <- addPageNumber(doc, paste0(page.num,"/",nu.of.slides))
    page.num = page.num + 1


                                        # Silde 5 : Add Text formatting
                                        #+++++++++++++++++++++
    options('ReporteRs-fontsize'= 18,
            'ReporteRs-default-font'='Arial')
    doc <- addSlide(doc, "Two Content")
    doc <- addTitle(doc,"Document with formatted texts")
    doc <- addFlexTable(doc, FlexTable(iris[1:10,] ))
    ## pot() [Pieces Of Text]
    ## pot(value="", format = textProperties())
    ## textBold(), textItalic(), textBoldItalic() and textNormal()
    ## color :           font color; e.g : color=“#000000” or color = “black”.
    ## font.size :       a integer indicating the font size.
    ## font.weight :     the font weight. Possible values are “normal” or “bold”.
    ## font.style :      the font style. Possible values are “normal” or “italic”.
    ## underlined :      a logical value specifying if the text should be underlined.
    ## font.family :     the font family; e.g : “Arial”.
    ## vertical.align :  a character indicating font vertical alignments.
    ##                   Expected values are “baseline”" or “subscript” or “superscript”.
    ##                   Default value is baseline.
    ## shading.color :   background color of the text (e.g “#000000” or “black”)

    my_text <- pot("iris data set", textBold(color = "blue"))+
          " contains the measurements of " + 
          pot("sepal length", textBold(color="red"))+ 
        " and width and petal length and width"
  
    my_link <- pot('Click here to visit STHDA web site!', 
    hyperlink = 'http://www.sthda.com/english',
    format=textBoldItalic(color = 'blue', underline = TRUE ))
    doc <- addParagraph(doc, 
                        value = set_of_paragraphs(my_text, " ",  my_link),
                        par.properties=parProperties(text.align="justify")
                        )


    doc <- addPageNumber(doc, paste0(page.num,"/",nu.of.slides))
    page.num = page.num + 1

                                        # Slide 6 : Add plot

    ## addPlot(doc, fun, ...)
    doc <- addSlide(doc, "Two Content")
    doc <- addTitle(doc,"Histogram plot")
    doc <- addPlot(doc, function() hist(iris$Sepal.Width, col="lightblue"))
    doc <- addParagraph(doc, "This histogram is generated using iris data sets")
    doc <- addPageNumber(doc, paste0(page.num,"/",nu.of.slides))
    page.num = page.num + 1

    
                                        # Slide 7 : Add  an image

    ## addImage(doc, filename)
    ## download an image from R website
    fn <- file.path("img","r-logo.png")
    download.file(url="https://www.r-project.org/logo/Rlogo.png",
                  destfile=fn, quiet=TRUE)
    doc <- addSlide(doc, "Two Content")
    doc <- addTitle(doc,"Image from R website")
    doc <- addImage(doc, fn)
    doc <- addParagraph(doc, "This image has been downloaded from R website")
    doc <- addPageNumber(doc, paste0(page.num,"/",nu.of.slides))
    page.num = page.num + 1

                                        # Tables
    ## doc <- addFlexTable(doc, flextable = FlexTable(data))
    ## doc <- addFlexTable(doc, flextable = vanilla.table(data))

    table.data<-iris[1:5, ]
                                        # Slide 8 : Simple table
    doc <- addSlide(doc, "Title and Content")
    doc <- addTitle(doc,"Simple table")
    doc <- addFlexTable(doc, FlexTable(table.data))
    doc <- addPageNumber(doc, paste0(page.num,"/",nu.of.slides))
    page.num = page.num + 1

                                        # Slide 9 : vanilla table
    doc <- addSlide(doc, "Title and Content")
    doc <- addTitle(doc,"Vanilla table")
    doc <- addFlexTable(doc, vanilla.table(table.data))
    doc <- addPageNumber(doc, paste0(page.num,"/",nu.of.slides))
    page.num = page.num + 1

                                        # Slide 10 : Zebra striped table
    doc <- addSlide(doc, "Title and Content")
    doc <- addTitle(doc,"Zebra striped table")
    MyFTable <- vanilla.table(table.data)
    MyFTable <- setZebraStyle(MyFTable, odd = '#eeeeee', even = 'white')
    doc <- addFlexTable( doc, MyFTable)
    doc <- addPageNumber(doc, paste0(page.num,"/",nu.of.slides))
    page.num = page.num + 1

                                        # Slide 11: Lists
    ## doc  <- addParagraph(doc, 
    ##                      value = c('Item 1', "Item 2", "Item 3")
    ##                      par.properties = parProperties(list.style = 'ordered', level = 1 )

    doc <- addSlide(doc, "Two Content")
    doc <- addTitle(doc, "Ordered and unordored lists")
                                        # 1. Ordered list
    doc <- addParagraph(doc, value= c("Item 1", "Item 2", "Item 3"),
                        par.properties =  parProperties(list.style = 'ordered'))
                                        # 2. Unordered list
    doc <- addParagraph(doc, value= c("Item 1", "Item 2", "Item 3"),
                        par.properties =  parProperties(list.style = 'unordered'))
    doc <- addPageNumber(doc, paste0(page.num,"/",nu.of.slides))
    page.num = page.num + 1
    
    ## write the document 
    writeDoc(doc, file.path("data","r-reporters-powerpoint.pptx"))
}

ppt.maker()
