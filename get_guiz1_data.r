## https is not supported
# temp <- tempfile()
# download.file("https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fquiz1_data.zip",temp)
data <- read.csv(unz("dat/quiz1_data.zip", "hw1_data.csv"),header=T)
class(data[[1]])                        # integer
class(data[[2]])                        # integer
class(data[[3]])                        # numeric
class(data[[4]])                        # integer
class(data[[5]])                        # integer
class(data[[6]])                        # integer
# unlink(temp)

print( data[1:6,] )                     # first six rows
print( data[1:2] )                     # first two columns
print( data[1:2,] )                     # first two rows
good <- complete.cases(data)      # filter for good data only
print(good)
print( data[good, ][1:6, ] )      # filtered data only

print(head(data[good,]))                # head of good data
print(tail(data[good,]))                # tail of good data
print( data[1:6][1:5,] )                # first set governs columns, second the rows
print( data[1][1:5,] )                  # the ozone column only
print( data[1][47,] )                   # first column, 47th item
print( data[good,] )                    # only good data
print( data[good,1] )                   # only good data of first column

print( data["Ozone"])                   # first column by name
print( data[47,"Ozone"])                # row 47 of Ozone
print( nrow(data) )                     # the number of rows
print( ncol(data) )                     # the number of cols
print( rownames(data) )                 # row names
print( colnames(data) )                 # col names
print( tail(data, n=2))                 # last two rows

data[good,"Ozone"]                      # good data from Ozone column
length(data[good,"Ozone"])              # number of good elements in Ozone column
nrow(data)-length(data[good,"Ozone"])   # number of NA is different in Ozone (another method is needed)
bad.ozone <- is.na(data["Ozone"])       # all NA will be TRUE
print(bad.ozone)
data[bad,"Ozone"]                       # only NA is kept
length(data[bad,"Ozone"])               # 37 has arrived
## 148:
length(data[good,"Ozone"])+length(data[bad,"Ozone"])
length(data["Ozone"])                   # 1 (col is counted)
length(data[,"Ozone"])                  # nu of data is counted

round(mean(data[good,"Ozone"]),1)       # the mean of "Ozone" values rounded to one decimal
ozone.data <- data[,"Ozone"]
ozone.data[ozone.data > 31]             # unfortunately, NA is also included

good.data <- data[good,]                # only the good data is kept
good.data[ good.data$"Ozone" > 31, ]
good.data[ good.data$"Temp" > 90, ]
filtered.good.data <- good.data[ which(good.data$"Ozone" > 31 & good.data$"Temp" > 90),]
print(filtered.good.data)
mean(filtered.good.data[,"Solar.R"])

mean(data[data$"Month" == 6,][,"Temp"]) # What is the mean of "Temp" when "Month" is equal to 6?
mean(good.data[good.data$"Month" == 6,][,"Temp"]) # no need to filter these
## the good is needed here
max(good.data[good.data$"Month" == 5,][,"Ozone"]) # What was the maximum ozone value in the month of May
