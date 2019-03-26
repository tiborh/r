library(readr)

url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/swimming_pools.csv"
pools <- read_csv(url_csv)
str(pools)

url_delim <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/potatoes.txt"
potatoes <- read_tsv(url_delim)
str(potatoes)


## csv on https
urls_csv <- "https://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/swimming_pools.csv"
pools2 <- read.csv(urls_csv)
head(pools2)

## Rdata
url_rdata <- "https://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/wine.RData"
wine.fp <- file.path("data","wine.RData")
download.file(url_rdata,wine.fp)
load(wine.fp)
summary(wine)
head(wine)


## using httr
# Load the httr package
if(!require(httr)) install.packages("httr")
library(httr)

# Get the url, save response to resp
url <- "http://www.example.com/"
resp <- GET(url)

# Print resp
print(resp)

# Get the raw content of resp
raw_content <- content(resp,as='raw')

# Print the head of content
head(raw_content)


## variation:
# Get the url
url <- "https://www.omdbapi.com/?t=Annie+Hall&y=&plot=short&r=json"
resp <- GET(url)

# Print resp
print(resp)

# Print content of resp as text
print("text/html")

# Print content of resp
print(content(resp))
print(content(resp,as="text"))
str(resp)


## API's better if not in HTML:

rm0.uri <- "http://www.omdbapi.com/?i=tt0095953&r=json"
rm.uri <- "http://www.omdbapi.com/?t=Rain+Man&y=&plot=short&r=json"
resp <- GET(rm.uri)
resp
content(resp)
content(resp,as="text")

if(!require(jsonlite)) install.packages("jsonlite")
fromJSON(content(resp,as="text"))       # same as content()
fromJSON(rm.uri)                        # the same again
str(fromJSON(rm.uri))                   # looks much more meaningful
ls(package:jsonlite)                    # 14 functions,toJSON is also possible
toJSON(cars)
toJSON(mtcars)
## you can prettify it:
prettify(toJSON(mtcars))
toJSON(mtcars,pretty=T)               # same with a switch
## and that one can be minified:
minify(prettify(toJSON(mtcars)))        # back to original

## fromJSON:
wine_json <- '{"name":"Chateau Migraine", "year":1997, "alcohol_pct":12.4, "color":"red", "awarded":false}'
fromJSON(wine_json)

quandl_url <- "http://www.quandl.com/api/v1/datasets/IWS/INTERNET_INDIA.json?auth_token=i83asDsiWUUyfoypkgMz"
quandl_data <- fromJSON(quandl_url)
str(quandl_data)

## some json finger practice:
# Experiment 1
json1 <- '[1,2,3,4,5,6]'
#json1 <- 1:6
fromJSON(json1)
# Experiment 2
#json2 <- '{"a": [1, 2, 3]}'
json2 <-'{"a":[1,2,3],"b":[4,5,6]}'
fromJSON(json2)

# Experiment 3
json3 <- '[[1,2],[3,4]]'
fromJSON(json3)

# Experiment 4
json4 <- '[{"a": 1, "b": 2}, {"a": 3, "b": 4}, {"a": 5, "b": 6}]'
fromJSON(json4)
