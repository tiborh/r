#!/usr/bin/env Rscript

source("common.r")

## based on:
## https://www.tutorialspoint.com/r/r_linear_regression.htm

print(str(women))
print(summary(women))

wh.rel <- lm(weight~height,data=women)
cat("relationship between weight and height:\n")
print(wh.rel)
cat("more details:\n")
print(summary(wh.rel))

new.heights <- data.frame(height=c(55.0,75.0))
cat("Getting predictions for the following:\n")
print(new.heights)

new.heights$weight.est = (predict(wh.rel,new.heights))

cat("supplemented with predictions:\n")
print(new.heights)

fn <- file.path(IMG.DIR,"women_hw_linear.png")
png(file=fn)
plot(weight~height,data=women,
     xlim=c(55,75),ylim=c(100,175),
     xlab = "Weight in Pound",ylab = "Height in Inch",
     main="Weight & Height Regression (linear)")
points(weight.est~height,data=new.heights,col="blue")
abline(wh.rel,cex = 1.3,pch = 16,col="red")
legend("topleft",c("original","estimate","linear regression"),col=c("black","blue","red"),pch=c(1,1,NA),lty=c(0,0,1))
dev.off()
cat("Graphical representation has been written to:",fn,"\n")
