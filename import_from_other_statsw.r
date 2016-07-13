## packages:

## haven (under development)
if (!require(haven)) install.packages("haven")
library(haven)
ls(package:haven)                       # 13 functions at the moment: SAS, STATA, SPSS

## sas samples: http://www.principlesofeconometrics.com/sas.htm
airline <- read_sas(b7dat="http://www.principlesofeconometrics.com/sas/airline.sas7bdat")
str(airline)
head(airline)
tail(airline)

sas.zip.fn <- file.path("data","sas.zip")
download.file(url="http://www.principlesofeconometrics.com/zip_files/sas.zip",destfile=sas.zip.fn)
list.of.sas <- unzip(sas.zip.fn,list=T)
str(list.of.sas)
print(list.of.sas)

temp = tempfile()
temp <- unz(sas.zip.fn,"olympics.sas7bdat",open="r")
## olympics <- read_sas(unz(sas.zip.fn,"olympics.sas7bdat",open="r")) # read_sas cannot handle this
## read_sas(temp) # read_sas cannot handle this either
unlink(temp)
olympics.fn = "olympics.sas7bdat"
unzip(sas.zip.fn,olympics.fn)
olympics <- read_sas(olympics.fn)
str(olympics)
head(olympics)
tail(olympics)
unlink(olympics.fn)

## stata examples: http://www.stata.com/links/examples-and-datasets/
dta.ex = read_dta("http://www.ats.ucla.edu/stat/stata/examples/greene/TBL5-1.DTA")
str(dta.ex)
summary(dta.ex)
tail(dta.ex)

## datacamp example:
sugar <- read_dta("http://assets.datacamp.com/course/importing_data_into_r/trade.dta")
str(sugar)
head(sugar)
## see the decoding of Date:
sugar$Date                              # it is in the labels
sugar$Date <- as.Date(as_factor(sugar$Date))
str(sugar)
head(sugar)
plot(Import ~ Weight_I, data = sugar)

## SPSS sample data: http://calcnet.mth.cmich.edu/org/spss/Prjs_DataSets.htm
air.pass <- read_spss("http://calcnet.mth.cmich.edu/org/spss/V16_materials/DataSets_v16/airline_passengers.sav")
str(air.pass)
sup.markt <- read_spss("http://calcnet.mth.cmich.edu/org/spss/V16_materials/DataSets_v16/supermarket.sav")
str(sup.markt)
print(sup.markt)
## .por files are also possible

## from datacamp example:
work <- read_sav("http://assets.datacamp.com/course/importing_data_into_r/employee.sav")
str(work)
head(work)
summary(work$GENDER)
work$GENDER <- as.factor(work$GENDER)
## now summary works fine
## this one also works:
work$GENDER <- as_factor(work$GENDER)

## foreign (can be considered as mature), more formats are supported
if (!require(foreign)) install.packages("foreign")
library(foreign)
ls(package:foreign)                     # 17 functions, more formats than haven, writing is also possible

## SAS: only libraries .xport are handled

## dta
sugar <- read.dta("http://assets.datacamp.com/course/importing_data_into_r/trade.dta")
str(sugar)
sugar$Date <- as.Date(sugar$Date)       # automatic factoring, date conversion did not work when reading data

work <- read.spss("http://assets.datacamp.com/course/importing_data_into_r/employee.sav") # error
sup.markt <- read.spss("http://calcnet.mth.cmich.edu/org/spss/V16_materials/DataSets_v16/supermarket.sav") # a list is resulted
str(sup.markt)
head(sup.markt)
sup.markt <- read.spss("http://calcnet.mth.cmich.edu/org/spss/V16_materials/DataSets_v16/supermarket.sav",to.data.frame=T)

