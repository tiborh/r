library(ggplot2)
df <- data.frame(group=c("backlog","backlog","wait.for.release"),
                 prio=c("B","C","C"),
                 number=c(2,1,1))

str(df)

#levels(df$prio) = c(levels(df$prio),"A")
ggplot(df,aes(prio,number,fill=group)) + geom_bar(stat="identity") +
    scale_x_discrete(labels=c("A","B","C"))
