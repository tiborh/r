#!/usr/bin/env Rscript

## basic idea from:
## https://www.tutorialspoint.com/r/r_data_frames.htm

source("script_env.r")

get.raw.data <- function(force.download=F) {
    data.path <- file.path(DATA.DIR,"employee_payroll.csv")

    if (!file.exists(data.path) || force.download) {
        sample.length <- 200
        url <- "https://datacatalog.cookcountyil.gov/api/views/xu6t-uvny/rows.csv"
        ## if (!url.exists(url))
        ##     stop("File not found: ",url)
        if (!require(RCurl))
            stop("RCurl is needed.")
        cat("Downloading data from",url,"\n")
        Employee.Payroll <- getURL(url)
        print(str(Employee.Payroll))
        cat("Length of input string:",nchar(Employee.Payroll),"\n")
        cat("First",sample.length,"chars:\n",substr(Employee.Payroll,1,sample.length),"\n")
        payroll <- read.csv(textConnection(Employee.Payroll))
        write.csv(payroll,file=data.path,row.names=F)
        cat("Data has been written to:",data.path,"\n")
    } else
        payroll <- read.csv(data.path)

    return(payroll)
}

proc.raw.data <- function(in.df) {
    year = 2018
    quarter = 2
    cat("Getting year:",year,"\n")
    out.df <- in.df[in.df$Fiscal.Year == year,]
    cat("Getting quarter:",quarter,"\n")
    out.df <- out.df[out.df$Fiscal.Quarter == quarter,]
    cat("Date conversion (from string to Date).\n")
    out.df$Original.Hire.Date <- as.Date(out.df$Original.Hire.Date, format="%m/%d/%Y")
    ## dropped for too many name changes
    ## cat("Merging names to one string.\n")
    ## out.df$emp.name <- paste(out.df$Last.Name,", ",out.df$First.Name," ",out.df$Middle.Init)
    ## out.df$emp.name <- trimws(out.df$emp.name)
    cat("Selecting and renaming columns important for the task.\n")
    ## out.df <- data.frame(emp.id=out.df$Employee.Identifier,emp.name=out.df$emp.name,salary=out.df$Base.Pay,start.date=out.df$Original.Hire.Date) ## too many name variants: 104
    ## first name dropped due to too many first name changes: 66
    ## out.df <- data.frame(emp.id=out.df$Employee.Identifier,emp.name=out.df$First.Name,salary=out.df$Base.Pay,start.date=out.df$Original.Hire.Date)
    out.df <- data.frame(emp.id=out.df$Employee.Identifier,salary=out.df$Base.Pay,start.date=out.df$Original.Hire.Date)
    out.df <- aggregate(salary~emp.id+start.date,data=out.df,FUN=sum)
    return(out.df)
}

raw.data <- get.raw.data()
cat("raw data:\n")
print(str(raw.data))
emp.data <- proc.raw.data(raw.data)
cat("processed data:\n")
print(str(emp.data))
fn1 <- file.path(IMG.DIR,"salary_distribution_vs_start_date.png")
if(!require(ggplot2)) {
    dev(filename=fn1)
    plot(salary~start.date,data=emp.data)
    dev.off()
} else {
    ## some good ideas: https://www.datanovia.com/en/blog/ggplot-point-shapes-best-tips/
    ggplot(emp.data,aes(start.date,salary)) + geom_point(shape=21,colour="blue",fill="lightblue",alpha=.2)
    ggsave(fn1)
    ggplot(emp.data,aes(salary)) + geom_histogram()
    ggplot(emp.data,aes(start.date)) + geom_histogram()
}
cat("Plot has been written to:",fn1,"\n")
