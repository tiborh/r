#!/usr/bin/env Rscript

cat("to check all available datasets: data()\n")
print(head(data()$results))
cat("...\n")
print(tail(data()$results))

cat("to check datasets in a package: data(package=\"package_name\")\n")
cat("example is MASS:\n")
print(head(data(package="MASS")$results))
cat("...\n")
print(tail(data(package="MASS")$results))
