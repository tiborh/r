if (!require(rmarkdown)) install.packages("rmarkdown")
library(rmarkdown)
fn <- "tutorial_markdown3.rmd"
## Pandoc version 1.12.3 or higher is needed in linux
rmarkdown::render(fn, github_document())
rmarkdown::render(fn)
##rmarkdown::render(fn, md_document())
##rmarkdown::render(fn, pdf_document())
##rmarkdown::render(fn, word_document())
##rmarkdown::render(fn, odt_document())
##rmarkdown::render(fn, beamer_presentation())
rmarkdown::render(fn, slidy_presentation())

detach("package:rmarkdown",unload=T)
