library(ggplot2)
## bar plots
##   absolute values
##   distributions

source("mamsleep.r")
str(mamsleep)

library(dplyr)
library(tidyr)

msleep <- mamsleep %>% spread(sleep,time) %>% select(-name)
str(msleep)

d <- ggplot(msleep, aes(vore, total)) +
    scale_y_continuous("Total sleep time (h)",
                       limits = c(0, 24),
                       breaks = seq(0, 24, 3),
                       expand = c(0,0)) +
    scale_x_discrete("Eating habits") +
    theme_classic()

d + stat_summary(fun.y = mean, geom = "bar",
                 fill = "grey50") +
    stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1),
                 geom = "errorbar", width = 0.2)

## problems:
##   number of observations is not given (for each)
##   mean and sd suggests normal distribution, but is that really the case?
##   no mammal sleeps zero, yet it starts with zero
##   no data above the mean

d + geom_point()
d + geom_jitter(width=0.5,alpha=0.5)
d + geom_boxplot()
plot(total ~ vore,data=msleep)

msleep$non.rem = msleep$total - msleep$rem
msleep <- msleep %>% select(-total) %>% gather(sleep,time,-vore)
msleep$sleep <- factor(msleep$sleep)

str(msleep)

d1 <- ggplot(msleep,aes(vore,time,col=sleep)) + geom_jitter(width=0.5,alpha=0.5)
## conclusions:
##   not enough data on insectivores

d1 + stat_summary(fun.y = mean, geom = "point",
                 col = "black") +
    stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1),
                 geom = "errorbar", width = 0.2)


## pie charts
ggplot(mtcars,aes(x = factor(1), fill = factor(cyl))) +
    geom_bar(width = 1) +
    coord_polar(theta = "y")
## questions:
##   is it really the whole?
##   proportions? clear?
##   representation?

## steps to create pies
mtcars$cyl = factor(mtcars$cyl)
mtcars$am = factor(mtcars$am)
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position = "fill")

ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position = "fill") + facet_grid(. ~ cyl)
  
ggplot(mtcars, aes(x = factor(1), fill = am)) +
    geom_bar(position = "fill") + facet_grid(. ~ cyl) + coord_polar(theta="y")

## no small whole in the middle
ggplot(mtcars, aes(x = factor(1), fill = am)) +
    geom_bar(position = "fill", width=1) + facet_grid(. ~ cyl) +
    coord_polar(theta="y")

## multiple pies
## Parallel coordinates plot using GGally
if (!require(GGally)) install.packages("GGally")
library(GGally)

# All columns except am
group_by_am <- 9
my_names_am <- (1:11)[-group_by_am]

# Basic parallel plot - each variable plotted as a z-score transformation
ggparcoord(mtcars, my_names_am, groupColumn = group_by_am, alpha = 0.8)

## heatmaps
## one of the least effective ones
library(lattice)
data()
str(barley)
barley$year = as.character(barley$year)
barley$year = factor(barley$year,levels = c("1931","1932"))
library(dplyr)

library(tidyr)
barley.s <- barley %>% spread(year,yield)
str(barley.s)

ggplot(barley,aes(year,variety,fill=yield)) + geom_tile() +
    facet_grid(site ~ .)
ggplot(barley,aes(year,variety,fill=yield)) + geom_tile() +
    facet_wrap(~site,ncol=1)
## only good for the "vow factor" because it looks complex
## also for general picture
## not good for precise, individual-level data

## a better way usually is dots:
ggplot(barley,aes(yield,variety,col=year)) + geom_point() +
    facet_grid(site ~ .)
## easier to see the trends

## changes from year to year:
ggplot(barley,aes(year,yield,col=variety)) + geom_point(stat="identity") +
    facet_grid(. ~ site)

ggplot(barley,aes(year,yield,fill=variety)) + geom_bar(stat="identity") +
    facet_grid(. ~ site)

ggplot(barley,aes(year,yield,col=variety,group=variety)) + geom_line() +
    facet_grid(. ~ site)

## exercises:
library(RColorBrewer)
myColours <- brewer.pal(9, "Reds")
ggplot(barley,aes(year,variety,fill=yield)) + geom_tile() +
    facet_wrap(~site,ncol=1) + scale_fill_gradientn(colors=myColours)

## Create overlapping ribbon plot from scratch
ggplot(barley,aes(year,yield,col=site,fill=site,group=site)) + 
    stat_summary(fun.y = mean, geom="line") +
    stat_summary(fun.data = mean_sdl, fun.args=list(mult=1), geom="ribbon",col=NA,alpha=0.1)
