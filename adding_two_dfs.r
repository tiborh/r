a <- data.frame(a = c(1,2), b = c(3,4))
b <- data.frame(a = c(5,6), b = c(7,8))

## the short and lucky way:

c <- a + b                                   # all data are added, just like a matrix operation
c

## the long but safer way:

d <- rbind(a,b)
d$group = c("one","two")
d

library(tidyr)
library(dplyr)
d1 <- d %>%
    gather(type,value,-group) %>%
    group_by(group,type) %>%
    summarise(sum=sum(value)) %>%
    spread(type,sum)
d1

d2 <- as.data.frame(d1) %>% select(a,b)
d2
