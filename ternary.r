a <- 1
x <- if(a==1) 1 else 2
x
x <- if(a==2) 1 else 2

## ifelse:
a <- c(1, 2, 1)

x <- ifelse(a==1, 1, 2)
x

x <- ifelse(a==2, 1, 2)
x

## vectors:
x <- sample(1:10)
y <- sample(1:10)
z <- sample(letters,10)
Z <- sample(LETTERS,10)

x
y
ifelse(x<y,z,Z)
