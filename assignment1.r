pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!

    collect.good.data <- c()
    for (an.id in id) {
        file.path = sprintf("%s/%03d.csv",directory,an.id)
        #if (exists("mydebug")) print(file.path)
        data = read.csv(file.path)
        #if (exists("mydebug")) print(head(data))
        data.col = data[pollutant]
        #if (exists("mydebug")) print(head(data.col))
        filter <- complete.cases(data.col)
        #if (exists("mydebug")) print(head(filter))
        good.data <- data.col[filter, ]
        #if (exists("mydebug")) print(class(good.data))
        #if (exists("mydebug")) print(head(good.data))
        collect.good.data = c(collect.good.data,good.data)
    }
    return(round(mean(collect.good.data),3))
}

# course ID: rprog-014

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    col.1 <- c()
    col.2 <- c()
    col.head <- c("id","nobs")
    for (an.id in id) {
        file.path = sprintf("%s/%03d.csv",directory,an.id)
        #if (exists("mydebug")) print(file.path)
        data = read.csv(file.path)
        #if (exists("mydebug")) print(nrow(data))
        filter <- complete.cases(data)
        good.data <- data[filter,]
        #if (exists("mydebug")) print(head(good.data))
        #if (exists("mydebug")) print(nrow(good.data))
        col.1 = c(col.1,an.id)
        col.2 = c(col.2,nrow(good.data))
    }
    return.frame = data.frame(col.1,col.2)
    colnames(return.frame) <- col.head
    #if (exists("mydebug")) print(return.frame)
    return(return.frame)
}

mydebug <- T
complete("specdata", 1)
complete("specdata", 3)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)

corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0

    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!

    ret.vect <- c(numeric())
    filepaths <- list.files(directory, pattern="*.csv", full.names=TRUE)
    #if (exists("mydebug")) print(head(filepaths))
    #if (exists("mydebug")) print(length(filepaths))
    for(a.fp in filepaths) {
        data = read.csv(a.fp)
        #if (exists("mydebug")) print(nrow(data))
        filter <- complete.cases(data)
        good.data <- data[filter,]
        #if (exists("mydebug")) print(nrow(good.data))
        nu.good <- nrow(good.data)
        #if(nu.good >= threshold) print(nu.good)
        if(nu.good >= threshold && nu.good > 0) {
            sulf.vect <- c(numeric())
            nitr.vect <- c(numeric())
                                        #print(nu.good)
                                        #print(head(good.data))
            sulf.vect <- good.data[,"sulfate"]
            nitr.vect <- good.data[,"nitrate"]
                                        #print(class(sulf.vect))
            the.corr <- numeric()
            the.corr <- cor(sulf.vect,nitr.vect)
            #if(is.na(the.corr)) print(nrow(good.data))
            ret.vect = c(ret.vect,the.corr)
        }
    }
    if (exists("mydebug")) print(ret.vect)
    return(ret.vect)
}

cr <- corr("specdata", 5000)
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
length(cr)
## [1] 0

cr <- corr("specdata", 150)
head(cr)
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630

cr <- corr("specdata", 400)
head(cr)
## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630

cr <- corr("specdata")
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
length(cr)
## [1] 323

cr <- corr("specdata",1000)             # three files
cr <- corr("specdata",1050)             # one file
length(cr)
summary(cr)
