library(ggplot2)

p <- ggplot(iris, aes(Species,Sepal.Length))
p + geom_point(position=position_jitter(0.3))

## calculating statistics:
set.seed(123)
xx <- rnorm(100)

mean(xx)                                # [1] 0.09040591

mean(xx) + (sd(xx) * c(-1,1))           # [1] -0.822410  1.003222

library(Hmisc)
smean.sdl(xx, mult = 1)
##        Mean       Lower       Upper 
##  0.09040591 -0.82240997  1.00322179 

## ggplot:
mean_sdl(xx, mult = 1)
##            y     ymin     ymax
## 1 0.09040591 -0.82241 1.003222

p + stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1))

p + stat_summary(fun.y = mean, geom = "point") +
    stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1),
                 geom = "errorbar",width = 0.1)

## error bars (not recommended):
p + stat_summary(fun.y = mean, geom = "bar", fill = "skyblue") +
    stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1),
                 geom = "errorbar",width = 0.1)

## 95% Confidence Interval
ERR <- qt(0.975, length(xx) -1) * sd(xx) / sqrt(length(xx)) # [1] 0.1811225
mean(xx) + (ERR* c(-1, 1))                    # [1] -0.09071657  0.27152838

## Hmisc
smean.cl.normal(xx)
##       Mean       Lower       Upper 
## 0.09040591 -0.09071657  0.27152838 

## ggplot2
mean_cl_normal(xx)
##            y        ymin      ymax
## 1 0.09040591 -0.09071657 0.2715284

p + stat_summary(fun.data = mean_cl_normal)
?stat_summary

library(MASS)
str(mammals)
mam.new <- data.frame(body = log10(mammals$body))
str(mam.new)
ggplot(mam.new, aes(x=body)) +
    geom_histogram(aes(y=..density..),colour="black",fill="white",
                   binwidth=0.3) +
    geom_rug() +                        # tickmarks at the bottom
    stat_function(fun = dnorm, colour = "red",
                  args = list(mean = mean(mam.new$body),
                              sd = sd(mam.new$body)))

mam.new$slope <- diff(quantile(mam.new$body, c(0.25,0.75))) /
    diff(qnorm(c(0.25,0.75)))
mam.new$int <- quantile(mam.new$body, 0.25) - mam.new$slope * qnorm(0.25)
str(mam.new)

ggplot(mam.new, aes(sample = body)) +
    stat_qq() +
    geom_abline(aes(slope = slope, intercept = int), col = "red") # own calculations are needed to join qqline

## exercises:

## Convert cyl and am to factors:
mtcars$cyl <- factor(mtcars$cyl)
mtcars$am <- factor(mtcars$am)

## Define positions:
posn.d <- position_dodge(width=0.1)
posn.jd <- position_jitterdodge(jitter.width=0.1, dodge.width=0.2)
posn.j <- position_jitter(width=0.2)

## base layers:
wt.cyl.am <- ggplot(mtcars, aes(cyl,wt,col=am,fill=am,group=am))

## plotting
wt.cyl.am + geom_point(position = posn.jd, alpha = 0.6)

## implicit geom_pointrange():
wt.cyl.am + stat_summary(fun.data = mean_cl_normal,
                         fun.args = list(mult = 1), position = posn.d)

wt.cyl.am + stat_summary(fun.data = mean_sdl, position = posn.d)

## explicit geom
wt.cyl.am +
  stat_summary(geom = "point", fun.y = mean, position = posn.d) +
  stat_summary(geom = "errorbar", fun.data = mean_sdl, 
               position = posn.d, fun.args = list(mult = 1), width = 0.1)

## custom functions
# Function to save range for use in ggplot 
gg_range <- function(x) {
    data.frame(ymin = min(x),
               ymax = max(x))
}

xx <- 1:100

gg_range(xx)

med_IQR <- function(x) {
  data.frame(y = median(x),
             ymin = quantile(x)[1],
             ymax = quantile(x)[3])
}

med_IQR(xx)

wt.cyl.am + 
  stat_summary(geom = "linerange", fun.data = med_IQR, 
               position = posn.d, size = 3) +
  stat_summary(geom = "linerange", fun.data = gg_range, 
               position = posn.d, size = 3, 
               alpha = 0.4) +
  stat_summary(geom = "point", fun.y = median, 
               position = posn.d, size = 3, 
               col = "black", shape = "x")
