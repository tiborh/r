library(dplyr)
if (!require(hflights)) install.packages("hflights")
library(hflights)
ls(package:hflights)
str(hflights)
summary(hflights)

## tbl is used
## conversion:
hflights <- tbl_df(hflights)
## backwards: as.data.frame()
str(hflights)
summary(hflights)
glimpse(hflights)

carriers <- hflights$UniqueCarrier
class(carriers)
is.vector(carriers)

lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", 
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", 
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", 
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

lut

## clean up the Unique Carrier column:
hflights$Carrier = lut[hflights$UniqueCarrier]
glimpse(hflights)

## previously, UC was overwritten, restore:
## hflights$Carrier = hflights$UniqueCarrier
## illut <- names(lut)
## names(illut) = lut
## hflights$UniqueCarrier = illut[hflights$UniqueCarrier]

lut2 <- c("A" = "carrier", "B" = "weather", "C" = "FFA", "D" = "security", "E" = "not cancelled")

hflights$Code <- lut2[hflights$CancellationCode] # goes very slowly
glimpse(hflights)

levels(factor(hflights$Code))
levels(factor(hflights$CancellationCode))
sum(is.na(hflights$Code))
length(which(is.na(hflights$Code)))
hflights$Code[which(is.na(hflights$Code))] = "not cancelled"
hflights$CancellationCode <- sub("","E",hflights$CancellationCode)
glimpse(hflights)

## the five verbs
## select: to remove columns
## filter: to remove rows
## arrange: to reorder rows
## mutate: to add new columns based on existing data
## summarise: to calculate summary statistics

## The verbs can be combined, also with %>%
## The verbs are made even more powerful if unleashed on clean data

## Variables are manipulated via select and mutate
## Observations are manipulated via filter and arrange
## Groups of observations are manipulated by summarise

############
## select ##
############

## Filtering for variables the following work will deal with:

hflights2 <- select(hflights,ActualElapsedTime,AirTime,ArrDelay,DepDelay)
str(hflights2)

## range can also be used:
head(select(hflights,Origin:Cancelled))
## two ranges:
head(select(hflights,Year:DayOfWeek,ArrDelay:Diverted))
## range and ind col combined:
head(select(hflights,Year:DayOfWeek,UniqueCarrier,ArrDelay:Diverted))
## range minus some elements:
head(select(hflights,Year:AirTime,-c(DayOfWeek,TailNum)))

## Search expressions:
##    starts_with("X"): every name that starts with "X",
##    ends_with("X"): every name that ends with "X",
##    contains("X"): every name that contains "X",
##    matches("X"): every name that matches "X", where "X" can be a regular expression,
##    num_range("x", 1:5): the variables named x01, x02, x03, x04 and x05,
##    one_of(x): every name that appears in x, which should be a character vector.

head(select(hflights,ends_with("Delay")))
head(select(hflights,UniqueCarrier,ends_with("Num"),starts_with("Cancell")))
head(select(hflights,ends_with("Time"),ends_with("Delay")))

############
## mutate ##
############

cuboid <- data.frame(length=sample(1:5), width=sample(1:5), height=sample(1:5))
print(cuboid)
cuboid <- mutate(cuboid,volume=length*width*height)

hflights2 <- mutate(hflights2, timeLoss= ArrDelay - DepDelay)
hist(hflights2$timeLoss)

g1 <- mutate(hflights2, ActualGroundTime=ActualElapsedTime-AirTime)
g2 <- mutate(hflights, GroundTime=TaxiIn+TaxiOut)
g3 <- mutate(hflights, AverageSpeed=60*Distance/AirTime)

## combined:
g3 <- mutate(hflights, ActualGroundTime=ActualElapsedTime-AirTime,
             GroundTime=TaxiIn+TaxiOut,
             AverageSpeed=60*Distance/AirTime)

str(g3)
