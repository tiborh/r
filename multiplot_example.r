library(ggplot2)

## simplest:
par(mfrow = c(3, 2))  # 3 rows and 2 columns
for (i in c("Sturges", "st", "Scott", "sc", "FD", "fr")) {
    hist(cars$speed, breaks = i, main = paste("method is", i, split = ""))
}

# This example uses the ChickWeight dataset, which comes with ggplot2
# First plot
p1 <- ggplot(ChickWeight, aes(x=Time, y=weight, colour=Diet, group=Chick)) +
    geom_line() +
    ggtitle("Growth curve for individual chicks")

# Second plot
p2 <- ggplot(ChickWeight, aes(x=Time, y=weight, colour=Diet)) +
    geom_point(alpha=.3) +
    geom_smooth(alpha=.2, size=1) +
    ggtitle("Fitted growth curve per diet")

# Third plot
p3 <- ggplot(subset(ChickWeight, Time==21), aes(x=weight, colour=Diet)) +
    geom_density() +
    ggtitle("Final weight, by diet")

# Fourth plot
p4 <- ggplot(subset(ChickWeight, Time==21), aes(x=weight, fill=Diet)) +
    geom_histogram(colour="black", binwidth=50) +
    facet_grid(Diet ~ .) +
    ggtitle("Final weight, by diet") +
    theme(legend.position="none")        # No legend (redundant in this graph)

source("multiplot.r")
multiplot(p1, p2, p3, p4, cols=2)

## 2

plots <- list()  # new empty list
for (i in 1:6) {
    p1 = qplot(1:10, rnorm(10), main = i)
    plots[[i]] <- p1  # add each plot into plot list
}
multiplot(plotlist = plots, cols = 3)

for (i in 1:5) {
    p1 = qplot(1:10, rnorm(10), main = i)
    plots[[i]] <- p1
}
layout <- matrix(c(1, 1, 2, 3, 4, 5), nrow = 2, byrow = TRUE)
multiplot(plotlist = plots, layout = layout)

## 3

a <- qplot(1:10, rnorm(10), main = "a")
b <- qplot(1:10, rnorm(10), main = "b")
c <- qplot(1:10, rnorm(10), main = "c")
grid.newpage()
pushViewport(viewport(layout = grid.layout(2, 2)))
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
print(a, vp = vplayout(1, 1:2))  # key is to define vplayout
print(b, vp = vplayout(2, 1))
print(c, vp = vplayout(2, 2))


## with grid:

library(gridExtra)
p1 = qplot(1:10, rnorm(10))
p2 = qplot(1:10, rnorm(10))
grid.arrange(p1, p2, ncol = 2, top = "Main title")

## see also:
## http://www.sthda.com/english/wiki/ggplot2-easy-way-to-mix-multiple-graphs-on-the-same-page-r-software-and-data-visualization
