#!/usr/bin/env Rscript

a = list("alpha" = 1, "beta"= 2, "gamma" = 3, "delta" = 4)

for (i in a) {
    cat("i == ",i,"\n")
    cat("\t names(a)[i] == ",names(a)[i],"\n")
    cat(paste0("\t a$",names(a)[i]," == ",a[[i]],"\n"))
}
