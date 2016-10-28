library(pander)
## best used in rmd files

a <- 12
pander(a)                               # emphasised (italics)
pandoc.strong(a)                        # **12**
pandoc.p(a)

b <- 1:12
pander(b)                               # emphasised (italics) list, "and" before last
pandoc.strong(b)                        # **1** **2** **3** **4** **5** **6** **7** ...
pandoc.emphasis("emphasised")           # *emphasised*
add.blank.lines(b)                      # before and after each element

pandoc.strikeout("Striked out")         # ~~Striked out~~
pandoc.verbatim("Verbatim txt")         # `Verbatim txt`

pandoc.link("http://www.google.co.uk","Google UK") # url and text
?pandoc.link

dn <- "tmp"
fn <- "cars.png"
if (!dir.exists(dn))
    dir.create(dn)
my.img <- file.path(dn,fn)
png(filename=my.img)
plot(cars$speed,cars$dist,main="Speed and Distance")
dev.off()
if (file.exists(my.img))
    pandoc.image(my.img,"Speed and Distance") # ![Speed and Distance](tmp/cars.png)
?pandoc.image

pandoc.date(Sys.time())                 # date formatting
pander(Sys.time())                      # same
add.blank.lines(Sys.time())             # [1] "\n2016-10-11 19:03:23\n"
pandoc.p(Sys.time())

pandoc.title("The Title")
max <- 10
for(i in 0:max)
    print(pandoc.indent("Something",level=i))
for(i in max:0)
    print(pandoc.indent("Something",level=i))


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
pandoc.table(mtcars,split.tables=Inf,caption="mtcars")
mt <- mtcars[1:3,1:5]
pander(mt)
pandoc.table(mt,style="simple")         # despaced
pandoc.table(mt,style="multiline")      # same as pander, default
pandoc.table(mt,style="grid")           # ascii art
pandoc.table(mt,style="rmarkdown",caption="mtcars")
## set.caption("Hello, world") is also possible

## Highlighting cells
##   * emphasize.italics.rows
##   * emphasize.italics.cols
##   * emphasize.italics.cells
##   * emphasize.strong.rows
##   * emphasize.strong.cols
##   * emphasize.strong.cells
##   * emphasize.verbatim.rows
##   * emphasize.verbatim.cols
##   * emphasize.verbatim.cells

## if (!require(rlist))
##     install.packages("rlist")
## library(rlist)
total.mt <- sapply(mt,sum)          # vector
mt.names <- names(total.mt)
length(total.mt)
total.mt2 <- as.data.frame(matrix(total.mt,ncol=length(total.mt)))
names(total.mt2) <- mt.names
rownames(total.mt2) = c("Total")
total.mt2
mt2 <- rbind(mt,total.mt2)
which(mt2$mpg>50,arr.ind=T)
which(mt2$cyl==4,arr.ind=T)
which(mt2$cyl==4)
##emphasize.italics.rows(which(mt2$mpg>50,arr.ind=T))  # effective for next
##pandoc.table(mt2,emphasize.cells=which(mt2$cyl>4,arr.ind=T)) # 
pandoc.table(mt2,emphasize.rows=4)
pandoc.table(mt2,emphasize.strong.cols=ncol(mt2))
