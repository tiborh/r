#!/usr/bin/env Rscript

print("initial options")
initial.options <- commandArgs(trailingOnly = FALSE)
print(initial.options)
print("file.option")
file.option <- initial.options[4]
print(file.option)
print("split.file.option")
split.file.option <- strsplit(file.option,"=")[[1]]
print(file.path(split.file.option))
print(paste("length of split.file.option",length(split.file.option)))
print(paste("filename: ",basename(file.path(split.file.option[2]))))

print("all in one:")
script.name <- basename(strsplit(commandArgs(trailingOnly = FALSE)[4],"=")[[1]][2])
print(script.name)
