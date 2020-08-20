#!/usr/bin/env Rscript

source("common.r")
source("common_passwd.r")

stop.if.not.installed(c("odbc","RMariaDB","tools"))

connect_to_db <- function(dbname) {
    credentials <- getLoginDetails()

    con <- dbConnect(
        drv = RMariaDB::MariaDB(), 
        username = credentials$loginID,
        password = credentials$password,
        dbname = dbname,
        host = "localhost", 
        port = 3306
    )

    rm(credentials)

    return(con)
}

db.table.writer <- function(con,tbl.names,fn,tbl.name) {
    fp <- file.path(DATA.DIR,fn)
    if (!(tbl.name %in% tbl.names)) {
        fh <- read.csv(fp)
        dbWriteTable(con,tbl.name,fh,temporary=T)
    } else {
        cat("db table already stored:",tbl.name,"\n")
    }
}

db.name <- "test"

con <- connect_to_db(db.name)
tbl.names <- dbListTables(con)
fn1 <- "tmdb_5000_credits.csv"
tbl1 <- file_path_sans_ext(fn1)
halt("To be debugged: reason: not real CSV, JSON masqueraded as CSV.")
db.table.writer(con,tbl.names,fn1,tbl1)

fn2 <- "tmdb_5000_movies.csv"
tbl2 <- file_path_sans_ext(fn2)
db.table.writer(con,tbl.names,fn2,tbl2)

cat("list of tables in",db.name,":\n")
db.tables <- dbListTables(con)
print(db.tables)

dbDisconnect(con)
