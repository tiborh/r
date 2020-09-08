#!/usr/bin/env Rscript

source("common.r")

## source:
## https://igraph.org/r/doc/graph_from_literal.html

if (!require(igraph))
    stop("'igraph' is needed")

cat("Another easy way to start is literal:\n")
fn <- file.path(IMG.DIR,"graph_triangle.png")
png(file=fn)
g <- graph_from_literal(a-b-c-a)
## for this one the grouping solution is not simpler:
## plot(graph_from_literal( A:B:C -- C:B:A ))
plot(g)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g)

cat("\nDirection can be provided with plus symbols (e.g. -+):\n")
fn <- file.path(IMG.DIR,"graph_pentagon_directed.png")
png(file=fn)
g <- graph_from_literal(a-+b-+c-+d-+e-+a-+c-+e-+b-+d-+a)
plot(g)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g)

cat("\nIf all is undirectional or bidirectional, one can use grouping:\n")
fn <- file.path(IMG.DIR,"graph_pentagon_undirected.png")
png(file=fn)
g <- graph_from_literal( A:B:C:D:E -- A:B:C:D:E )
## graph_from_literal( A:B:C:D:E --+ A:B:C:D:E )
plot(g)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g)

cat("\nBidirectional line:\n")
fn <- file.path(IMG.DIR,"graph_bidirectional_line.png")
png(file=fn)
g <- graph_from_literal( A +-+ B +---+ C ++ D + E)
plot(g)
dev.off()
cat("graph has been written to:",fn,"\n")
print(g)

cat("\nWith texts, sometimes the shape is best to omit.\n")
fn <- file.path(IMG.DIR,"graph_no_shape.png")
png(file=fn)
g <- graph_from_literal("Alpha" -- "Beta" -- "Gamma" -- "Alpha")
plot(g, vertex.shape="none")
dev.off()
cat("graph has been written to:",fn,"\n")
print(g)
