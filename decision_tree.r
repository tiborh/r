#!/usr/bin/env Rscript

source("common.r")

## source:
## https://www.tutorialspoint.com/r/r_decision_tree.htm

stop.if.not.installed("party")

print(str(readingSkills))

## training the model:
input.dat <- readingSkills[c(1:105),]
## input.dat <- readingSkills
fn <- file.path(IMG.DIR,"decision_tree.png")
png(file = fn)
output.tree <- ctree(
    nativeSpeaker ~ age + shoeSize + score, 
    data = input.dat
)
plot(output.tree,main="Is the person a native speaker?")
dev.off()
cat("Decision tree has been written to:",fn,"\n")

