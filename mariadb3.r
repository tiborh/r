#!/usr/bin/env Rscript

source("mariadb_common.r")

db.name <- "test"
con <- connect_to_db(db.name)

if(length(dbListTables) != 0)
    cleanup.db(con)

cat("1. write mtcars to table:\n")
dbWriteTable(con, "mtcars", mtcars)
cat("when read back with dbReadTable:\n")
print(str(dbReadTable(con, "mtcars")))

## for interactive use: dbGetQuery()
cat("Sending query:\n")
res <- dbSendQuery(con, "select mpg,hp from mtcars where cyl=6")
print(str(res))

cat("First five results with dbFetch:\n")
df <- dbFetch(res,n=5)
print(df)

dbClearResult(res)                      # breaking the query connection

cleanup.db(con)                         # remove tables from database
dbDisconnect(con)
