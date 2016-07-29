data()
library(weatherData)
str(NewYork2013)
if (!require(rattle)) install.packages("rattle")
library(rattle)
data(package="rattle")
str(weather)
tail(weather)

## explore

lunch <- read.csv("https://raw.githubusercontent.com/dfm/lunch/master/lunch.csv",stringsAsFactors=F)
class(lunch)                            # data.frame (the rest depends on this)
dim(lunch)                              # 100 8
names(lunch)                            # "completed" "name"      "address"   "category"  "distance"
                                        # "rating"   "price"     "id"
str(lunch)
head(lunch)

## clean it a little (to have a more informative summary)
lunch$completed <- as.logical(lunch$completed)
lunch$category <- factor(lunch$category)
lunch$price <- factor(lunch$price,ordered=T)

summary(lunch)

## dplyr has a different view of str() in glimpse()
library(dplyr)
glimpse(lunch)

## looking at the data
head(lunch)
tail(lunch)

## plotting:
hist(lunch$distance)
hist(lunch$rating)
price.cats <- as.integer(levels(lunch$price))
plot(lunch$rating,lunch$distance, pch=price.cats, col=price.cats+1, main="Rating vs Distance")
legend("topright",legend=price.cats,pch=price.cats,col=price.cats+1,title="Price Cat.",inset=.02)


## cleaning data:
library(tidyr)
ls(package:tidyr)

############
## gather ##
############
## cleaning up "wide data", that is, one variable in several columns
messy.df <- data.frame(col=c("X","Y"),A=c(1,4),B=c(2,5),C=c(3,6))
print(messy.df)

clean.df <- gather(messy.df,keys,vals,-col)
print(clean.df)

## alternatively
gather(messy.df,keys,vals,c(A,B,C))

############
## spread ##
############
## cleaning up "long data" by spreading to several cols
messy.df <- clean.df
print(messy.df)
clean.df <- spread(messy.df, keys, vals)
print(clean.df)

##############
## separate ##
##############
## separating one col to two when two pieces of info is contained in it

dir("data")
readLines(file.path("data","states0.csv"),5)
states <- read.csv(file.path("data","states0.csv"),stringsAsFactors=F)
source("clean_states.r")
states <- clean.states0(states)
states <- separate(states,Total.area.in.mi2..km2.,c("total.area.mi2","total.area.km2"))
states <- separate(states,Land.area.in.mi2..km2.,c("land.area.mi2","land.area.km2"))
states <- separate(states,Water.area.in.mi2..km2.,c("water.area.mi2","water.area.km2"))
for (colnum in 8:13)
    states[,colnum] <- as.numeric(states[,colnum])
str(states)
names(states)

###########
## unite ##
###########
## unite would do the opposite:
years <- data.frame(ids=letters[1:12],years=2001:2012,months=1:12,stringsAsFactors=F)
str(years)
unite(years,year.month,years,months)    # default is underscore

## common symptoms:

## column headers are values (years in two columns (from tidyr)): gather

str(table4)
gather(table4,year,val,-country)

give.names <- function(num,length=3) {
    nams <- vector("character",num)
    for (i in 1:num) {
        nam <- paste0(sample(letters,length,replace=T),collapse="")
        nam <- paste0(toupper(substring(nam,1,1)),substring(nam,2,nchar(nam)),collapse="")
        nams[i] = nam
    }
    return(nams)
}

## several variables in a single column: spread
messy.df <- data.frame(name=give.names(9),animal=sample(c("bird","dog","cat"),9,replace=T),number=sample(0:5,9,replace=T),stringsAsFactors=F)
str(messy.df)
print(messy.df)

spread(messy.df,animal,number,fill=0)

## multiple variables are in same column side by side: separate
## see states dataset above

## Single type of observational unit stored in more than one table
## Multiple types of observational units stored in same table


## outliers: are they error or part of the system?
set.seed(10)
x <- c(rnorm(30, mean=15, sd=5))

boxplot(x, horizontal=T)                # not big outliers

set.seed(10)
x <- c(rnorm(30, mean=15, sd=5),-5,28,35)

boxplot(x, horizontal=T)


df2 <- data.frame(A = rnorm(100,50,10),
                  B = c(rnorm(99,50,10), 500),
                  C = c(rnorm(99,50,18), -1)
                  )
summary(df2)                            # shows some of the outliers
hist(df2$B)                             # obrious
boxplot(df2)
