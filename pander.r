library(pander)
## best used in rmd files

a <- 12
pander(a)                               # emphasised (italics)
pandoc.strong(a)                        # **12**

b <- 1:12
pander(b)                               # emphasised (italics) list, "and" before last
pandoc.strong(b)                        # **1** **2** **3** **4** **5** **6** **7** ...
pandoc.emphasis("emphasised")           # *emphasised*

pandoc.strikeout("Striked out")         # ~~Striked out~~
pandoc.verbatim("Verbatim txt")         # `Verbatim txt`

pandoc.link("http://www.google.co.uk","Google UK") # url and text
?pandoc.link

my.img <- file.path("tmp","cars.png")
png(filename=my.img)
plot(cars$speed,cars$dist,main="Speed and Distance")
dev.off()
if (file.exists(my.img))
    pandoc.image(my.img,"Speed and Distance") # ![Speed and Distance](tmp/cars.png)
?pandoc.image

add.blank.lines(b)                      # before and after each element

pandoc.p(a)                             # vertical space before and after

pandoc.date(Sys.time())                 # date formatting
pander(Sys.time())                      # same
add.blank.lines(Sys.time())             # [1] "\n2016-10-11 19:03:23\n"
pandoc.p(Sys.time())

pandoc.title("The Title")
pandoc.indent("Something")

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
