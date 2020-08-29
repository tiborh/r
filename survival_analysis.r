#!/usr/bin/env Rscript

source("common.r")

stop.if.not.installed("survival")

## based on:
## https://www.tutorialspoint.com/r/r_survival_analysis.htm

cat("The data set:\n")
print(str(pbc))

cat("Surv(time,even) creates the model, survfit creates the survival curv.\n")

survival.obj <- survfit(Surv(pbc$time,pbc$status == 2)~1)

cat("Shortly:\n")
print(survival.obj)

fn <- file.path(IMG.DIR,"survival_plot.png")
png(file=fn)
plot(survival.obj,main="Survival Analysis",
     xlab="Time after registration in days",
     ylab="Probability of survival")
dev.off()
cat("Survival plot has been written to:",fn,"\n")
