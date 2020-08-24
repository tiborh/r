#!/usr/bin/env Rscript

source("mariadb_common.r")

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

db.name <- "test"

con <- connect_to_db(db.name)

manip.result <- db.table.manipulator(con,mtcars)

db.tables <- get.db.tables(con)
if(length(db.tables) == 0)
    cat("No table in database:",db.name,"\n")

dbDisconnect(con)
