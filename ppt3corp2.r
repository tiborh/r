library( ReporteRs )

make.slides <- function(doc) {
                                        # Slide 1 : Title slide
                                        #+++++++++++++++++++++++
    doc <- addSlide(doc, "Title Page")
    doc <- addTitle(doc,"Create a PowerPoint from template using R software")
    doc <- addSubtitle(doc, "R and ReporteRs package")
    # doc <- addDate(doc)
    # doc <- addFooter(doc, "Isaac Newton")
    # doc <- addPageNumber(doc, "1/4")
                                        # Slide 2 : Add plot
                                        #+++++++++++++++++++++++
    doc <- addSlide(doc, "Title and 1 column")
    doc <- addTitle(doc, "Bar plot")
    plotFunc<- function(){
        barplot(VADeaths, beside = TRUE,
                col = c("lightblue", "mistyrose", "lightcyan",
                        "lavender", "cornsilk"),
                legend = rownames(VADeaths), ylim = c(0, 100))
        title(main = "Death Rates in Virginia", font.main = 4)
    }
    doc <- addPlot(doc, plotFunc )
    # doc <- addPageNumber(doc, "2/4")
                                        # Slide 3 : Add table 
                                        #+++++++++++++++++++++++
    doc <- addSlide(doc, "Title and 2 columns")
    doc <- addTitle(doc,"iris data sets")
    doc <- addFlexTable(doc, FlexTable(iris[1:4,] ))
    doc <- addParagraph(doc, "iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.")
    # doc <- addPageNumber(doc, "3/4")
                                        # Silde 4 : Add R script
                                        #+++++++++++++++++++++
    doc <- addSlide(doc, "Title and 2 columns")
    doc <- addTitle(doc, "R Script for histogram plot")
    doc <- addPlot(doc, function() hist(iris$Sepal.Width, col=4))
    r_code ="data(iris); hist(iris$Sepal.Width, col = 4)"
    doc <- addRScript(doc, text=r_code)
    # doc <- addPageNumber(doc, "4/4")
                                        # write the document 
}

fn.template <- file.path("~","Templates","ppt2010","pres_template0.pptx")

doc <- pptx(template=fn.template )
make.slides(doc)

writeDoc(doc, file.path("data","ecorp_pres_test.pptx"))
