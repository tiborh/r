library(ggplot2)
library(MASS)
data()
mammals
plot(mammals)                           # not much
abline(lm(mammals),col="red")

ggplot(mammals, aes(x=body,y=brain)) + geom_point() + stat_smooth(method = "lm", col="red", se=F)

## better one:
ggplot(mammals, aes(x=body,y=brain)) +
    geom_point(alpha = 0.6) +
    coord_fixed() +
    scale_x_log10() +
    scale_y_log10() +
    stat_smooth(method = "lm", col="#C42126", se=F, size=1)


## difference btw categorical (but not factorised) and factorised data:
plot(mpg ~ cyl, data=mtcars)            # scatter plot
plot(mpg ~ factor(cyl), data=mtcars)    # boxplot

library(ggvis)
mtcars %>% ggvis(~cyl,~mpg) %>% layer_points()
mtcars %>% ggvis(~factor(cyl),~mpg) %>% layer_points()
mtcars %>% ggvis(~factor(cyl),~mpg) %>% layer_boxplots()

ggplot(mtcars, aes(x = cyl, y = mpg)) + geom_point()
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) + geom_point()


## The Grammar of Graphics
## Graphics == distinct layer of grammatical elements
## Meaningful plots through aesthetic mapping

## Important Elements:
## Data
## Aesthetics
## Geometry

## Optional elements:
## Facets
## Statistics
## Coordinates
## Themes

## colour:
ggplot(mtcars, aes(x = wt, y = mpg, col = disp)) + geom_point()
## size:
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) + geom_point()

## both
ggplot(mtcars, aes(x = wt, y = mpg, col = disp, size = factor(cyl))) + geom_point()

## Iris data set:
## https://en.wikipedia.org/wiki/Iris_flower_data_set
dim(iris)
str(iris)
plot(Sepal.Length ~ Sepal.Width, data=iris)
##     data  aesthetics                       geometry
ggplot(iris, aes(Sepal.Width,Sepal.Length)) + geom_point()
ggplot(iris, aes(Sepal.Width,Sepal.Length)) + geom_jitter(alpha = 0.6)
## Facets:
ggplot(iris, aes(Sepal.Width,Sepal.Length)) +
    geom_jitter(alpha = 0.6) +
    facet_grid(. ~ Species)
##  (or)
ggplot(iris, aes(Sepal.Width,Sepal.Length)) +
    geom_point() +
    facet_grid(. ~ Species)

## statictics
ggplot(iris, aes(Sepal.Width,Sepal.Length)) +
    geom_point() +
    facet_grid(. ~ Species) +
    stat_smooth(method = "lm", se = F, col="red")

## coordinates
ggplot(iris, aes(Sepal.Width,Sepal.Length)) +
    geom_point() +
    facet_grid(. ~ Species) +
    stat_smooth(method = "lm", se = F, col="red") +
    scale_y_continuous("Sepal Length (cm)",
                       limits = c(4,8),
                       expand = c(0,0)) +
    scale_x_continuous("Sepal Width (cm)",
                       limits = c(2,5),
                       expand = c(0,0)) +
    coord_equal()

## theme
ggplot(iris, aes(Sepal.Width,Sepal.Length)) +
    geom_point() +
    facet_grid(. ~ Species) +
    stat_smooth(method = "lm", se = F, col="red") +
    scale_y_continuous("Sepal Length (cm)",
                       limits = c(4,8),
                       expand = c(0,0)) +
    scale_x_continuous("Sepal Width (cm)",
                       limits = c(2,5),
                       expand = c(0,0)) +
    coord_equal() +
    theme(panel.background  = element_blank(),
          plot.background   = element_blank(),
          legend.background = element_blank(),
          strip.background  = element_blank(),
          strip.text        = element_blank(),
          axis.text         = element_text(colour="black"),
          axis.ticks        = element_line(colour="black"),
          axis.line         = element_line(colour="black"),
          panel.grid.major  = element_blank(),
          panel.grid.minor  = element_blank(),
          panel.margin      = unit(1, "lines")
          )

## exercises:
str(diamonds)
ggplot(diamonds, aes(x = carat, y = price)) + geom_point(alpha=1/10,size=1)
ggplot(diamonds, aes(x = carat, y = price, col=cut)) + geom_point(size=1)
ggplot(diamonds, aes(x = carat, y = price)) + geom_point() + geom_smooth()

## clarity shows a much better colour distribution
ggplot(diamonds, aes(x = carat, y = price, col=clarity)) +
  geom_point(alpha=0.4)

plot(price ~ carat,data=diamonds,col=cut,pch=20)
legend("bottomright",legend=levels(diamonds$cut),inset=0.02,pch=20,col=1:length(levels(diamonds$cut)))

## colour combined with clarity:
ggplot(diamonds, aes(x = carat, y = price, col=clarity)) +
  geom_smooth()
ggplot(diamonds, aes(x = carat, y = price, col=cut)) + geom_smooth()

## gradual build, alternative paths:
dia_plot <- ggplot(diamonds, aes(carat, price))
## printing it with points
dia_plot + geom_point()
dia_plot + geom_point(alpha=0.2)
## adding colour to points
dia_plot + geom_point(aes(col=clarity))
## smoothing
dia_plot + geom_smooth(se=F)            # only the line, not the range
## aes() in smooth:
dia_plot + geom_smooth(aes(col=clarity))

