if (!require(rmarkdown)) {
    install.packages("rmarkdown")
    library(rmarkdown)
}
fns <- c("loops.rmd","plots.rmd")
## Pandoc version 1.12.3 or higher is needed in linux
for (fn in fns)
    rmarkdown::render(fn,c("github_document","html_document"))
