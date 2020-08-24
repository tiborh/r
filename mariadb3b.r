#!/usr/bin/env Rscript

source("mariadb_common.r")

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
df <- send.query(con, "show columns from mtcars")
cat("Table structure:\n")
print(df)
print(str(df))
row.names.type <- subset(df,Field=="row_names",select="Type")[1,1]
cat("The type of row_names:",row.names.type,"\n")

df1 <- send.query(con,paste("alter table mtcars change column row_names car",row.names.type),fetch.res=F)

df2 <- send.query(con,"select * from mtcars limit 5")

cat("After alter table:\n")
print(df2)

cleanup.db(con)                         # remove tables from database
dbDisconnect(con)
