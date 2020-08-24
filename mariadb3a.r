#!/usr/bin/env Rscript

source("mariadb_common.r")

fetch.values <- function(res,val.vect) {
    for(val in val.vect) {
        dbBind(res,list(val))

        cat("First five results with",paste0(val,":\n"))
        df <- dbFetch(res,n=5)
        print(df)
    }
}

db.name <- "test"
con <- connect_to_db(db.name)

if(length(dbListTables) != 0)
    cleanup.db(con)

cat("1. write mtcars to table:\n")
dbWriteTable(con, "mtcars", mtcars,row.names=T)
cat("when read back with dbReadTable:\n")
print(str(dbReadTable(con, "mtcars")))

## for interactive use: dbGetQuery()
cat("Sending query:\n")
res <- dbSendQuery(con, "select row_names,mpg,hp from mtcars where cyl=?")
print(str(res))
fetch.values(res,c(4,6,8))

dbClearResult(res)                      # breaking the query connection

cleanup.db(con)                         # remove tables from database
dbDisconnect(con)
