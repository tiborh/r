a <- data.frame(col1 = sample(letters[1:2],10,replace=T), col2 = sample(LETTERS[1:3],10,replace=T))
require(dplyr)
require(ggplot2)
require(pander)
pander(a)
sum.a <- a %>% group_by(col1,col2) %>% summarise(number=n())
sum.a %>% ggplot(aes(col1,number)) + geom_bar(aes(colour=col2,fill=col2),stat="identity")

sum.b <- sum.a

str(sum.a)
pander(sum.a)

sum.b$col2 <- factor(sum.b$col2,levels=c("C","B","A"))

str(sum.b)
pander(sum.b)
sum.b %>% ggplot(aes(col1,number)) + geom_bar(aes(colour=col2,fill=col2),stat="identity") # palette order is also opposite
