smokerData <- read.csv(file='data/smoker.csv',sep=',',header=T)
summary(smokerData)
str(smokerData)

## creating the table:
smoke <- table(smokerData$Smoke,smokerData$SES)
smoke
plot(smoke,col=c(2,3,4),main="Smoking by Socioeconomic Status") # defaults to mosaicplot
barplot(smoke,legend=T,col=c(2,3,4),main="Smoking by Socioeconomic Status")

## creating the same manually:
smoke <- matrix(c(51,43,22,92,28,21,68,22,9),ncol=3,byrow=TRUE)
colnames(smoke) <- c("High","Low","Middle")
rownames(smoke) <- c("current","former","never")
str(smoke)
## num [1:3, 1:3] 51 92 68 43 28 22 22 21 9
##  - attr(*, "dimnames")=List of 2
##   ..$ : chr [1:3] "current" "former" "never"
##   ..$ : chr [1:3] "High" "Low" "Middle"
smoke <- as.table(smoke)
smoke
str(smoke)
## table [1:3, 1:3] 51 92 68 43 28 22 22 21 9
## - attr(*, "dimnames")=List of 2
##  ..$ : chr [1:3] "current" "former" "never"
##  ..$ : chr [1:3] "High" "Low" "Middle"

## tools for working with tables:
## marginal distribution:
margin.table(smoke)                     # all
margin.table(smoke,1)                   # rows
margin.table(smoke,2)                   # cols
sum(smoke)
apply(smoke,1,sum)
apply(smoke,2,sum)

smoke/margin.table(smoke)
margin.table(smoke,1)/margin.table(smoke)
margin.table(smoke,2)/margin.table(smoke)

## same with prop(ortions)
prop.table(smoke)
prop.table(smoke,1)                     # margin.table(smoke,1) is used
prop.table(smoke,2)

summary(smoke)

## manual calculation:
expected <- as.array(margin.table(smoke,1)) %*% t(as.array(margin.table(smoke,2))) / margin.table(smoke)
expected

chi <- sum((expected - as.array(smoke))^2/expected)
chi                                     # same as in the summary()

pval <- 1-pchisq(chi,df=4)
pval

## graphical views:
c <- c(2,3,4)
par(mfrow=c(2,2))
mosaicplot(smoke,main="Smokers",col=c,xlab="Status",ylab="Economic Class")
mosaicplot(smoke,dir=c("h","v"),col=c,main="changed orientation")
mosaicplot(smoke,sort=c(2,1),col=c,main="which decides the proportions?")
barplot(smoke,legend=T,col=c,main="Smoking by Socioeconomic Status")
par(mfrow=c(1,1))
