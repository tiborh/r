if (!require(weatherData)) install.packages("weatherData")
library(weatherData)
if (!require(maps)) install.packages("maps")
library(maps)
data()

str(IntlWxStations)
str(London2013)
str(world.cities)
##write.csv(London2013,file=file.path("data","London2013.csv"))
##?write.csv
if (!require(RPostgreSQL)) install.packages("RPostgreSQL")
library(RPostgreSQL)
con <- dbConnect(PostgreSQL(), user= "tibor", dbname="testdb")
dbWriteTable(con, "weather",London2013)
dbWriteTable(con, "cities",world.cities)
dbDisconnect(con)

