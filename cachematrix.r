## The functions do nothing else than the example
## makeVector and cachemean functions (which actually also work for matrices
## the only difference is that all "mean" have been replaced with "inverse"
## and one case of "solve" (ln 35)

## caching does not work directly on matrices
## a special cacheMatrix is needed for that purpose

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## cacheSolve, when called upon a cacheMatrix first,
## it creates the cached invert matrix which is retrieved
## at every further call

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    return(m)
}

## used for testing
## y <- matrix(1:4,2)
## solve(y)
## cy <- makeCacheMatrix(y)
## print(cy)
## cacheSolve(cy)
## cacheSolve(cy)
