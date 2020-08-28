#!/usr/bin/env Rscript

source("common.r")

## source: man page for warpbreaks

require(stats); #anova

print(str(warpbreaks))
print(summary(warpbreaks))

fn <- file.path(IMG.DIR,"warpbreaks.png")
png(file=fn)
opar <- par(mfrow = c(1, 2), oma = c(0, 0, 1.1, 0))
plot(breaks ~ tension, data = warpbreaks, col = "lightgray",
     varwidth = TRUE, subset = wool == "A", main = "Wool A")
plot(breaks ~ tension, data = warpbreaks, col = "lightgray",
     varwidth = TRUE, subset = wool == "B", main = "Wool B")
mtext("warpbreaks data", side = 3, outer = TRUE)
par(opar)
dev.off()
cat("warpbreaks plot has been written:",fn,"\n")
print(summary(fm1 <- lm(breaks ~ wool*tension, data = warpbreaks)))
print(anova(fm1))
