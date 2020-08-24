#!/usr/bin/env Rscript

source("mariadb_common.r")

db.name <- "test"
con <- connect_to_db(db.name)

cat("write five rows:\n")
dbWriteTable(con, "mtcars", mtcars[1:5, ])
res <- dbReadTable(con, "mtcars")
print(res)
print(str(res))

cat("append five more rows:\n")
dbWriteTable(con, "mtcars", mtcars[6:10, ], append = T)
print(dbReadTable(con, "mtcars"))

cat("overwrite with first 15 rows:\n")
dbWriteTable(con, "mtcars", mtcars[1:15, ], overwrite = T)
print(dbReadTable(con, "mtcars"))

cat("No row names:\n")
dbWriteTable(con, "mtcars", mtcars[1:15, ], overwrite = T, row.names = T)
print(dbReadTable(con, "mtcars"))

dbRemoveTable(con,"mtcars")

db.tables <- get.db.tables(con)
if(length(db.tables) == 0)
    cat("database",db.name,"has been cleaned up.\n")

dbDisconnect(con)
