## not fo atomic vectors
## error:
## terms(1)
## a <- 1; terms(a)
## a <- 1:10; terms(a)
## a <- data.frame(a = 1:10, b = rnorm(10))

y1 <- y ~ x
y1                                      # y ~ x

terms(y1)
## y ~ x
## > terms(y1)
## y ~ x
## attr(,"variables")
## list(y, x)
## attr(,"factors")
##   x
## y 0
## x 1
## attr(,"term.labels")
## [1] "x"
## attr(,"order")
## [1] 1
## attr(,"intercept")
## [1] 1
## attr(,"response")
## [1] 1
## attr(,".Environment")
## <environment: R_GlobalEnv>

## use of specials (as used for gam() in packages mgcv and gam)
(tf <- terms(y ~ x + x:z + s(x)))
(tf <- terms(y ~ x + x:z + s(x), specials = "s"))
## Note that the "factors" attribute has variables as row names
## and term labels as column names, both as character vectors.
attr(tf, "specials")    # index 's' variable(s)
## $s
## [1] 4
rownames(attr(tf, "factors"))[attr(tf, "specials")$s]
## [1] "s(x)"

## we can keep the order by
terms(y ~ x + x:z + s(x), specials = "s", keep.order = TRUE)
## y ~ x + x:z + s(x)
## attr(,"variables")
## list(y, x, z, s(x))
## attr(,"factors")
##      x x:z s(x)
## y    0   0    0
## x    1   2    0
## z    0   1    0
## s(x) 0   0    1
## attr(,"term.labels")
## [1] "x"    "x:z"  "s(x)"
## attr(,"specials")
## attr(,"specials")$s
## [1] 4

## attr(,"order")
## [1] 1 2 1
## attr(,"intercept")
## [1] 1
## attr(,"response")
## [1] 1
## attr(,".Environment")
## <environment: R_GlobalEnv>(tf <- terms(y ~ x + x:z + s(x), specials = "s"))
