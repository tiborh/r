if (!require(ReportRs)) install.packages('ReporteRs')
library(ReporteRs)

source("ppt_layouts_src.r")

doc = pptx()
the.layouts <- show.layouts(doc)
print(the.layouts)

## [1] "Blank"                   "Title Only"             
## [3] "Title and Content"       "Section Header"         
## [5] "Title and Vertical Text" "Comparison"             
## [7] "Content with Caption"    "Title Slide"            
## [9] "Two Content"             "Vertical Title and Text"
