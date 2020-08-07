#!/usr/bin/env Rscript

## source:
## https://www.tutorialspoint.com/r/r_data_reshaping.htm

require(MASS)

cat("Structure of Pima.te:\n")
print(str(Pima.te))
cat("\nStructure of Pima.tr:\n")
print(str(Pima.tr))

cat("\nCommon structure with rbind:\n")
print(str(rbind(Pima.te,Pima.tr)))

cat("\nMerged by bp and bmi:\n")
print(str(merge(x = Pima.te, y = Pima.tr,
                by.x = c("bp", "bmi"),
                by.y = c("bp", "bmi")
                )
          )
      )

cat("\nships:\n")
print(str(ships))

if(!require("reshape2"))
    stop("reshape2 is needed")

cat("\nafter melt-ing by c('type','year'):\n")
print(str(melt(ships, id = c("type","year"))))

if(!require("reshape"))
    stop("reshape is needed")

cat("\nreversing melt with cast cast(molten.data, type+year~variable,sum)\n")
print(str(reshape::cast(melt(ships, id = c("type","year")), type+year~variable,sum)))
cat("Which does not exactly work as it was in the example, as list is returned instead of data.frame, and 'unlist()' is not much of a help either as it results in a vector with attributes in place of a data.frame.\n")
