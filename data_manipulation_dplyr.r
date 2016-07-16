library(dplyr)
ls(package:dplyr)
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

## other tbl formats:
## tbl_dt for data tables
## tbl for database

library(data.table)
hflights2 <- as.data.table(hflights)
str(hflights2)

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
hflights$CancellationCode <- sub("^$","E",hflights$CancellationCode)
hflights$Code <- lut2[hflights$CancellationCode]
glimpse(hflights)
levels(factor(hflights$Code))
levels(factor(hflights$CancellationCode))
#sum(is.na(hflights$Code))
#length(which(is.na(hflights$Code)))
#hflights$Code[which(is.na(hflights$Code))] = "not cancelled"

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

############
## filter ##
############

canc <- select(hflights,starts_with("Cancel"))
names(canc)
canc$CancReason <- hflights$Code
str(canc)

canc <- filter(canc,Cancelled==1)
str(canc)

## the following operators are possible:

##  x < y, TRUE if x is less than y
##  x <= y, TRUE if x is less than or equal to y
##  x == y, TRUE if x equals y
##  x != y, TRUE if x does not equal y
##  x >= y, TRUE if x is greater than or equal to y
##  x > y, TRUE if x is greater than y
##  x %in% c(a, b, c), TRUE if x is in the vector c(a, b, c)

filter(hflights,Carrier %in% c("JetBlue","Southwest","Delta"))
select(filter(hflights,AirTime < TaxiIn + TaxiOut),FlightNum,ActualElapsedTime,AirTime,TaxiIn,TaxiOut)

## multiple conditions:
filter(hflights,DepTime < 500 | ArrTime > 2200) # early or late planes
select(filter(hflights,ArrDelay < 0,DepDelay > 0),FlightNum,DepTime,ArrTime,ArrDelay,DepDelay)      # started with delay, but arrived early
select(filter(hflights,Cancelled==1,DepDelay>0),FlightNum,DepDelay,Code) # cancelled after delay

## paste

select(mutate(hflights,Date=paste(Year,Month,DayofMonth,sep="-")),Date,DepTime,ArrTime,UniqueCarrier)

## series of operations
hflights %>%
    filter(Dest=="JFK") %>%
    mutate(Date=paste(Year,Month,DayofMonth,sep="-")) %>%
    select(Date,DepTime,ArrTime,TailNum)

## Complex question:
## How many weekend flights flew a distance of more than 1000 miles but had a total taxiing time below 15 minutes?

## weekend: Day 6 & 7
## Distance > 1000
## TaxiOut + TaxiIn < 15

filter(hflights,DayOfWeek %in% c(6,7),Distance > 1000,TaxiOut + TaxiIn < 15)

#############
## arrange ##
#############

nums <- data.frame(one=sample(1:10,10,replace=T),two=sample(1:10,10,replace=T),three=sample(1:10,10,replace=T))
nums <- tbl_df(nums)
arrange(nums,one,two,three)
## descending order:
arrange(nums,desc(one),desc(two),desc(three))
## arranging by sum
mutate(arrange(nums,one+two+three),sum=one+two+three)


## recap task:
## What steps do you take to print a only the _TailNum_ of hflights, only for flights that _departed too late_, _sorted by total taxiing time_?

## list:
##   select for TailNum (should be the last step, as the other two would be impossible otherwise)
##   filter for DepTime > 0 (good if first as it reduces the load on the following one)
##   arrange by TaxiOut + TaxiIn (conclusion, this is the second operation)

hflights %>%
    filter(DepTime > 0) %>%
    arrange(TaxiOut + TaxiIn) %>%
    select(TailNum)


###############
## summarise ##
###############

summarise(nums,sumOne=sum(one),avgTwo=mean(two),varThree=var(three))
summarise(nums,minOne=min(one),maxOne=max(one),meanOfSums=mean(one+two+three),medOfSums=median(one+two+three))
## min and max distance:
summarise(hflights,min_dist=min(Distance),max_dist=max(Distance))
## max diverted distance:
hflights %>% filter(Diverted==1) %>% summarise(max_div=max(Distance))

## functions that can be used:

##    min(x) - minimum value of vector x.
##    max(x) - maximum value of vector x.
##    mean(x) - mean value of vector x.
##    median(x) - median value of vector x.
##    quantile(x, p) - pth quantile of vector x.
##    sd(x) - standard deviation of vector x.
##    var(x) - variance of vector x.
##    IQR(x) - Inter Quartile Range (IQR) of vector x.
##    diff(range(x)) - total range of vector x.

v1 <- sample(0:100,50,replace=T)
range(v1)                               # if 0 100
diff(range(v1))                         # 100
quantile(v1,1)                          # 100
quantile(v1,0)                          # 0
quantile(v1,0.5)                        # around 50
IQR(v1)

## summary functions provided by dplyr:

##    first(x) - The first element of vector x.
##    last(x) - The last element of vector x.
##    nth(x, n) - The nth element of vector x.
##    n() - The number of rows in the data.frame or group of observations that summarise() describes.
##    n_distinct(x) - The number of unique values in vector x.
first(v1)                               # v1[1]
last(v1)                                # v1[length(v1)]
nth(v1,25)                              # v1[25]
df <- data.frame(v1=v1)
df <- tbl_df(df)
summarise(df,numOfElems=n(),numOfDistinctElems=n_distinct(v1))

## number of flights, carriers, and destinations
summarise(hflights,n_obs=n(),n_carrier=n_distinct(UniqueCarrier),n_dest=n_distinct(Dest))

## number of flights, cancellations, and average delay, average nu of delays with All American
hflights %>%
    filter(UniqueCarrier == "AA") %>%
    summarise(n_flights=n(),n_canc=sum(Cancelled==1),avg_delay=mean(ArrDelay,na.rm=T)) %>%
    mutate(percDelayed=100*(n_canc/n_flights))

## pipe %>% is included in package magrittr
library(magrittr)
ls(package:magrittr)                    # quite a number of functions

## average difference between taxi in and taxi out:
hflights %>%
    mutate(diff=TaxiOut-TaxiIn) %>%
    filter(!is.na(diff)) %>%
    summarise(avgOutInDiff=mean(diff))

## Some statistics about Destinations and Distances where plane is better option than car
hflights %>%
    mutate(RealTime=ActualElapsedTime+100) %>%
    mutate(mph=60*Distance/RealTime) %>%
    filter(!is.na(mph),mph>=70) %>%
    summarise(n_less=n(),n_dest=n_distinct(Dest),min_dist=min(Distance),max_dist=max(Distance))

## Get statistics for where Train may be a better option (if not intercontinental, of course):
hflights %>% 
    mutate(RealTime = ActualElapsedTime + 100, mph = Distance / RealTime * 60) %>%
    filter(mph<105 | Cancelled==1 | Diverted==1) %>%
    summarise(n_non=n(),n_dest=n_distinct(Dest),min_dist=min(Distance),max_dist=max(Distance))

## Count the number of overnight flights
hflights %>%
    filter(!is.na(DepTime),!is.na(ArrTime),DepTime > ArrTime) %>%
    summarise(num=n())


##############
## group_by ##
##############

## for summary operations on groups

hflights %>%
    group_by(Carrier) %>%
    summarise(avgDepDel = mean(DepDelay, na.rm=T),
              avgArrDel = mean(ArrDelay, na.rm=T)) %>%
    arrange(avgArrDel,avgDepDel)


## multiple grouping (number of summarise's needs to match number of groups):

hflights %>%
    group_by(Carrier,Dest) %>%
    summarise(nflights = n()) %>%
    summarise(ndests = n())

## ratio of cancellations and average delay by carrier:
hflights %>%
    group_by(Carrier) %>%
    summarise(n_flights=n(),n_canc=sum(Cancelled==1),perc_canc=100*n_canc/n(),avg_delay=mean(ArrDelay,na.rm=T)) %>%
    arrange(avg_delay,perc_canc)

## useful function:

##     rank() for inner group rankings

v2 <- sample(1:100,5)
print(v2)
rank(v2)

## what's the carrier ranking for Arrival Delays?

hflights %>%
    filter(!is.na(ArrDelay),ArrDelay>0) %>%
    group_by(Carrier) %>%
    summarise(avg=mean(ArrDelay)) %>%
    mutate(rank=rank(avg)) %>%
    arrange(rank)

## How many airplanes only flew to one destination?
hflights %>%
    group_by(TailNum) %>%
    summarise(nu_dests=n_distinct(Dest)) %>%
    filter(nu_dests==1) %>%
    summarise(nplanes=n())

## Find the most visited destination for each carrier

## lists Carrier, Destination, and number of visits
hflights %>%
    group_by(Carrier,Dest) %>%
    summarise(nuOfVisits=n()) #%>%
##  arrange(Carrier,desc(dest))
##  filter(dest==max(dest))


## lists Carrier and nu of destinations
hflights %>%
    group_by(Carrier) %>%
    summarise(nuOfDests=n_distinct(Dest)) #%>%
##  arrange(Carrier)

## Most visited destination for each carrier
hflights %>%
    group_by(Carrier,Dest) %>%
    summarise(nuOfVisits=n()) %>%
    mutate(rank=rank(desc(nuOfVisits))) %>%
    filter(rank==min(rank)) %>%
    select(-rank)


## Database connection (data is not downloaded as whole, only what is needed, processing going on in the database):
my_db <- src_mysql(dbname = "dplyr", 
                   host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                   port = 3306, 
                   user = "student",
                   password = "datacamp")

nycflights <- tbl(my_db, "dplyr")

glimpse(nycflights)
save(nycflights,file=file.path("data","nycflights"))

nycflights %>%
    group_by(carrier) %>%
    summarise(n_flights=n(),avg_delay=mean(arr_delay)) %>%
    arrange(avg_delay)

rm(my_db)

