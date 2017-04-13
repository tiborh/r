
a <- data.frame(a = c(letters[c(1,3,5)]), b = c(2,4,6))
b <- data.frame(a = c(letters[c(2,4,6)]), b = c(1,3,5), c = c("alef","bet","cet"))

?merge
merge(a,b,by="a")
require(plyr)
rbind.fill(a,b)

