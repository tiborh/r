if (!require(weatherData)) install.packages("weatherData")
library(weatherData)
data()
str(IntlWxStations)
str(London2013)
##write.csv(London2013,file=file.path("data","London2013.csv"))
##?write.csv
if (!require(RPostgreSQL)) install.packages("RPostgreSQL")
library(RPostgreSQL)
con <- dbConnect(PostgreSQL(), user= "tibor", dbname="testdb")
dbWriteTable(con, "weather",London2013)
dbDisconnect(con)

