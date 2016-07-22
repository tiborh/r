## environment variables:
Sys.getenv()

## global environment
globalenv()

## what is defined:
ls()

## what packages are loaded?
search()

## what global options are set?
options()

## specific option:
getOption("digits")                     # 7
## setting an option:
options(digits = 5)

## system information (including username)
Sys.info()

## working directory:
getwd()

## available data sets:
data()
