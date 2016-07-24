library(ggplot2)

## histogram: needs only x
ggplot(iris, aes(Sepal.Width)) + geom_histogram(binwidth=0.1)
ggplot(iris, aes(Sepal.Width, fill=Species)) + geom_histogram(binwidth=0.1) #stacked or overlapping? experiment:
ggplot(iris, aes(Sepal.Width, fill=Species)) + geom_histogram(binwidth=0.1, position="stack") # default
ggplot(iris, aes(Sepal.Width, fill=Species)) + geom_histogram(binwidth=0.1, position="dodge")

## the following needs some change:
ggplot(iris, aes(Sepal.Width, fill=Species)) + geom_histogram(binwidth=0.1, position="fill")
ggplot(iris, aes(Sepal.Width, fill=Species)) +
    geom_histogram(binwidth=0.1, position="fill") +
    scale_y_continuous("Proportion")


ggplot(iris, aes(Sepal.Width)) + geom_histogram(aes(y= ..density..), binwidth=0.1) # no change in look, only the title changes on y axis
ggplot(diamonds, aes(carat)) + geom_histogram()
ggplot(diamonds, aes(price)) + geom_histogram()
ggplot(mtcars, aes(mpg)) + geom_histogram(binwidth=3)
ggplot(mtcars, aes(mpg, fill=factor(cyl))) +
  geom_histogram(binwidth = 3, alpha=0.6)
ggplot(mtcars, aes(mpg, fill=factor(cyl))) +
  geom_histogram(binwidth = 3, position="identity",alpha=0.6)

## freqpoly:
ggplot(mtcars, aes(mpg, col=factor(cyl))) +
  geom_freqpoly(binwidth = 1, position="identity")

## colouring in the geom_ part:
ggplot(mtcars,aes(mpg)) +
    geom_histogram(aes(y= ..density..), binwidth=1, fill="#377EB8")



## Proper bar plots are prepared with geom_bar()
## types
##   absolute counts
##   distributions
dim(sleep)                              # 20 3
str(sleep)                              # num Factor Factor
dim(msleep)                             # 83 11
names(msleep)
## "name"         "genus"        "vore"         "order"        "conservation"
## "sleep_total"  "sleep_rem"    "sleep_cycle"  "awake"        "brainwt"     
## "bodywt"
ggplot(msleep, aes(vore)) + geom_bar()
## the default argument in the background:
ggplot(msleep, aes(vore)) + geom_bar(stat="count")

## further examples:
ggplot(mtcars, aes(cyl, fill=factor(am))) + geom_bar()

## partial hiding:
posn_d <- position_dodge(width=0.2)
ggplot(mtcars, aes(cyl, fill=factor(am))) + geom_bar(position=posn_d)
## some alpha adjustment:
ggplot(mtcars, aes(cyl, fill=factor(am))) + 
    geom_bar(position=posn_d, alpha = 0.6)


detach("package:dplyr",unload=T)
library(reshape2)
iris.melted <- melt(iris, value.name = "Value", variable.name = "Measure", id="Species")
str(iris.melted)
?melt
?melt.data.frame
str(airquality)
melt(airquality,id=c("Month","Day"))

library(plyr)
?ddply
iris.summ <- ddply(iris.melted[iris.melted$Measure == "Sepal.Width",],
                   "Species", summarise, avg=mean(Value),
                   stdev=sd(Value))
str(iris.summ)

## Error: stat_count() must not be used with a y aesthetic.
ggplot(iris.summ, aes(x = Species, y = avg)) + geom_bar()
?geom_bar
## solution:
ggplot(iris.summ, aes(x = Species, y = avg)) + geom_bar(stat="identity")
## error bars:
ggplot(iris.summ, aes(x = Species, y = avg)) +
    geom_bar(stat="identity", fill="grey50") +
    geom_errorbar(aes(ymin=avg-stdev, ymax=avg+stdev), width=0.2)
## That is the Dynamita Plot

## further examples:
## palette change:
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar() +
  scale_fill_brewer(palette = "Set1")

library(car)
str(Vocab)
Vocab$edu <- factor(Vocab$education)
Vocab$voc <- factor(Vocab$vocabulary)

ggplot(Vocab, aes(x = edu, fill = voc)) +
    geom_bar() +
    scale_fill_brewer()                   # default palette, which is not enough in this case
## more on palettes:
## http://docs.ggplot2.org/current/scale_brewer.html

## for such a wide range, only the following ones are suitable:
## BrBG, PiYG, PRGn, PuOr, RdBu, RdGy, RdYlBu, RdYlGn, Spectral
## BG bluish green
## Br brown
## Bu Blue
## Gn Green
## Gy Grey
## Or Orange
## PR Purple
## Pi Pink
## Pu Purple
## Rd Red
## Spectral Rainbow
## YG yellowish green to green
## Yl Yellow
ggplot(Vocab, aes(x = edu, fill = voc)) +
    geom_bar() + scale_fill_brewer(palette="RdYlGn")
## filled:
ggplot(Vocab, aes(x = edu, fill = voc)) +
    geom_bar(position="fill") + scale_fill_brewer(palette="PiYG")

## another way to supply the missing colours:
library(RColorBrewer)
blues <- brewer.pal(9, "Blues")
print(blues)
?colorRampPalette()                  # to create colour palette by interpolation
blu.range <- colorRampPalette(blues)(length(levels(Vocab$voc)))

ggplot(Vocab, aes(x = edu, fill = voc)) +
    geom_bar() + scale_fill_manual(values=blu.range)

## yet another way:
blue.range = colorRampPalette(blues)
ggplot(Vocab, aes(x = edu, fill = voc)) +
    geom_bar(position="fill") +
    scale_fill_manual(values=blue.range(length(levels(Vocab$voc))))
