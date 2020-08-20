#!/usr/bin/env Rscript

source("common_passwd.r")

credentials <- getLoginDetails()
## Do what needs to be done
## Delete credentials
rm(credentials)
