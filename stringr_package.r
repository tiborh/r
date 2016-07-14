if (!require(stringr)) install.packages("stringr")
ls(package:stringr)                     # redefinition of lots of common functions

str_trim("   \ttest string.\n   ")

str_pad("24493", width=7, side="left", pad=0) # fill out with zeroes

frnames <- c("Abe", "Ann", "Ali")
str_detect(frnames,"Ali")               # F F T

str_replace(frnames,"Ali", "Alice")

## from base:
tolower("ABD")
toupper("abd")
