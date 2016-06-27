help(Distributions)                     # for a full list
## for each:
## “d” 	returns the height of the probability density function
## “p” 	returns the cumulative density function
## “q” 	returns the inverse cumulative density function (quantiles)
## “r” 	returns randomly generated numbers

help(Normal)
## examples from help:
require(graphics)
dnorm(0) == 1/sqrt(2*pi)                # T
dnorm(1) == exp(-1/2)/sqrt(2*pi)        # T
dnorm(1) == 1/sqrt(2*pi*exp(1))         # T

help(par)
par(mfrow = c(2,1))                     # 2 below each other
plot(function(x) dnorm(x, log = TRUE), -60, 50,
     main = "log { Normal density }")
curve(log(dnorm(x)), add = TRUE, col = "red", lwd = 2)
mtext("dnorm(x, log=TRUE)", adj = 0)
mtext("log(dnorm(x))", col = "red", adj = 1)

plot(function(x) pnorm(x, log.p = TRUE), -50, 10,
     main = "log { Normal Cumulative }")
curve(log(pnorm(x)), add = TRUE, col = "red", lwd = 2)
mtext("pnorm(x, log=TRUE)", adj = 0)
mtext("log(pnorm(x))", col = "red", adj = 1)

## back to tutorial
## the height of the probability distribution at each point
dnorm(0)                                # mean of zero, sd == 1
dnorm(0)*sqrt(2*pi)
1/sqrt(2*pi)

dnorm(0,mean=4)
dnorm(0,mean=4,sd=10)
v <- 0:2
dnorm(v)
x <- seq(-20,20,by=.1)
y <- dnorm(x)
plot(x,y,main = "Normal distribution")
mtext("mean=0, sd=1", adj = 0)

y <- dnorm(x,mean=2.5,sd=0.1)
plot(x,y,main = "Normal distribution")
mtext("mean=2.5, sd=0.1", adj = 0)

y <- dnorm(x,mean=2.5,sd=5)
plot(x,y,main = "Normal distribution")
mtext("mean=2.5, sd=5", adj = 0)

## the probability that a normally distributed random number will be less than that number
# sd = 1, mean = 0
pnorm(0)                                # 0.5
pnorm(1)                                # 0.8413447
pnorm(0,mean=2)                         # 0.02275013
pnorm(0,mean=2,sd=3)                    # 0.2524925
pnorm(v)                                # 0.5000000 0.8413447 0.9772499
y <- pnorm(x)
plot(x,y,main = "Probability of Less than x at Normal Distribution")
mtext("mean=0, sd=1", adj = 0)

y <- pnorm(x,mean=3,sd=4)
plot(x,y,main = "Probability of Less than x at Normal Distribution")
mtext("mean=3, sd=4", adj = 0)

## the probability that a number is larger than the given number
pnorm(0,lower.tail=FALSE)
pnorm(1,lower.tail=FALSE)
pnorm(0,mean=2,lower.tail=FALSE)
y <- pnorm(x,lower.tail=F)
plot(x,y,main = "Probability of Larger than x at Normal Distribution")
mtext("mean=0, sd=1", adj = 0)

## inverse of pnorm, cumulative distribution matches the probability
qnorm(0.5)                              # 0
qnorm(0.5,mean=1)                       # 1
qnorm(0.5,mean=1,sd=2)                  # 1
qnorm(0.5,mean=2,sd=2)                  # 2
qnorm(0.5,mean=2,sd=4)                  # 2
qnorm(0.25,mean=2,sd=2)                 # 0.6510205
qnorm(0.333)                            # -0.4316442
qnorm(0.333,sd=3)                       # -1.294933
qnorm(0.75,mean=5,sd=2)                 # 6.34898
v = c(0.1,0.3,0.75)
qnorm(v)                                # -1.2815516 -0.5244005  0.6744898
x <- seq(0,1,by=.05)
y <- qnorm(x)
plot(x,y,main = "Cummulative Probability at Normal Distribution")
mtext("mean=0, sd=1", adj = 0)

y <- qnorm(x,mean=3,sd=2)
plot(x,y,main = "Cummulative Probability at Normal Distribution")
mtext("mean=3, sd=2", adj = 0)

y <- qnorm(x,mean=3,sd=0.1)
plot(x,y,main = "Cummulative Probability at Normal Distribution")
mtext("mean=3, sd=0.1", adj = 0)

## T, Binomial and Chi distributions are skipped

