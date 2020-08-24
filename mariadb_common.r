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

get.db.tables <- function(con) {
    cat("list of tables in",paste0(db.name,":\n"))
    db.tables <- dbListTables(con)
    print(db.tables)
    return(db.tables)
}

send.query <- function(con,query.str,num.lines=-1,fetch.res=T) {
    res <- dbSendQuery(con, query.str)
    if(fetch.res) {
        df <- dbFetch(res,n=num.lines)
        dbClearResult(res)
        return(df)
    } else {
        dbClearResult(res)
        return(NULL)
    }
}

cleanup.db <- function(con) {
    db.tables <- dbListTables(con)
    for(tabl in db.tables) {
        cat("Removing table:",tabl,"\n")
        dbRemoveTable(con,tabl)
    }
    db.tables <- dbListTables(con)
    if(length(db.tables) == 0) {
        cat("database",db.name,"has been cleaned up.\n")
    } else {
        cat("cleanup is still incomplete:\n")
        print(db.tables)
    }
}
