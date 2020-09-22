#!/usr/bin/env Rscript

## source("common.r")

if (!require(igraph))
    stop("'igraph' is needed")

cat("random graph to data_frame:\n")
g <- make_graph(sample(1:10,sample(seq(16,26,2),1),replace=T))
print(g)
print(as_data_frame(g))

cat("\ngrouped graph to data frame:\n")
print(graph_from_literal(A:B:C -- D:E:F))
## print(as_data_frame(graph_from_literal(A:B:C -- D:E:F)))
cat("printing both:\n")
as_data_frame(graph_from_literal(A:B:C -- D:E:F),what="both")

## man page example (https://igraph.org/r/doc/graph_from_data_frame.html)
actors <- data.frame(name=c("Alice", "Bob", "Cecil", "David",
                            "Esmeralda"),
                     age=c(48,33,45,34,21),
                     gender=c("F","M","F","M","F"))
relations <- data.frame(from=c("Bob", "Cecil", "Cecil", "David",
                               "David", "Esmeralda"),
                        to=c("Alice", "Bob", "Alice", "Alice", "Bob", "Alice"),
                        same.dept=c(FALSE,FALSE,TRUE,FALSE,FALSE,TRUE),
                        friendship=c(4,5,5,2,1,1), advice=c(4,5,5,4,2,3))
g <- graph_from_data_frame(relations, directed=TRUE, vertices=actors)
cat("\nactors:\n")
print(actors)
cat("\nrelations:\n")
print(relations)
cat("\nthe graph:\n")
print(g, e=TRUE, v=TRUE)
cat("\nas data frame:\n")
print(as_data_frame(g))
