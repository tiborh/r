#!/usr/bin/env Rscript

.a = "alpha"
.b = "beta"
c = "gamma"

cat(".name variables are not shown with ls()\n")
cat(ls())
cat("\n")
cat("all.name = T shows those ones too:\n")
cat(ls(all.name=T))
cat("\n")
