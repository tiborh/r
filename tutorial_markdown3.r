if (!require(rmarkdown)) install.packages("rmarkdown")
library(rmarkdown)
fn <- "tutorial_markdown4.rmd"
## Pandoc version 1.12.3 or higher is needed in linux
rmarkdown::render(fn)
