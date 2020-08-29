#!/usr/bin/env Rscript

source("common.r")

stop.if.not.installed("MASS")

## based on:
## https://www.tutorialspoint.com/r/r_chi_square_tests.htm

cat("chisq.test is for dependence between two categorical variables.\n")

print(str(Cars93))

cat("it works on a table\n")
car.data = table(Cars93$AirBags, Cars93$Type) 
print(car.data)

fn <- file.path(IMG.DIR,"bags_vs_size_plot.png")
png(file=fn)
plot(car.data,col=rainbow(length(dimnames(car.data)[[2]])),
     main="Air Bags vs Car Size (in Car93)",
     xlab="Air bag position",
     ylab="Car size")
legend("right",dimnames(car.data)[[2]],col=rainbow(length(dimnames(car.data)[[2]])),pch=19,bg="lightgrey")
dev.off()
cat("Plot has been written to:",fn,"\n")

print(chisq.test(car.data))
