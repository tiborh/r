if (!require(RMySQL)) install.packages("RMySQL")
library(RMySQL)
ucscDb <- dbConnect(MySQL(), user = "genome", 
                    # password="password",
                    host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;")
dbDisconnect(ucscDb)
result


con <- dbConnect(RMySQL::MySQL(),
                 dbname="company",
                 host="courses.csrrinzqubik.us-east-1.rds.amazonaws.com",
                 port=3306,
                 user="student",
                 password="datacamp")

dbListTables(con)
employee.table <- dbReadTable(con,"employees")
str(employee.table)
print(con)                              # <MySQLConnection:0,1>

dbGetQuery(con, "select name from employees where started_at > \"2012-09-01\"")
##  name
## 1   Julie
## 2 Heather
## 3    John

dbGetQuery(con, "select * from products where contract = 1")
## id          name contract
## 1  2     Call Plus        1
## 2  9 Biz Unlimited        1



res <- dbSendQuery(con, "select * from products where contract = 1")
str(res)                                # Formal class 'MySQLResult' [package "RMySQL"] with 1 slot
dbFetch(res)
dbClearResult(res)

dbDisconnect(con)



## another one:

con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "tweater", 
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                 port = 3306,
                 user = "student",
                 password = "datacamp")

long_tweats <- dbGetQuery(con, "select post,date from tweats where char_length(post) > 40")

print(long_tweats)

dbDisconnect(con)
