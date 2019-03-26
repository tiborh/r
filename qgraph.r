#!/usr/bin/env Rscript

## based on:
## http://sachaepskamp.com/files/NA2014/Week2Practical.pdf
## but look up this one too: http://psychosystems.org/qgraph_1.5

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

