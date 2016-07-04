## presumptions:
## normal distribution
## sample mean: 5
## standard deviation: 2
## confidence level: 95%
## confidense sample: 20
## Question: confidence interval
a <- 5
s <- 2
n <- 20
error <- qnorm(0.975)*s/sqrt(n)
left <- a-error
right <- a+error
left
right
vals <- sort(rnorm(1000,mean=5,sd=2))
conf = vals[vals > left]
conf = conf[conf < right]
(length(conf)/1000)*100                 # 33.1%

plot(vals)
abline(left,0)
abline(right,0)


## same with t distribution
a <- 5
s <- 2
n <- 20
error <- qt(0.975,df=n-1)*s/sqrt(n)
left <- a-error
right <- a+error
left
right

vals <- sort(rt(1000,df=(n-1)*s/sqrt(1000),5))
max(vals)
which(vals == max(vals))                # max index of course
vals = vals[-length(vals)]
plot(vals)
abline(left,0)
abline(right,0)

conf = vals[vals > left]
conf = conf[conf < right]
(length(conf)/1000)*100                 # 20.7%
?rt

## using input file:
w1 <- read.csv(file="data/w1.dat",sep=",",head=TRUE)
str(w1)
summary(w1)
length(w1$vals)
mean(w1$vals)
sd(w1$vals)
error <- qt(0.975,df=length(w1$vals)-1)*sd(w1$vals)/sqrt(length(w1$vals))
error
left <- mean(w1$vals)-error
right <- mean(w1$vals)+error
left
right

## lesson aborted for lack of interest

