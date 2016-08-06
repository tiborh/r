library(ggplot2); library(tidyr)
## iris.wide
source("iris_wide.r")

p <- ggplot(iris.wide, aes(Length, Width, col = Part)) +
    geom_point(position = position_jitter(), alpha = 0.7) +
    scale_color_brewer(palette = "Set1") +
    coord_fixed()
p

p + facet_grid(. ~ Species)

## iris.tidy
iris.tidy <- iris %>%
    gather(key, Value, -Species) %>%
    separate(key,c("Part","Measure"), sep="\\.")
str(iris.tidy)

iris.tidy.base <- ggplot(iris.tidy, aes(Measure,Value,col=Part)) + geom_jitter()
iris.tidy.base + facet_grid(. ~ Species)

## aiding deception:
iris.tidy.base + facet_grid(Species ~ .)

## Exercises:
pc <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

mtcars$am = factor(mtcars$am)
mtcars$cyl = factor(mtcars$cyl)

pc + facet_grid(am ~ .)
pc + facet_grid(. ~ cyl)
pc + facet_grid(am ~ cyl)

## many variables
library(RColorBrewer)
mtcars$cyl_am <- paste(mtcars$cyl, mtcars$am, sep = "_")
myCol <- rbind(brewer.pal(9, "Blues")[c(3,6,8)],
               brewer.pal(9, "Reds")[c(3,6,8)])
str(myCol)
str(mtcars)

pc <- ggplot(mtcars, aes(x = wt, y = mpg,col=cyl_am)) +
    geom_point() + scale_color_manual(values=myCol)
pc

pc + facet_grid(gear ~ vs)

pc1 <- ggplot(mtcars, aes(x = wt, y = mpg, col=cyl_am, size = disp)) +
    geom_point(alpha = 0.5) + scale_color_manual(values=myCol)
pc1 + facet_grid(gear ~ vs)

library(gnumeric)
gfp <- file.path("data","mamsleep.gnumeric")
read.gnumeric.sheet.info(gfp)
gsl <- read.gnumeric.sheets(gfp,head=T)
str(gsl)
mamsleep <- as.data.frame(gsl[[1]])
str(mamsleep)

# Basic scatter plot
m1 <- ggplot(mamsleep, aes(time,name,col=sleep)) + geom_point()

# Facet rows accoding to vore
m1 + facet_grid(. ~ vore)

# Specify scale and space arguments to free up rows
m1 + facet_grid(vore ~ ., scale = "free_y", space = "free_y")


## facet_wrap can help move them along more freely:

ggplot(iris.wide, aes(Length,Width,col = Part)) +
    geom_jitter(alpha=0.5) +
    geom_point() + facet_wrap(~ Species, scales="free", nrow=2)

ggplot(iris.wide, aes(Length,Width,col = Part)) +
    geom_jitter(alpha=0.5) +
    geom_point() + facet_wrap(~ Species, scales="free_y", nrow=3)

ggplot(iris.wide, aes(Length,Width,col = Part)) +
    geom_jitter(alpha=0.5) +
    geom_point() + facet_wrap(~ Species, scales="free_x")
