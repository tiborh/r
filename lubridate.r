if(!require(lubridate)) install.packages("lubridate")
library(lubridate)
class(ymd("2016-07-12"))                # Date
ymd("2016 July 12")                     # recognised the same way
mdy("February 16, 2008")                # another function

## time
hms("18:34:12")                         # H M S written after the figures

## date time
ymd_hms("2005/03/31 06:02:00 AM")       # "2005-03-31 06:02:00 UTC"

## not all combinations exist, so doucmentation may need to be consulted in case of error messages
ls(package:lubridate)
