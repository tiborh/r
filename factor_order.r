a <- data.frame(a = sample(letters[1:2],10,replace=T), b = sample(1:3,10,replace=T))
b <- a
c <- a
b$a <- factor(b$a,levels=c("b","a"))    # the order can be determined this way
c$a <- factor(c$a,levels=c("c","d"))    # NA's will appear
a$a <- factor(a$a)
str(a)
str(b)
str(c)
