#!/usr/bin/env Rscript

source("common.r")
source("common_passwd.r")

stop.if.not.installed(c("odbc","RMariaDB","tools"))

connect_to_db <- function(dbname) {
    cred.fn <- file.path(Sys.getenv("HOME"),"private","mariadb_credentials")
    if(file.exists(cred.fn)) {
        load(file=cred.fn)
    } else {
        credentials <- getLoginDetails()
        save(credentials,file=cred.fn)
        Sys.chmod(cred.fn,mode="600")
    }

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

db.table.manipulator <- function(con,tbl) {
    tbl.names <- dbListTables(con)
    tbl.name <- deparse(substitute(tbl))
    if (!(tbl.name %in% tbl.names)) {
        ## dbWriteTable(con,tbl.name,tbl,temporary=T)
        dbWriteTable(con,tbl.name,tbl)
        cat("Added table:",tbl.name,"\n")
        return(T)
    } else {
        dbRemoveTable(con,tbl.name)
        cat("Removed table:",tbl.name,"\n")
        return(F)
    }
}

get.db.tables <- function(con) {
    cat("list of tables in",paste0(db.name,":\n"))
    db.tables <- dbListTables(con)
    print(db.tables)
    return(db.tables)
}

db.name <- "test"

con <- connect_to_db(db.name)
manip.result <- db.table.manipulator(con,mtcars)

db.tables <- get.db.tables(con)
if(length(db.tables) == 0)
    cat("No table in database:",db.name,"\n")

dbDisconnect(con)
