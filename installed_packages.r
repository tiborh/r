#!/usr/bin/env Rscript

source("common.r")

ip = installed.packages()

cat("Data structure:\n")
print(str(ip))

cat("\nColumn names:\n")
print(colnames(ip))

cat("\nRow names:\n")
print(rownames(ip))

rownames(ip) = NULL
cat("\nNames and versions:\n")
print(ip[order(ip[,"Package"]),c("Package","Version"],row.names=F)
