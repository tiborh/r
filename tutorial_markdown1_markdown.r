if (!require(rmarkdown)) install.packages("rmarkdown")
library(rmarkdown)
## Pandoc version 1.12.3 or higher is needed in linux
rmarkdown::render("tutorial_markdown1.rmd")
#detach("package:rmarkdown",unload=T)

rmarkdown::render("tutorial_markdown1.rmd", md_document())
rmarkdown::render("tutorial_markdown1.rmd", github_document())
rmarkdown::render("tutorial_markdown1.rmd", pdf_document())
rmarkdown::render("tutorial_markdown1.rmd", word_document())
rmarkdown::render("tutorial_markdown1.rmd", odt_document())
rmarkdown::render("tutorial_markdown1.rmd", beamer_presentation())
rmarkdown::render("tutorial_markdown1.rmd", slidy_presentation())
