## data definition:
x <- rnorm(10,sd=5,mean=20)
y <- 2.5*x - 1.0 + rnorm(10,sd=9,mean=0)
plot(x,y,main="Sample plot")
c <- cor(x,y)
messagetext <- paste("correlation:",c)
mtext(messagetext, adj = 0)

## adding points to graph
help(runif)                             # uniform distribution
x1 <- runif(8,15,25)
y1 <- 2.5*x1 - 1.0 + runif(8,-6,6)
points(x1,y1,col=2)

x2 <- runif(8,15,25)
y2 <- 2.5*x2 - 1.0 + runif(8,-6,6)
points(x2,y2,col=3,pch=2)

## using manual legend:
plot(x,y,xlab="Independent",ylab="Dependent",main="Random Stuff")
points(x1,y1,col=2,pch=3)
points(x2,y2,col=4,pch=5)
legend(16,85,c("Original","one","two"),col=c(1,2,4),pch=c(1,3,5))

## some more points
x3 <- runif(8,15,25)
y3 <- 2.5*x3 - 1.0 + runif(8,-6,6)
points(x3,y3,col=3,pch=2)

## another attempt:
plot(x,y,xlab="Independent",ylab="Dependent",main="Random Stuff")
points(x1,y1,col=2,pch=3)
points(x2,y2,col=4,pch=5)
legend(16,85,c("Original","one","two"),col=c(1,2,4),pch=c(1,3,5))

## changing the limits
plot(x,y,xlab="Independent",ylab="Dependent",main="Random Stuff",xlim=c(0,30),ylim=c(0,100))
points(x1,y1,col=2,pch=3)
points(x2,y2,col=4,pch=5)
legend(14,90,c("Original","one","two"),col=c(1,2,4),pch=c(1,3,5))

## error bars
plot(x,y,xlab="Independent",ylab="Dependent",main="Random Stuff")
xHigh <- x
yHigh <- y + abs(rnorm(10,sd=3.5))
xLow <- x
yLow <- y - abs(rnorm(10,sd=3.1))
help(arrows)
arrows(xHigh,yHigh,xLow,yLow,col=2,angle=90,length=0.1,code=3) # arrows with 90 degree shafts

## adding noise (jitter)
help(rhyper)
numberWhite <- rhyper(400,4,5,3)        # hypergeometric distribution
head(numberWhite)
numberChipped <- rhyper(400,2,7,3)
head(numberChipped)
par(mfrow=c(1,2))
plot(numberWhite,numberChipped,xlab="Number White Marbles Drawn",
     ylab="Number Chipped Marbles Drawn",main="Pulling Marbles")
plot(jitter(numberWhite),jitter(numberChipped),xlab="Number White Marbles Drawn",
     ylab="Number Chipped Marbles Drawn",main="Pulling Marbles With Jitter")


## multiple graphs
par(mfrow=c(2,3))
boxplot(numberWhite,main="first plot")
boxplot(numberChipped,main="second plot")
plot(jitter(numberWhite),jitter(numberChipped),xlab="Number White Marbles Drawn",
     ylab="Number Chipped Marbles Drawn",main="Pulling Marbles With Jitter")
hist(numberWhite,main="fourth plot")
hist(numberChipped,main="fifth plot")
mosaicplot(table(numberWhite,numberChipped),main="sixth plot")

## Density plots
par(mfrow=c(1,1))
numberWhite <- rhyper(30,4,5,3)
numberChipped <- rhyper(30,2,7,3)
plot(numberWhite,numberChipped)
smoothScatter(numberWhite,numberChipped,
              xlab="White Marbles",ylab="Chipped Marbles",main="Drawing Marbles")
grid(3,3)

## Pair Relationships
uData <- rnorm(20)
vData <- rnorm(20,mean=5)
wData <- uData + 2*vData + rnorm(20,sd=0.5)
xData <- -2*uData+rnorm(20,sd=0.1)
yData <- 3*vData+rnorm(20,sd=2.5)
d <- data.frame(u=uData,v=vData,w=wData,x=xData,y=yData)
pairs(d)

## Shaded regions
## a blue square:
x = c(-1,1,1,-1,-1)
y = c(-1,-1,1,1,-1)
plot(x,y)
polygon(x,y,col='blue')

## something more sophisticated:
stdDev <- 0.75;
x <- seq(-5,5,by=0.01)
y <- dnorm(x,sd=stdDev)
right <- qnorm(0.95,sd=stdDev)
plot(x,y,type="l",xaxt="n",ylab="p",
     xlab=expression(paste('Assumed Distribution of ',bar(x))),
     axes=FALSE,ylim=c(0,max(y)*1.05),xlim=c(min(x),max(x)),
     frame.plot=FALSE)
axis(1,at=c(-5,right,0,5),
     pos = c(0,0),
     labels=c(expression(' '),expression(bar(x)[cr]),expression(mu[0]),expression(' ')))
axis(2)
xReject <- seq(right,5,by=0.01)
yReject <- dnorm(xReject,sd=stdDev)
polygon(c(xReject,xReject[length(xReject)],xReject[1]),
        c(yReject,0, 0), col='red')

## plotting a surface
x <- seq(0,2*pi,by=pi/100)
y <- x
xg <- (x*0+1) %*% t(y)
yg <- (x) %*% t(y*0+1)
f <- sin(xg+yg)
persp(x,y,f,theta=-10,phi=40)

## Bar plot
numberWhite <- rhyper(30,4,5,3)
numberChipped <- rhyper(30,2,7,3)

numberWhite <- as.factor(numberWhite)
plot(numberWhite)
title("Frequency of Factors",xlab="factors",ylab="frequency")

totals <- table(numberWhite)
totals
barplot(totals,main="Number Draws",ylab="Frequency",xlab="Draws")

## names to bars
rownames(totals) <- c("none","one","two","three")
barplot(totals,main="Number Draws",ylab="Frequency",xlab="Draws")

## decreasing order:
barplot(sort(totals,decreasing=TRUE),main="Number Draws",ylab="Frequency",xlab="Draws")

sort(totals,decreasing=TRUE)            # sorted order
totals[c(3,1,4,2)]                      # arbitrary order
barplot(totals[c(3,1,4,2)])

## accumulative addition
xLoc = barplot(sort(totals,decreasing=TRUE),main="Number Draws",
               ylab="Frequency",xlab="Draws",ylim=c(0,sum(totals)+2))
points(xLoc,cumsum(sort(totals,decreasing=TRUE)),type='p',col=2)
points(xLoc,cumsum(sort(totals,decreasing=TRUE)),type='l')

## Mosaic plot
santa <- data.frame(belief=c('no belief','no belief','no belief','no belief',
                             'belief','belief','belief','belief',
                             'belief','belief','no belief','no belief',
                             'belief','belief','no belief','no belief'),
                    sibling=c('older brother','older brother','older brother','older sister',
                              'no older sibling','no older sibling','no older sibling','older sister',
                              'older brother','older sister','older brother','older sister',
                              'no older sibling','older sister','older brother','no older sibling')
                    )
print(santa)
summary(santa)
## simple plots:
plot(santa$belief)
plot(santa$sibling)
## stacked plot
plot(santa$sibling,santa$belief,xlab="",ylab="")
plot(santa$belief,santa$sibling,xlab="",ylab="")
title("Belief in Santa")

totals = table(santa$belief,santa$sibling)
totals
theTitle <- "Older Brothers are Spoilers"
mosaicplot(totals,main=theTitle,
           xlab="Belief in Santa Claus",ylab="Older Sibling")

## giving it some colour:
mosaicplot(totals,main=theTitle,
           xlab="Belief in Santa Claus",ylab="Older Sibling",
           col=c(2,3,4))

## making it better-looking:
rownames(totals)
colnames(totals)
rownames(totals) <- c("Believes","Does not Believe")
colnames(totals) <- c("No Older","Older Brother","Older Sister")
totals
mosaicplot(totals,main="Older Brothers Spoil the Belief",
           xlab="Belief in Santa Claus",ylab="Older Sibling",
           col=c(2,3,4))
totals[c(2,1),c(2,3,1)]

## rearranging:
mosaicplot(totals[c(2,1),c(2,3,1)],main=theTitle,
           xlab="Belief in Santa Claus",ylab="Older Sibling",col=c(2,3,4))

mosaicplot(t(totals),main=theTitle,
       ylab="Belief in Santa Claus",xlab="Older Sibling",col=c(2,3))


## multiple representations in one plot:
x = rexp(20,rate=4)
hist(x,ylim=c(0,18),main="This Are An Histogram",xlab="X")
boxplot(x,at=16,horizontal=TRUE,add=TRUE)
help(rug)
rug(x,side=1)
d = density(x)
points(d,type='l',col=3)

## multiple windows
dev.new()
dev.new()
dev.new()
dev.list()

dev.set(3)
x = rnorm(20)
hist(x)
dev.set(2)
boxplot(x)
dev.set(4)
qqnorm(x)
qqline(x)
dev.next()
dev.set(dev.next())
plot(density(x))

## print to file
x = rnorm(100)
hist(x)
dev.print(device=png,width=200,"img/hist.png")
help(device)                            # to see available graphic devices

## another way:
png(file="img/hist.png")
hist(x)
rug(x,side=1)
dev.off()

## annotation and formatting

## custom axes
x <- rnorm(10,mean=0,sd=4)
y <- 3*x-1+rnorm(10,mean=0,sd=2)
summary(x)
summary(y)
plot(x,y,axes=FALSE,col=2)
axis(1,pos=c(0,0),at=seq(-7,5,by=1))
axis(2,pos=c(0,0),at=seq(-18,11,by=2))

## using a different box
x <- rnorm(10,mean=0,sd=4)
y <- 3*x-1+rnorm(10,mean=0,sd=2)
plot(x,y,bty="7")
plot(x,y,bty="n")
box(lty=3)

## gray plot, huge margins
help(par)
par(bty="l")                            # left and bottom like L
par(bg="gray")
par(mex=2)                              # character size expansion factor, whatever that is
x <- rnorm(10,mean=0,sd=4)
y <- 3*x-1+rnorm(10,mean=0,sd=2)
plot(x,y)

## adding text
par(bty="o")
par(bg="white")
par(mex=1)
x <- rnorm(10,mean=0,sd=4)
y <- 3*x-1+rnorm(10,mean=0,sd=2)
plot(x,y)
text(-1,-2,"numbers!")

## not to cut off chars outside plot area
x <- rnorm(10,mean=0,sd=4)
y <- 3*x-1+rnorm(10,mean=0,sd=2)
plot(x,y)
text(-7,-2,"outside the area",xpd=T)
help(text)                              # no xpd
??xpd                                   # not much clue
