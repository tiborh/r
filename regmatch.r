a <- "Some things are something."
grep("some",a)                          # 1
grepl("some",a)                         # T
regexpr("some",a)
## [1] 17
## attr(,"match.length")
## [1] 4
## attr(,"useBytes")
## [1] TRUE

gregexpr("some",a)
## [[1]]
## [1] 17
## attr(,"match.length")
## [1] 4
## attr(,"useBytes")
## [1] TRUE

gregexpr("some",a,ignore.case=T)
## [[1]]
## [1]  1 17
## attr(,"match.length")
## [1] 4 4
## attr(,"useBytes")
## [1] TRUE

regexec("some",a,ignore.case=T)
## [[1]]
## [1] 1
## attr(,"match.length")
## [1] 4
## attr(,"useBytes")
## [1] TRUE

regmatches(a,regexpr("[Ss]ome[\\w]*",a,perl=T)) # "Some"
regmatches(a,gregexpr("[Ss]ome[\\w]*",a,perl=T))
## [[1]]
## [1] "Some"      "something"

b <- c("something","anything","things","a thing","nothing","thingy","one thing","thing two", "thin", "Things")

grepl("thing",b)
## TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE

grep("thing",b)                         # 1 2 3 4 5 6 7 8

regexpr("thing",b)
##  [1]  5  4  1  3  3  1  5  1 -1 -1
## attr(,"match.length")
##  [1]  5  5  5  5  5  5  5  5 -1 -1
## attr(,"useBytes")
## [1] TRUE

gregexpr("thing",b)
## [[1]]
## [1] 5
## attr(,"match.length")
## [1] 5
## attr(,"useBytes")
## [1] TRUE

## [[2]]
## [1] 4
## attr(,"match.length")
## [1] 5
## attr(,"useBytes")
## [1] TRUE

## [[3]]
## [1] 1
## attr(,"match.length")
## [1] 5
## attr(,"useBytes")
## [1] TRUE

## [[4]]
## [1] 3
## attr(,"match.length")
## [1] 5
## attr(,"useBytes")
## [1] TRUE

## [[5]]
## [1] 3
## attr(,"match.length")
## [1] 5
## attr(,"useBytes")
## [1] TRUE

## [[6]]
## [1] 1
## attr(,"match.length")
## [1] 5
## attr(,"useBytes")
## [1] TRUE

## [[7]]
## [1] 5
## attr(,"match.length")
## [1] 5
## attr(,"useBytes")
## [1] TRUE

## [[8]]
## [1] 1
## attr(,"match.length")
## [1] 5
## attr(,"useBytes")
## [1] TRUE

## [[9]]
## [1] -1
## attr(,"match.length")
## [1] -1
## attr(,"useBytes")
## [1] TRUE

## [[10]]
## [1] -1
## attr(,"match.length")
## [1] -1
## attr(,"useBytes")
## [1] TRUE
