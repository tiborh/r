#!/usr/bin/env Rscript

## source("common.r")

## source:
## https://igraph.org/r/doc/graph_from_adjacency_matrix.html

if (!require(igraph))
    stop("'igraph' is needed")

adjm <- matrix(sample(0:1, 100, replace=TRUE, prob=c(0.85,0.15)), nc=10)
g1 <- graph_from_adjacency_matrix( adjm )
cat("\nthe matrix:\n")
print(adjm)
cat("\nthe graph:\n")
print(g1)

g2 <- graph_from_adjacency_matrix(adjm, weighted=TRUE)
cat("\nweighted graph:\n")
print(g2)
## random weight
E(g2)$weight <- sample(1:length(E(g2)$weight),length(E(g2)$weight))
cat("\nwith weights:\n")
print(as_data_frame(g2))

