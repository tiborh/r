library(RPostgreSQL)

## loads the PostgreSQL driver
drv <- dbDriver("PostgreSQL")

## Open a connection
con <- dbConnect(drv, user="tibor", host="localhost", dbname="testdb")

## Submits a statement
rs <- dbSendQuery(con, "select * from weather")

## fetch all elements from the result set
weatherTable <- fetch(rs,n=-1)

## Submit and execute the query
citiesTable <- dbGetQuery(con, "select * from cities")

## Closes the connection
dbDisconnect(con)

## Frees all the resources on the driver
dbUnloadDriver(drv)
