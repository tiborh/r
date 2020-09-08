#!/usr/bin/env Rscript

source("common.r")

## source:
## https://igraph.org/r/doc/graph_from_literal.html

if (!require(igraph))
    stop("'igraph' is needed")

cat("Edges can be defined several ways.\n")
cat("make_graph needs an even numer of nodes two show where the edges are\n")
cat("In graph_literal, you have a-b-c-a, in make_graph, you have c(\"a\",\"b\",\"b\",\"c\",\"c\",\"a\")\n")
fn <- file.path(IMG.DIR,"graph_triangle2.png")
png(file=fn)
g <- make_graph(c("a","b","b","c","c","a"))
## for this one the grouping solution is not simpler:
## plot(graph_from_literal( A:B:C -- C:B:A ))
plot(g)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g)

cat("\nmake_graph also lends itself to random graph creation.\n")
fn <- file.path(IMG.DIR,"graph_make_random.png")
png(file=fn)
g <- make_graph(sample(1:10,sample(seq(16,26,2),1),replace=T))
plot(g)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g)

cat("\nmake_graph has another feature, known named graphs.\n")
fn <- file.path(IMG.DIR,"graph_make_dodecahedron.png")
png(file=fn)
g <- make_graph("Dodecahedron")
plot(g)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g)

cat("\nmake_graph complex example from man page.\n")
fn <- file.path(IMG.DIR,"graph_make_complex.png")
png(file=fn)
## ~ means that letters are accepted without quotes
g <- make_graph( ~ A-B-C-D-A, E-A:B:C:D, # ABCD is a square, E connects to all of them
           F-G-H-I-F, J-F:G:H:I,         # a second tier of the same pattern
           K-L-M-N-K, O-K:L:M:N,         # 3rd tier
           P-Q-R-S-P, T-P:Q:R:S,         # 4th
           B-F, E-J, C-I, L-T, O-T, M-S, # connect 3-3 elements of 2-2 tiers
           C-P, C-L, I-L, I-P)           # the two halves are connected through these four vertices

cat("\ngraph_from_edgelist works from a two-columned matrix.\n")
cat("this is one of the most convenient, as such matrices can easily be prepared with cbind or rbind.\n")
cat("and the latter lends itself to pairwise increments\n")
cat("\nmake_graph has another feature, known named graphs.\n")
fn <- file.path(IMG.DIR,"graph_from_edgelist_square.png")
png(file=fn)
g <- graph_from_edgelist(rbind(1:2,2:3,3:4,c(4,1)))
plot(g)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g)

cat("\nThe cbind variant is very good for random graphs.\n")
fn <- file.path(IMG.DIR,"graph_from_edgelist_random.png")
png(file=fn)
g <- graph_from_edgelist(cbind(sample(LETTERS[1:10],15,replace=T),sample(LETTERS[1:10],15,replace=T)))
plot(g)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g)

## for further exploration:
## https://igraph.org/r/doc/graph_from_data_frame.html
## https://igraph.org/r/doc/graph_from_adjacency_matrix.html
