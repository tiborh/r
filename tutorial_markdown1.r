if (!require(rmarkdown)) install.packages("rmarkdown")
library(rmarkdown)
fn <- "tutorial_markdown1.rmd"
## Pandoc version 1.12.3 or higher is needed in linux
rmarkdown::render(fn)
#detach("package:rmarkdown",unload=T)

#rmarkdown::render(fn, md_document())
rmarkdown::render(fn, github_document())
#rmarkdown::render(fn, pdf_document())
#rmarkdown::render(fn, word_document())
#rmarkdown::render(fn, odt_document())
rmarkdown::render(fn, beamer_presentation())
rmarkdown::render(fn, slidy_presentation())
