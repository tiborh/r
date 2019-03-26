#!/usr/bin/env Rscript

## based on:
## http://sachaepskamp.com/files/NA2014/Week2Practical.pdf
## but look up this one too: http://psychosystems.org/qgraph_1.5
## and examples: http://sachaepskamp.com/qgraph/examples

if (!require(qgraph)) install.packages("qgraph",dep=TRUE)
require(qgraph)

min.qgraph.version <- "1.2.5"
if (packageDescription('qgraph')$Version < min.qgraph.version )
    stop(paste("Minimum qgraph version needed:",min.qgraph.version))

## defaults taken from presentation:
options(
    qgraph = list(
        border.width = 2,
        asize = 8,
        unCol = "black",
        vsize = 10,
        esize = 3)
)

pause = function() {
    prompt.text <- "Press <Enter> to continue"
    if (interactive())
    {
        invisible(readline(prompt = prompt.text))
    }
    else
    {
        cat(prompt.text)
        invisible(readLines(file("stdin"), 1))
    }
}

## input from matrix
triangle.uni <- matrix(c(
    0,1,1,
    0,0,1,
    0,0,0),3,3,byrow=TRUE)

print(triangle.uni)
qgraph(triangle.uni)

## exercise 1: circular graph
octahedron.uni <- matrix(c(
    0,1,0,0,0,0,0,0,
    0,0,1,0,0,0,0,0,
    0,0,0,1,0,0,0,0,
    0,0,0,0,1,0,0,0,
    0,0,0,0,0,1,0,0,
    0,0,0,0,0,0,1,0,
    0,0,0,0,0,0,0,1,
    1,0,0,0,0,0,0,0),8,8,byrow=T)
print(octahedron.uni)
qgraph(octahedron.uni)

## make it easier:
octahedron2.uni <- matrix(0,8,8)
octahedron2.uni[1,2] <- 1
octahedron2.uni[2,3] <- 1
octahedron2.uni[3,4] <- 1
octahedron2.uni[4,5] <- 1
octahedron2.uni[5,6] <- 1
octahedron2.uni[6,7] <- 1
octahedron2.uni[7,8] <- 1
octahedron2.uni[8,1] <- 1
print(octahedron2.uni)
qgraph(octahedron2.uni)

## change manually
octahedron3.uni <- matrix(0,8,8)
fix(octahedron3.uni)
qgraph(octahedron3.uni)

## make it reproducible
saved.octa3.uni <- dput(octahedron3.uni)
qgraph(saved.octa3.uni)

## read from gnumeric table
if (!require(gnumeric)) install.packages("gnumeric",dep=TRUE)
require(gnumeric)
decahedron.file <- file.path("data","dekahedron.gnumeric")
decahedron.uni <- read.gnumeric.sheet(decahedron.file)
qgraph(decahedron.uni)

## exercise 2: hub graph
hepta.spokes.uni <- matrix(0,8,8)
hepta.spokes.uni[2,1] <- 1
hepta.spokes.uni[3,1] <- 1
hepta.spokes.uni[4,1] <- 1
hepta.spokes.uni[5,1] <- 1
hepta.spokes.uni[6,1] <- 1
hepta.spokes.uni[7,1] <- 1
hepta.spokes.uni[8,1] <- 1
print(hepta.spokes.uni)
qgraph(hepta.spokes.uni)

## triangle undirectional
triangle.undirect <- matrix(1,3,3)
print(triangle.undirect)
qgraph(triangle.undirect)

## showing both directions:
qgraph(triangle.undirect,directed=T)

## direction per connection:
directions <- matrix(c(
    FALSE,TRUE,FALSE,
    TRUE,FALSE,FALSE,
    FALSE,FALSE,FALSE)
   ,3,3,byrow=TRUE)
print(directions)
qgraph(triangle.undirect,directed=directions)

## bidirectional edges
qgraph(triangle.undirect,directed=T,bidirectional=T)

## bidirectional fine-tune with matrix
bidir <- matrix(c(
    FALSE,TRUE,FALSE,
    TRUE,FALSE,FALSE,
    FALSE,FALSE,FALSE)
   ,3,3,byrow=TRUE)
print(bidir)
qgraph(triangle.undirect,directed=T,bidirectional=bidir)

## further args:
## curve (default is 1, 0 is no curve
## lty line types
## 0 is blank, 1 is solid, ... 6 is twodash
qgraph(triangle.undirect,directed=T,curve=4,lty=2)

## some further config:
triangle.mix<-matrix(c(
    0,1,1,
    1,0,1,
    0,0,0),3,3,byrow=TRUE)

print(triangle.mix)
qgraph(triangle.mix,
       asize=10,                        # arrow head size
       arrows=2,                        # how many arrows
                                        #   can also be logical
                                        #   (arrows or no arrows)
       open=TRUE,                       # open or closed arrow-heads?
       curvePivot=TRUE)                 # straight lines with curved ends
                                        #   (in bigraphs only)

## weighted edges
triangle.weighted<-matrix(c(
    0,1,2,
    0,0,3,
    0,0,0),3,3,byrow=TRUE)
print(triangle.weighted)
qgraph(triangle.weighted)

## when too many weights, the least weighted may become too faint
nonahedron.weighted <- matrix(0,9,9)
nonahedron.weighted[1,2] <- 1
nonahedron.weighted[2,3] <- 2
nonahedron.weighted[3,4] <- 3
nonahedron.weighted[4,5] <- 4
nonahedron.weighted[5,6] <- 5
nonahedron.weighted[6,7] <- 6
nonahedron.weighted[7,8] <- 7
nonahedron.weighted[8,9] <- 8
nonahedron.weighted[9,1] <- 9
print(nonahedron.weighted)
qgraph(nonahedron.weighted)

## layout
## e.g. layout="circular" in circle per group
## e.g. layout="spring" Fruchterman Reingold algorithm for placement
## grid is also possible

## layout matrix:
## using earlier triangle.undirect
L1 <- matrix(c(
    0,1,                                # node 1 in (0,1)
    1,1,                                # node 2 in (1,1)
    0.5,0),ncol=2,byrow=T)              # node 3 in (0.5,0)
print(L1)
print(triangle.undirect)
qgraph(triangle.undirect,layout=L1)

L2 <- matrix(c(
    0,1,                                # row for node 1, coord: 0,1
    1,1,                                # row for node 2, coord: 1,1
    0,0),ncol=2,byrow=T)                # row for node 3, coord: 0,0
print(L2)
qgraph(triangle.undirect,layout=L2)

## grid layout: the numbers represent the placement of the respective nodes
## grid example 1
L3 <- matrix(c(
    1,0,2,
    0,0,0,
    0,3,0),
    nrow=3,byrow=TRUE)
print(L3)
qgraph(triangle.undirect,layout=L3)

## grid example 2
L4 <- matrix(c(
    1,0,2,
    0,0,0,
    3,0,0),nrow=3,byrow=TRUE)
print(L4)
qgraph(triangle.undirect,layout=L4)

## Fruchterman-Reingold layout
## (full content from the slide:
## * layout="spring" uses a force-embedded algorithm
##   (the Fruchterman-Reingold algorithm)
## * This is an iterative algorithm.
## * The initial layout is a circle
## * Then in each iteration:
##   * Each node is repulsed by all other nodes
##   * Connected nodes are also attracted to each other
##   * The maximum displacement weakens each iteration
## * After this process the layout is rescaled to fit the −1 to 1
##   xy-plane
## * The unscaled layout is returned as layout.orig

data(big5)                              # example dataset to work on
str(big5)                               # 500 by 240
cor.big5 <- cor(big5)                   # correlated
str(cor.big5)                           # 240 by 240
qgraph(cor.big5,minimum=0.25)           # if min is not defined, drawing is much slower
## qgraph(big5)                            #  Input is not a weights matrix or an edgelist.

## groups
groups.list <- list(A = c(1,2,3,4,5),
                    B = c(6,7,8,9,10))
qgraph(matrix(1,10,10),groups=groups.list)

groups.vector <- c("A","A","A","A","A",
                   "B","B","B","B","B")
qgraph(matrix(1,10,10),groups=groups.vector)

data(big5groups)
str(big5groups)                         # 5 groups
big5graph <- qgraph(cor.big5,minimum=0.25,groups=big5groups)
qgraph(big5graph,layout="spring")

## pdf export
big5graph.pdf.out <- file.path("out","big5graph.pdf")
pdf(big5graph.pdf.out)
qgraph(big5graph)
dev.off()

## png export --> pdf is better
big5graph.png.out <- file.path("out","big5graph.png")
png(big5graph.png.out)
qgraph(big5graph,layout="spring")
dev.off()
## better:
qgraph(big5graph,layout="spring",filetype="png",filename=file.path("out","big5graph_spring"))

## proof:
big5graph.spring.pdf.out <- file.path("out","big5graph_spirng.pdf")
pdf(big5graph.spring.pdf.out)
qgraph(big5graph,layout="spring")
dev.off()

## Important arguments
## minimum Omits edge weights with absolute values under
##         this argument
## maximum Sets the strongest edge to scale to
## cut Splits scaling of color and width
## vsize Sets the size of nodes
## esize Sets the size of edges
## asize Sets the size of arrows
## filetype Type of file to save the plot to
## filename Name of the file to save the plot to
