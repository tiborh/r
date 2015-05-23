makeVector <- function(x = numeric()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmean <- function(mean) m <<- mean
    getmean <- function() m
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}

cachemean <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m
}

x <- 1:13
xv <- makeVector(x)
print(xv)
cachemean(xv)
cachemean(xv)
print(x)
class(x)
y <- matrix(1:4,2)
mean(y)
yv <- makeVector(y)
cachemean(yv)
cachemean(yv)
