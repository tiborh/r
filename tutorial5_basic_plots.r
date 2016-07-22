w1 <- read.csv(file="data/w1.dat",sep=",",head=TRUE)
str(w1)                                 # dataframe
typeof(w1)                              # list
quantile(w1$vals)
tree <- read.csv(file="data/trees91.csv",sep=",",head=TRUE)
str(tree)
names(tree)

## strip charts (one dimensional)

help(stripchart)
## from examples of the help page:
x <- stats::rnorm(50)
xr <- round(x, 1)

stripchart(x)
m <- mean(par("usr")[1:2])
text(m, 1.04, "stripchart(x, \"overplot\")")

stripchart(xr, method = "stack", add = TRUE, at = 1.2)
text(m, 1.27, "stripchart(round(x,1), \"stack\")")

stripchart(xr, method = "jitter", add = TRUE, at = 0.7)
text(m, 0.85, "stripchart(round(x,1), \"jitter\")")

stripchart(decrease ~ treatment,
           main = "stripchart(OrchardSprays)",
           vertical = TRUE, log = "y", data = OrchardSprays)

stripchart(decrease ~ treatment, at = c(1:8)^2,
           main = "stripchart(OrchardSprays)",
           vertical = TRUE, log = "y", data = OrchardSprays)

## if nothing is said, boxplot is prepared
plot(decrease ~ treatment, data = OrchardSprays)

## back to tutorial (going on using m of help)
stripchart(w1$vals)
text(m,1.04,"vals")

stripchart(w1$vals,method="stack", add=T, at=1.2)
text(m,1.27,"vals, stacked")

stripchart(w1$vals,method="jitter", add=T, at=0.7)
text(m,0.85,"vals, jittered")

## vertical charts
stripchart(w1$vals,vertical=TRUE)
stripchart(w1$vals,vertical=TRUE,method="jitter")
help(par)


## full
stripchart(w1$vals,method="stack",
             main='Leaf BioMass in High CO2 Environment',
             xlab='BioMass of Leaves')
## adding same to existing plot:
stripchart(w1$vals,method="stack")
title('Leaf BioMass in High CO2 Environment',xlab='BioMass of Leaves')

## histograms:
hist(w1$vals,main="Distribution of w1",xlab="w1")

## try a few params:
hist(w1$vals,breaks=2)
hist(w1$vals,breaks=4)
hist(w1$vals,breaks=6)
hist(w1$vals,breaks=8)
hist(w1$vals,breaks=12)

hist(w1$vals,breaks=12,xlim=c(0,10))
hist(w1$vals,breaks=12,xlim=c(-1,2))
hist(w1$vals,breaks=12,xlim=c(0,2))
hist(w1$vals,breaks=12,xlim=c(1,1.3))
hist(w1$vals,breaks=12,xlim=c(0.9,1.3))

hist(w1$vals,
     main='Leaf BioMass in High CO2 Environment',
     xlab='BioMass of Leaves')

## add a stripchart:
hist(w1$vals,main='Leaf BioMass in High CO2 Environment',xlab='BioMass of Leaves',ylim=c(0,16))
stripchart(w1$vals,add=TRUE,at=15.5)

## boxplot
boxplot(w1$vals)
title('Leaf BioMass in High CO2 Environment',ylab='BioMass of Leaves',xlab="vals")

## horizontally
boxplot(w1$vals,
        main='Leaf BioMass in High CO2 Environment',
        xlab='BioMass of Leaves',
        horizontal=TRUE)

## combinations
hist(w1$vals,main='Leaf BioMass in High CO2 Environment',xlab='BioMass of Leaves',ylim=c(0,16))
boxplot(w1$vals,horizontal=TRUE,at=15.5,add=TRUE,axes=FALSE)

hist(w1$vals,main='Leaf BioMass in High CO2 Environment',xlab='BioMass of Leaves',ylim=c(0,16))
boxplot(w1$vals,horizontal=TRUE,at=16,add=TRUE,axes=FALSE)
stripchart(w1$vals,add=TRUE,at=15)

## from tree
boxplot(tree$STBM,
        main='Stem BioMass in Different CO2 Environments',
        ylab='BioMass of Stems')

## a hardly useful one:
plot(tree)

## better say what you want to see
boxplot(tree$STBM~tree$C)
title('trees91.dat',xlab="CO2 treatment level",ylab='Stem biomass')

## Scatter plots
plot(tree$STBM,tree$LFBM,main="Relationship Between Stem and Leaf Biomass",xlab='Stem biomass',ylab='Leaf biomass')
## correlation
c <- cor(tree$STBM,tree$LFBM)
messagetext <- paste("correlation:",c)
mtext(messagetext, adj = 0)

## normal quantile plot

qqnorm(w1$vals)                         # having default title and labels

## overriding defaults:
qqnorm(w1$vals,
       main="Normal Q-Q Plot of the Leaf Biomass",
       xlab="Theoretical Quantiles of the Leaf Biomass",
       ylab="Sample Quantiles of the Leaf Biomass")
