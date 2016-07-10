if (!require(rmarkdown)) install.packages("rmarkdown")
library(rmarkdown)
fn <- "tutorials.rmd"
## Pandoc version 1.12.3 or higher is needed in linux
rmarkdown::render(fn,c("github_document","html_document"))
