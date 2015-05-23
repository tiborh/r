## if/else

Sys.time()
Sys.Date()

## traditional way (placement of {} and 'else' is also important, same row):
if (Sys.Date() > "2014-12-31")
    {
        print("Alas, 2014 has passed.")
    } else {
        print("Good. Still time to go.")
    }

## with assignment

x <- if (Sys.Date() > "2014-12-31")
    {
        "Alas, 2014 has passed."
    } else {
        "Good. Still time to go."
    }
print(x)

## for loop

i <- c(1:6)
print(i)
#seq_along(i)                              # can be used as a loop variable

## different ways:

for (i in 1:10) {
    print(i)
}

for (i in 1:10) print(i+i)

for (i in seq_along(i)) print(i*i)      # needs to reinitialised before each repeated use

x <- c("a","b","c","d","e")
for (letter in x) print(letter)

for (j in 1:length(x)) print(x[j])

## nested loops

x <- matrix(1:6,2,3)
print(x)
nrow(x)
ncol(x)

for(i in seq_len(nrow(x))) {
    for(j in seq_len(ncol(x))) {
        print(x[i,j]-1)
    }
}

## while

z <- 5
while(z >= 3 && z <= 10) {
    coin <- rbinom(1, 1, 0.5)           # rbinom(number_generated,size_of_range,prob)
    cat("z: ",z," coin: ",coin,"\n")
    if(coin == 1) { ## random walk
        z <- z + 1
    } else {
        z <- z - 1
    }
}
# https://stat.ethz.ch/R-manual/R-patched/library/stats/html/Binomial.html

## repeat

x0 <- 1
tol <- 1e6
repeat {
    if(x0 >= tol) {
        break
    } else {
        x0 = x0+1
        next
    }
    print("never prints")
}
print(x0)
