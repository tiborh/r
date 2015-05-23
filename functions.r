add2 <- function(x,y) {
    x + y                               # returns the last expression
}

above10 <- function(x) {
    use <- x > 10
    x[use]
}

test.above10 <- function() {
    i <- 0
    repeat {
        test <- c(runif(15, 0, 15))
        num.above.10 <- length(above10(test))
#        print(num.above.10)
        if(num.above.10 >=10) {
            print("Ping")
            break
        }
        i = i+1
    }
    cat("number of tests: ",i,"\n")
}

test.engine.10 <- function(n) {
    for (x in 1:n) {
        test.above10()
    }
}

test.engine.10(10)

above <- function(x,n=10) {
    use <- x > n
    x[use]
}

above(1:20,12)
above(1:20)
above(c(runif(20, 0, 15)),12)

colmean <- function(x, removeNA = T) {                # for matrices
    nc <- ncol(x)
    means <- numeric(nc)                # vector
    for(i in 1:nc) {
        means[i] <- mean(x[,i], na.rm = removeNA)
    }
    return(means)
}

mx <- matrix(1:9,3,3)
colmean(mx)

data <- read.csv(unz("dat/quiz1_data.zip", "hw1_data.csv"),header=T)
colmean(data)
colmean(data,F)
