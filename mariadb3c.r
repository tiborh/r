#!/usr/bin/env Rscript

source("mariadb_common.r")

db.name <- "test"
con <- connect_to_db(db.name)

if(length(dbListTables) != 0)
    cleanup.db(con)

cat("1. write mtcars to table:\n")
dbWriteTable(con, "mtcars", mtcars[1:10,],row.names=T)
cat("when read back with dbReadTable:\n")
print(str(dbReadTable(con, "mtcars")))

saved.sql <- "select * from mtcars"

df0 <- send.query(con,saved.sql)
cat("starting with this:\n")
print(df0)

## for interactive use: dbGetQuery()
cat("Sending query:\n")
df <- send.query(con, "show columns from mtcars")
cat("Table structure:\n")
print(df)

sql2 <- paste(paste0("insert into mtcars(",paste(df[,1],collapse=", "),")"),
paste0("values(",paste(paste0("'",row.names(mtcars)[11],"'"),paste(as.numeric(mtcars[11,]),collapse=", "),sep=", "),")"),sep="\n")

cat("insert query:\n")
cat(sql2,"\n")

df.null <- send.query(con,sql2,fetch.res=F)
df2 <- send.query(con,saved.sql)
cat("After insert:\n")
print(df2)

df.null <- send.query(con,"drop table if exists mtcars",fetch.res=F)

cleanup.db(con)                         # remove tables from database
dbDisconnect(con)
