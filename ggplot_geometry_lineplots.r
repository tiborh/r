library(ggplot2)
library(MASS)
str(beav1)
str(beav2)

clean.the.beaver <- function(inbeav) {
    library(tidyr)
    ##ls(package:tidyr)
    beaver <- beav1
    beaver$year <- 1990L
    beaver <- unite(beaver,year.day,year,day)
    library(stringr)
    beaver$timestr <- str_pad(beaver$time,4,pad="0")
    beaver$timestr <- sub("(\\d{2})(\\d{2})","\\1_\\2",beaver$timestr,perl=T)
    beaver <- unite(beaver,year.day.time,year.day,timestr)
    #beaver$date = as.Date(beaver$year.day, "%Y_%j")
    beaver$datetime = strptime(beaver$year.day.time, "%Y_%j_%H_%M")
    beaver = beaver[-1:-2]
    beaver$activ = factor(beaver$activ)
    beaver <- rename(beaver,c("datetime"="time")) # from plyr
    beaver <- rename(beaver,c("activ"="active"))
    return(beaver)
}

beaver1 = clean.the.beaver(beav1)
beaver2 = clean.the.beaver(beav2)

beaver1$active
beaver2$active
beaver2$time
beaver1[beaver1$temp>36.88 & beaver1$temp < 36.92,]
beaver1$active[49:length(beaver1$active)] = 1

ggplot(beaver1, aes(x = time, y = temp)) + geom_line() # basic plot
ggplot(beaver1, aes(x = time, y = temp,col=active)) + geom_line() # active or not, works only if active till the end

## if (!require(COUNT)) install.packages("COUNT")
## library(COUNT)
## detach("package:COUNT", unload=T)
## data(fishing)
## str(fishing)
## names(fishing)

## if (!require(Ecdat)) install.packages("Ecdat")
## library(Ecdat)
## detach("package:Ecdat", unload=T)
## data(Fishing)
## str(Fishing)
## names(Fishing)

## if (!require(rrcov)) install.packages("rrcov")
## library(rrcov)
## data(fish)
## str(fish)
## Fish <- fish
## Fish$Species = factor(Fish$Species)
## str(Fish)

fish.fn = file.path("data","ICESCatchDataset2006-2014.csv")
fish.catches <- read.csv(fish.fn)
dim(fish.catches)
names(fish.catches)
tail(fish.catches)
fish.catches <- fish.catches[-c(14:25)]
fish.catches <- fish.catches[-49182,]
str(fish.catches)
library(tidyr)
fish.dat <- gather(fish.catches,year,capture,-c(1:4))
fish.dat$year <- sub("X","",fish.dat$year)
##fish.dat$year <- factor(fish.dat$year)
fish.dat$year <- as.integer(fish.dat$year)
str(fish.dat)

## fish.pool <- sample(levels(fish.dat$Species),10)
## fish.pool
## library(dplyr)
## fish.subset <- filter(fish.dat,Species %in% fish.pool)
## str(fish.subset)

fish.sum <- summarise(group_by(fish.dat, Species, year), sum(capture))
names(fish.sum) = c("Species","Year","SumCap")
str(fish.sum)
head(fish.sum)
fish.filt <- filter(fish.sum,SumCap!=0)
str(fish.filt)
head(fish.filt)
tail(fish.filt)
fish.years <- summarise(fish.filt,count(Year))
fish.filt2 <- as.data.frame(fish.filt)
str(fish.filt2)
fish.nyears <- summarise(group_by(fish.filt2,Species),n())
names(fish.nyears) = c("Species","N")
str(fish.nyears)
fish.pool <- fish.nyears$Species[fish.nyears$N==9]
length(fish.pool)
fish.sample <- sample(fish.pool,7)
fish.subset <- filter(fish.dat,Species %in% fish.sample)
fish.subset$Species = factor(fish.subset$Species)
fish.subset$Country = factor(fish.subset$Country)
fish.subset$Area = factor(fish.subset$Area)
str(fish.subset)
fish.sum <- summarise(group_by(fish.subset, Species, year), sum(capture))
names(fish.sum) = c("Species","Year","SumCap")
str(fish.sum)

ggplot(fish.subset,aes(year,capture,linetype=Species)) + geom_line()
ggplot(fish.sum,aes(Year,SumCap,linetype=Species)) + geom_line()
ggplot(fish.sum,aes(Year,SumCap,color=Species)) + geom_line() # easier to see
ggplot(fish.sum,aes(Year,SumCap,fill=Species)) + geom_area() # easier to see
ggplot(fish.sum,aes(Year,SumCap,fill=Species)) + geom_area(position="fill")
ggplot(fish.sum,aes(Year,SumCap,fill=Species)) +
    geom_ribbon(aes(ymax=SumCap, ymin=0), alpha=0.3)

data(salmon)
str(salmon)
