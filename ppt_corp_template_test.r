library( ReporteRs )

## doc <- pptx(template="path/to/your/powerpoint/template/file.pptx")

fn.template <- file.path("~","Templates","ppt2010","doc_template0.pptx")
fn.template <- file.path("~","Templates","ppt2010","pres_template0.pptx")

source("ppt_layouts_src.r")
doc <- pptx(template=fn.template)

the.layouts <- show.layouts(doc)
print(the.layouts)

## with LibreOffice-converted doc_template.pptx
##  [1] "Title, 4 Content"              "Title, Content"               
##  [3] "Title Content and 2 Content"   "Title, 2 Content over Content"
##  [5] "Title, 6 Content"              "Title Slide"                  
##  [7] "Centered Text"                 "Title Only"                   
##  [9] "Title, Content over Content"   "Title, 2 Content and Content" 
## [11] "Title, 2 Content"             

## with Powerpoint-converted doc_template0.pptx
##  [1] "Title, Content, and 2 Content"          
##  [2] "Header, two horizontal contents"        
##  [3] "Title and 4 Content"                    
##  [4] "Small title, right Image"               
##  [5] "Title and 3 columns"                    
##  [6] "Two Content"                            
##  [7] "Header, Content over two content parts" 
##  [8] "Title"                                  
##  [9] "Comparison"                             
## [10] "Title, 2 Content and Content"           
## [11] "Low small title, left Image"            
## [12] "Header, two content parts over content."
## [13] "Full title, left Image"                 
## [14] "Full title, right Image"                
## [15] "Title and Content"                      
## [16] "Content with Caption"                   
## [17] "Small title, left Image"                
## [18] "Title Only"

## with Powerpoint-converted pres_template0.pptx
##  [1] "Title and 2 columns"                    
##  [2] "Header, two horizontal contents"        
##  [3] "Title, Content, and 2 Content"          
##  [4] "Title and 4 Content"                    
##  [5] "Small title, right Image"               
##  [6] "Title and 3 columns"                    
##  [7] "Header, Content over two content parts" 
##  [8] "Title, 2 Content and Content"           
##  [9] "Low small title, left Image"            
## [10] "Header, two content parts over content."
## [11] "Full title, left Image"                 
## [12] "Full title, right Image"                
## [13] "Title Page"                             
## [14] "Title and 1 column"                     
## [15] "Small title, left Image"                
## [16] "Title Only"                             
