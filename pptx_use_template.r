library( ReporteRs )

## doc <- pptx(template="path/to/your/powerpoint/template/file.pptx")

fn.template <- file.path("data","r-reporters-powerpoint-template.pptx")

if (!file.exists(fn.template)) {
## Download a PowerPoint template file from STHDA website
    download.file(url="http://www.sthda.com/sthda/RDoc/example-files/r-reporters-powerpoint-template.pptx",
                  destfile=fn.template, quiet=TRUE)

}

source("ppt_layouts_src.r")

doc <- pptx(template=fn.template)

the.layouts <- show.layouts(doc)
print(the.layouts)

##  [1] "Blank"                     "Title Only"               
##  [3] "Title Slide"               "Content with Caption"     
##  [5] "Two Content"               "2 Content, Top and Bottom"
##  [7] "Closing"                   "Picture with Caption"     
##  [9] "Title and Content"         "Title and Vertical Text"  
## [11] "Section Header"            "Comparison"               
## [13] "4 Content"                 "3 Pictures with Caption"  
## [15] "Vertical Title and Text"   "3 Content"                
