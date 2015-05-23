library(RMySQL)
ucscDb <- dbConnect(MySQL(), user = "genome", 
                    # password="password",
                    host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;")
dbDisconnect(ucscDb)
result
