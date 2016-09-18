library(pander)
## best used in rmd files

a <- 12
pander(a)                               # emphasised

b <- 1:12
pander(b)                               # emphasised list, "and" before last

add.blank.lines(b)                      # before and after each element

pandoc.p(a)

pandoc.date(Sys.time())

pandoc.title("The Title")

l <- list(
    "First list element",
    paste0(1:5, '. subelement'),
    "Second element",
    list('F', 'B', 'I', c('phone', 'pad', 'talics'))
)
print(l)
pandoc.list(l, 'roman')
pandoc.list(l)
pander(l)

pander(mtcars)
pandoc.table(mtcars)
