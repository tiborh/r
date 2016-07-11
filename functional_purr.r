if (!require(purrr)) install.packages("purrr")
library(purrr)

means <- map_dbl(mtcars,mean)
medians <- map_dbl(mtcars,median)
sds <- map_dbl(mtcars,sd)
means
medians

## same with functions:
col.median <- function(df) {
  output <- numeric(length(df))
  for (i in seq_along(df)) {
    output[[i]] <- median(df[[i]])
  }
  output
}

col.mean <- function(df) {
  output <- numeric(length(df))
  for (i in seq_along(df)) {
    output[[i]] <- mean(df[[i]])
  }
  output
}

col.sd <- function(df) {
  output <- numeric(length(df))
  for (i in seq_along(df)) {
    output[[i]] <- sd(df[[i]])
  }
  output
}

## what about function as an argument?

col.fun <- function(df,fun) {
  output <- numeric(length(df))
  for (i in seq_along(df)) {
    output[[i]] <- fun(df[[i]])
  }
  output
}

col.fun(mtcars,mean)
col.fun(mtcars, fun=mean)               # alternatively
sapply(mtcars,mean)                     # almost the same, but this one also has the names

plot(col.mean(mtcars),col.median(mtcars))
reg1 <- lm(means~medians)
reg2 <- lm(medians~means)
abline(0,1)
abline(reg1,col="red")
abline(reg2,col="blue")
legend("bottomright",lty=c(1,1,1),legend=c("45 degrees","lm(means~medians)","lm(medians~means)"),col=c("black","red","blue"))
?legend

plot(means,sds)
plot(medians,sds)
plot(sds)


## purrr
## map() # list
## map_dbl() # double vector
## others _lgl for logical vector, _int, _char

## behaviour:
## dataframe: work on columns
## list: work on elements
## atomic vector: each element, returning list

v1 <- 1:10
typeof(v1)
class(v1)
map(v1,function(x) {x+3})               # list
map_dbl(v1,function(x) {x+3})           # atomic vector
map_dbl(v1,mean)                        # same

?quantile
quantile(1:10)
quantile(1:10,0)
quantile(1:10,0.25)
quantile(1:10,0.5)

if (!require(nycflights13)) install.packages("nycflights13")
library(nycflights13)
planes
str(planes)
planes.num <- planes[map_lgl(planes,is.numeric)]
str(planes.num)
map(planes.num,quantile,na.rm=T)
map_dbl(planes.num,quantile,probs=1,na.rm=T)

## shortcuts

map(planes.num, ~ sum(is.na(.)))        # how many NA in each type of data?

list.of.results <- list(
    list(a=1,b="a"),
    list(a=2,b="b"),
    list(a=3,b="c")
)

map_dbl(list.of.results,"a")            # 1 2 3
map_chr(list.of.results,2)              # "a" "b" "c"

## splitting a data.frame:
cyl <- split(mtcars, mtcars$cyl)
str(cyl)

## piped processing:
mtcars %>% 
  split(mtcars$cyl) %>%
  map(~ lm(mpg ~ wt, data = .)) %>%
  map(coef) %>% 
  map_dbl("wt")

## safely(): to go around errors and have the explanation what should cause an error:
map(planes,safely(mean),na.rm=T)        # not very helpful, only for diag pruposes
## much better:
map_dbl(planes.num,mean,na.rm=T)

## a safe version of a function:
safely.mean <- safely(mean)

## another example:
urls <- list(
  example = "http://example.org",
  rproj = "http://www.r-project.org",
  asdf = "http://asdfasdasdkfjlda"
)

safe_readLines <- safely(readLines)
html <- map(urls,safe_readLines)
str(html)
html$example$result                     # a successful result
html$asdf$error                         # an error

html2 <- transpose(html)                # results and errors are grouped
str(html2)
res <- transpose(html)[["result"]]
errs <- transpose(html)[["error"]]
is_ok <- map_lgl(errs,is.null)
urls[!is_ok]                            # get the problem url(s)

## possibly(): default value for error
## quietly(): do not show the extra info

## more than one argument:

map2(list(5,10,20),list(1,5,10),rnorm)  # different sizes, different means
## pmap for any number of arguments:
pmap(list(n = list(5,10,20),
          mean = list(1,5,10),
          sd = list(0.1, 0.5, 0.1)), rnorm)  # all three are different now

## iterating through several functions: invoke_map()
invoke_map(list(rnorm,runif,rexp), n = 5)


## map functions with side effects
## walk: same usage as map
x <- list(1, "a", 3.14)
x %>% walk(print)

library(ggplot2)
plots <- cyl %>%
    map(~ ggplot(., aes(mpg,wt)) + geom_point())
str(plots)
paths <- paste0(names(plots), ".pdf")
walk2(paths,plots,ggsave)
walk(paths,file.remove)
##print(plots)                            # plots overwriting each other
lengths <- x %>% walk(print) %>% map_dbl(length) # both creates and prints


## a series of histograms:

## Define list of functions
f <- list(Normal = "rnorm", Uniform = "runif", Exp = "rexp")

## Define params
params <- list(
  Normal = list(mean = 10),
  Uniform = list(min = 0, max = 5),
  Exp = list(rate = 5)
)

## Assign the simulated samples to sims
sims <- invoke_map(f, params, n = 50)

## Use walk() to make a histogram of each element in sims
walk(sims,hist)

## find nice breaks for histograms:
find_breaks <- function(x) {
    rng <- range(x, na.rm = TRUE)
    seq(rng[1], rng[2], length.out = 30)
}
