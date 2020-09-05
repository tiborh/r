#!/usr/bin/env Rscript

source("common.r")

## source:
## https://igraph.org/r/doc/as.directed.html

if (!require(igraph))
    stop("'igraph' is needed")

cat("One of the easiest is make_ring() (but more for demo purposes only):\n")

fn <- file.path(IMG.DIR,"ring_graph_undirected.png")
png(file=fn)
g <- make_ring(10)
plot(g)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g)

fn <- file.path(IMG.DIR,"ring_graph_mutually_directed.png")
png(file=fn)
g1 <-as.directed(g, "mutual") 
plot(g1)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g1)

fn <- file.path(IMG.DIR,"ring_graph_arbitrary_directed.png")
png(file=fn)
g1b  <- as.directed(g, "arbitrary")
plot(g1b)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g1b)

cat("\nStart graphs are equally simple.\n")
fn <- file.path(IMG.DIR,"star_graph.png")
png(file=fn)
g2 <- make_star(10)
plot(g2)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g2)

fn <- file.path(IMG.DIR,"star_graph_undirected.png")
png(file=fn)
g2b <- as.undirected(g2)
plot(g2b)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g2b)

## Combining edge attributes
cat("Combining similar graphs:\n")
g3 <- make_ring(10, directed=TRUE, mutual=TRUE)
print(g3)
E(g3)$weight <- seq_len(ecount(g3))
ug3 <- as.undirected(g3)
print(ug3, e=TRUE)
## Not run: 
##  x11(width=10, height=5)
fn <- file.path(IMG.DIR,"combined_ring_graphs_with_weights.png")
png(file=fn,width=10, height=5, units="in", res=150)
  layout(rbind(1:2))
  plot( g3, layout=layout_in_circle, edge.label=E(g3)$weight)
plot(ug3, layout=layout_in_circle, edge.label=E(ug3)$weight)
dev.off()
cat("graph has been written to:",fn,"\n")

## End(Not run)

cat("graph is also simple: edges are defined in pairs.\n")
fn <- file.path(IMG.DIR,"graph_random.png")
png(file=fn)
g4 <- graph(sample(1:10,22,replace=T))
dev.off()
cat("graph has been written to:",fn,"\n")
print(g4)

fn <- file.path(IMG.DIR,"graph_random_weight.png")
png(file=fn)
E(g4)$weight <- sample(1:10,ecount(g4),replace=T) # E(g4) == edges of g4
print(g4)
ug4 <- as.undirected(g4, mode="mutual",
                     edge.attr.comb=list(weight=length))
plot(ug4)
dev.off()
cat("graph has been written to:",fn,"\n")
print(ug4, e=TRUE)

fn <- file.path(IMG.DIR,"graph_random_with_letters.png")
png(file=fn)
g5 <- graph(sample(LETTERS[1:10],22,replace=T))
plot(g5)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g5)
