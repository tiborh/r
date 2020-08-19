#!/usr/bin/env Rscript

source("common.r")

stop.if.not.installed(c("RCurl","XML","stringr","plyr","filesstrings"))

## source:
## https://www.tutorialspoint.com/r/r_web_data.htm

## Read the URL.
url <- "https://www.geos.ed.ac.uk/~weather/jcmb_ws/"
if (!url.exists(url))
    stop("url not found:",url)

## Gather the html links present in the webpage.
url.content <- getURL(url)
links <- getHTMLLinks(url.content)              # XML

## Identify only the links which point to the JCMB 2015 files. 
filenames <- links[str_detect(links, "JCMB_2015")]

## Store the file names as a list.
filenames_list <- as.list(filenames)

## Create a function to download the files by passing the URL and filename list.
downloadcsv <- function (mainurl,filename) {
    filedetails <- str_c(mainurl,filename) # stringr
    if(!file.exists(file.path(DATA.DIR,filename))) {
        download.file(filedetails,filename)    # utils
        file.move(filename,DATA.DIR) # filesstrings
    }
}

## Now apply the l_ply function and save the files into the current R working directory.
l_ply(filenames,downloadcsv,mainurl = url) # plyr
