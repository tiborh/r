#!/usr/bin/env Rscript

source("common.r")

## source:
## https://www.tutorialspoint.com/r/r_random_forest.htm

stop.if.not.installed(c("party","randomForest"))

print(str(readingSkills))

cat("\n1. Creating a forest:\n")
output.forest <- randomForest(nativeSpeaker ~ age + shoeSize + score, 
                              data = readingSkills)

cat("\n2. Printing the result:\n")
print(output.forest)

cat("\n3. Printing the importance of each predictor:\n")
print(importance(output.forest,type = 2))

fn <- file.path(IMG.DIR,"randomForest_plot.png")
png(file=fn)
plot(output.forest)
dev.off()
cat("Random Forest output has been written to:",fn,"\n")
