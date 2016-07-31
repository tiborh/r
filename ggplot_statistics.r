library(ggplot2)
## called from geom or
## called independently
## called with stat_

## implicit calling:
p <- ggplot(iris, aes(x = Sepal.Width))
p + geom_histogram()                    # implicit call of stat_bin
p + geom_bar()                          # default stat is bin
p + stat_bin()                          # same result as histogram

## in stacked bars:
p1 <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(am)))
p1 + geom_bar()                         # stacked
p1 + stat_bin()                         # Error: StatBin requires a continuous x variable the x variable
                                        # is discrete. Perhaps you want stat="count"?
## the above is a wrong error message: it should say: stat_count(width = 0.5)
p1 + stat_count(width = 0.5)

cars.base = ggplot(mtcars, aes(x=mpg))
cars.base + geom_histogram(fill = "skyblue") +
    geom_freqpoly(col = "red")
## stat_bin is called in the background
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
bw <- 3
cars.base + geom_histogram(fill = "skyblue",binwidth=bw) +
    geom_freqpoly(col = "red",binwidth=bw)

## stat_bin counts the number of observations by default

## stat_smooth() accessible via geom_smooth

p2 <- ggplot(iris, aes(Sepal.Width,Sepal.Length,colour=Species))
p2 + geom_point()
## + smoothing
p2 + geom_smooth()   # the gray range means 95% confidence intervall
## + both
p2 + geom_point() + geom_smooth()
## to have only the trendline:
p2 + geom_point() + geom_smooth(se = F)
## noisier smoothing:
p2 + geom_point() + geom_smooth(se = F, span = 0.4) # with lots of warnings.
## modelling:
## the default seems to be loess:
p2 + geom_point() + geom_smooth(method = "loess")
## liniear
p2 + geom_point() + geom_smooth(method = "lm")

## the importance of factor:
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() + stat_smooth(se = F)    # a single smooth line

ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
    geom_point() + stat_smooth(se = F)    # three smooth lines

ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
    geom_point() + stat_smooth(method="lm", se = F, group=1) # connected

## two of them can also be added:
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
    geom_point() + stat_smooth(se = F) +
    stat_smooth(method="lm", se = F, col="orange")

## add it to the legend
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
    geom_point() + stat_smooth(se = F) +
    stat_smooth(method="lm", se = F, aes(col="orange")) # not really what we need

ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
    geom_point() + stat_smooth(se = F) +
    stat_smooth(method="lm", se = F, aes(group=1)) # not in the legend again


## manual addition
library(RColorBrewer)
myColours <- c(brewer.pal(3, "Dark2"), "black") # three plus black
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
    geom_point() + stat_smooth(method = "lm", se = F, span = 0.75) +
    stat_smooth(method = "loess", aes(group = 1, col="All"), 
                se = F, span = 0.7) +
    scale_color_manual("Cylinders",values=myColours)

## further examples

library(car)
str(Vocab)
ggplot(Vocab, aes(x = education, y = vocabulary)) +
    geom_jitter(alpha = 0.2) + stat_smooth(method="lm",se=F) # trend line not really useful

ggplot(Vocab, aes(x = education, y = vocabulary, col=factor(year))) +
    stat_smooth(method="lm",se=F)       # too many trendlines close together

ggplot(Vocab, aes(x = education, y = vocabulary, col=factor(year))) +
    stat_smooth(method="lm",se=F) +
    scale_color_brewer()                # not enough colours in default "blues"

## invisible grouping:
ggplot(Vocab, aes(x = education, y = vocabulary, col = year,group=factor(year))) +
  stat_smooth(method = "lm", se = F) +
  scale_color_gradientn(colors = brewer.pal(9,"YlOrRd"))

## more contrast
ggplot(Vocab, aes(x = education, y = vocabulary, col = year,group=factor(year))) +
  stat_smooth(method = "lm", se = F, alpha = 0.6, size =2) +
  scale_color_gradientn(colors = brewer.pal(9,"YlOrRd"))

## the above one was still too messy, try quantile
ggplot(Vocab, aes(x = education, y = vocabulary, col = year, group = factor(year))) +
    stat_quantile(method="rq",alpha = 0.6, size = 2) +
    scale_color_gradientn(colors = brewer.pal(9,"YlOrRd"))
## lots of warnings above, result is absolute mess

ggplot(Vocab, aes(x = education, y = vocabulary, col = year, group = factor(year))) +
    stat_quantile(method="rq",alpha = 0.6, size = 2, quantiles=0.5) +
    scale_color_gradientn(colors = brewer.pal(9,"YlOrRd"))

## stat_sum
p <- ggplot(Vocab, aes(x = education, y = vocabulary)) +
    stat_smooth(method = "loess", aes(col = "red"), se = F) +
    stat_smooth(method = "lm", aes(col = "blue"), se = F) +
    scale_color_discrete("Model", labels = c("red" = "LOESS", "blue" = "lm"))

p                                       # takes lots of time result is two lines
p + stat_sum()                          # gives number dots to the picture
## scale can be set:
p + stat_sum() + scale_size(range=c(1,10))
