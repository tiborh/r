#!/usr/bin/env Rscript

DATA.DIR <- file.path(".","data")
if (!dir.exists(DATA.DIR))
    dir.create(DATA.DIR)
IMG.DIR <- file.path(".","img")
if (!dir.exists(IMG.DIR))
    dir.create(IMG.DIR)


make.dataframe <- function(loc.site,loc.file,data.dir=DATA.DIR) {
    csv.path <- file.path(data.dir,loc.file)
    if (file.exists(loc.file))
        raw.data <- read.csv(csv.path)
    else {
        raw.data <- read.csv(paste0(loc.site,loc.file))
        write.csv(raw.data,file=csv.path)
    }
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
stent365.data <- make.dataframe("https://www.openintro.org/data/csv/","stent365.csv")
stent365.data$days <- "365"
print(str(stent30.data))
print(str(stent365.data))
stent30.table <- table(stent30.data)
stent365.table <- table(stent365.data)
print(str(stent30.table))
print(str(stent365.table))
## plot(stent30.table)
## plot(stent365.table)
stent.combined <- combine.dfs(stent30.data,stent365.data)

print(str(stent.combined))
comb.table <- table(stent.combined)
print(str(comb.table))
plot(comb.table)
print(comb.table)

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
