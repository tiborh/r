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

ggplot(mtcars, aes(x=mpg)) +
    geom_histogram(fill = "skyblue") +
    geom_freqpoly(col = "red")
## stat_bin is called in the background
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
