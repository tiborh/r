#!/usr/bin/env Rscript

## source:
## https://www.tutorialspoint.com/r/r_packages.htm

cat("Locations of packages:\n")
print(.libPaths())

cat("List the installed packages:\n")
print(library())

cat("List packages currently loaded:\n")
print(search())

## installing a package from repo:
## install.packages(file_name_with_path, repos = NULL, type = "source")

## installing a package from local file:
## install.packages(file_name_with_path, repos = NULL, type = "source")

## load a package:
## library("package Name", lib.loc = "path to library")

