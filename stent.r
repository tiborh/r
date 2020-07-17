#!/usr/bin/env Rscript

source("script_env.r")

make.dataframe <- function(loc.site,loc.file,force.local=F,data.dir=DATA.DIR) {
    raw.data <- get.raw.df(loc.site,loc.file,force.local,data.dir)
    dat.len <- nrow(raw.data)
    out.data <- data.frame(group=vector(mode="character",length=dat.len),
                           outcome=vector(mode="character",length=dat.len)
                           )
    cat("prepared data space:\n")
    print(str(out.data))
    cat("raw data:\n")
    print(str(raw.data))
    out.data$group <- factor(raw.data$group)
    out.data$outcome <- factor(raw.data$outcome)
    cat("out data:\n")
    print(str(out.data))
    return(out.data)
}

combine.dfs <- function(df1,df2) {
    df.comb <- rbind(df1,df2)
    df.comb$days <- factor(df.comb$days)
    cat("combined data sets:\n")
    print(str(df.comb))
    return(df.comb)
}

stent30.data <- make.dataframe("https://www.openintro.org/data/csv/","stent30.csv")
stent30.data$days <- "30"
control.population <- nrow(stent30.data[stent30.data$group == "control",])
treatment.population <- nrow(stent30.data[stent30.data$group == "treatment",])
stent365.data <- make.dataframe("https://www.openintro.org/data/csv/","stent365.csv")
stent365.data$days <- "365"
print(str(stent30.data))
print(str(stent365.data))
stent30.table <- table(stent30.data)
stent365.table <- table(stent365.data)
print(stent30.table)
print(stent365.table)
## plot(stent30.table)
## plot(stent365.table)
stent.combined <- combine.dfs(stent30.data,stent365.data)

print(str(stent.combined))
comb.table <- table(stent.combined)
print(str(comb.table))
plot(comb.table)
print(comb.table)
comb.tbl.df <- as.data.frame(comb.table)
names(comb.tbl.df)[4] <- "sum"
## print(comb.tbl.df)
comb.tbl.df$population = 0
comb.tbl.df$population[comb.tbl.df$group=="control"] <- control.population
comb.tbl.df$population[comb.tbl.df$group=="treatment"] <- treatment.population
comb.tbl.df$ratio = comb.tbl.df$sum / comb.tbl.df$population
comb.tbl.df$percentage = round(comb.tbl.df$ratio * 100,digits=2)
print(comb.tbl.df)

require(dplyr)

comb.sum <- stent.combined %>% select(days,group,outcome) %>% group_by(days,group,outcome) %>% summarise(sum=n())
print(str(comb.sum))

comb.sum.df <- as.data.frame(comb.sum)
print(str(comb.sum.df))
print(comb.sum.df)

require(ggplot2)

## ggplot(comb.sum,aes(x=outcome,y=sum,colour=group)) + geom_point(aes(shape=days))
## ggplot(comb.sum,aes(x=days,y=sum,colour=group)) + geom_point(aes(shape=outcome))
fn.dots <- file.path(IMG.DIR,"stent_dots.png")
fn.bars <- file.path(IMG.DIR,"stent_bars.png")
dot.plot <- ggplot(comb.sum,aes(x=group,y=sum,colour=days)) + geom_point(aes(shape=outcome),size=5)
ggsave(fn.dots,dot.plot)
cat("dot chart has been written to: ",fn.dots,"\n")
bar.plot <- ggplot(stent.combined,aes(x=days)) + geom_bar(aes(fill=outcome)) + facet_grid(~group)
ggsave(fn.bars,bar.plot)
cat("bar chart has been written to: ",fn.bars,"\n")
## plot(x=comb.sum$group,y=comb.sum$sum,pch=comb.sum$outcome,col=comb.sum$days)
