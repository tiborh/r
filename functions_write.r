f <- function(x) {
  if (TRUE) {
    return(x + 1)
  }
  x
}

f(2)                                    # 3
f(T)                                    # 2
f(F)                                    # 1
f(-1)                                   # 0
f(0)                                    # 1
F == 0


b <- 3                                  # variable was changed from b to c

f <- function(c = b) {                  # not a good practice to use variables from env
    c * c
}

f()


typeof(NA)                              # logical
length(NA)                              # 1

typeof(NULL)                            # NULL
length(NULL)                            # 0

NA==NA                                  # NA (even if it is logical)
NA < F                                  # NA
F + T                                   # 1
F + NA                                  # NA


## lists
l1 <- as.list(1:10)
l1
l1[1]                                   # this is still a list
l1[[1]]                                 # one element
l1[[1]] = 1:10
l1[[1]]
l1[[1]][1]                              # a single element vector
l1[[1]][[1]]

names(l1)                               # no names
names(l1) = letters[1:10]
names(l1)
l1
names(l1$a) = LETTERS[1:10]
l1
l1$a[1]                                 # still a vector
l1$a[[1]]                               # now only a value
