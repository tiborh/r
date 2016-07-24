library(ggplot2)
## str(chickwts) # not this one

library(gnumeric)
gfp <- file.path("data","chickweight.gnumeric")
read.gnumeric.sheet.info(gfp)
gsl <- read.gnumeric.sheets(gfp,head=T)
str(gsl)
gsdf <- as.data.frame(gsl[[1]])
gsdf$chick = factor(gsdf$chick)
gsdf$diet = factor(gsdf$diet)
str(gsdf)
ggplot(gsdf, aes(time,weight)) + geom_line() # not much help
ggplot(gsdf, aes(time,weight)) + geom_line(aes(group=chick)) # not here either
ggplot(gsdf, aes(time,weight,col=diet)) + geom_line() # only marginally better
ggplot(gsdf, aes(time,weight,col=diet)) + geom_line(aes(group=chick))

## resorting to the trend lines
ggplot(gsdf, aes(time,weight,col=diet)) + 
    geom_line(alpha=0.3) + geom_smooth(lwd=2,se=F)
ggplot(gsdf, aes(time,weight,col=diet)) + 
    geom_line(aes(group=chick),alpha=0.3) + geom_smooth(lwd=2,se=F)

## titanic
## crew data can be checked from COUNT::titanic or COUNT::titanicgrp or datasets::Titanic
gfp <- file.path("data","titanic.gnumeric")
read.gnumeric.sheet.info(gfp)
gsl <- read.gnumeric.sheets(gfp,head=T)
str(gsl)
titanic=gsl
titanic = as.data.frame(titanic[[1]])
str(titanic)
ggplot(titanic,aes(x=factor(Pclass),fill=factor(Sex))) +
    geom_bar(position="dodge")

## a new facet
ggplot(titanic,aes(x=factor(Pclass),fill=factor(Sex))) +
    geom_bar(position="dodge") + facet_grid(. ~ Survived)

titanic$Survived = factor(titanic$Survived)
levels(titanic$Survived) = c("Died","Survived")
str(titanic)
## entering the age dimension:
posn.j <- position_jitter(0.5, 0)
ggplot(titanic,aes(factor(Pclass),Age,col=factor(Sex))) + 
    geom_jitter(position=posn.j,size=3,alpha=0.5) + 
    facet_grid(. ~ Survived) +
    scale_x_discrete("Passenger Classes") +
    scale_colour_discrete("Sex") +
    ggtitle("Survival on Titanic")
ggsave(file.path("img","titanic.png"))
