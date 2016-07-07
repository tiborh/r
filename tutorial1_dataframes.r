ht <- function(df,num=5) {
    print(head(df,num))
    print("...",quote=F)
    print(tail(df,num))
}

mtcars
str(mtcars)
summary(mtcars)
rownames(mtcars)
names(mtcars)
head(mtcars)
tail(mtcars)
ht(mtcars)

## dataframes can be created from vectors of equal length
d.num <- c("一","二","三","四","五","六","七")
days.jp <- c("月曜日","火曜日","水曜日","木曜日","金曜日","土曜日","日曜日")
days.en <- c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")
d.abbr.jp <- c("月","火","水","木","金","土","日")
d.abbr.en <- c("Mon","Tue","Wed","Thur","Fri","Sat","Sun")

days = data.frame(d.num,days.jp,days.en,d.abbr.jp,d.abbr.en,stringsAsFactors=F)
days
days.jp.hir <- c("げtづようび","かようび","すいようび","もくようび","きにょうび","どようび","ひようび")
days = cbind(days,days.jp.hir)
days

## unnamed reference:
days[1]                                 # column
days[[1]]                               # column as vector
days[,1]                                # a column as vector

## named reference:
rownames(days) = days$d.num
days["一",]                             # a row
days["一","d.num"]                      # a cell
days$d.num                              # a column

## alternatively:
rownames(days) = days$d.num
days = days[,-1]
days$days.jp                            # a column, which does not have the row names any more
days[,1]
days["一",]                             # a row
days[1,]
days$days.jp[1]                         # a cell, days$days.jp["一"] would lead to an error
days[1,1]
days$d.abbr.jp[1:3]                     # three elements of a col
days[1:3,"d.abbr.jp"]
days[1:3,3]
weekend <- c(F, F, F, F, F, T, T)
weekend
length(weekend)
days <- cbind(days,weekend)
days$days.jp[days$weekend]              # weekend days
days[days$weekend,-6]                   # weekend rows

day.num <- 1:7
days <- cbind(days,day.num)
days

## using filtering by index
someVector = c(1, 3, 4, 6, 3, 9, 2, -5, -2)
help(which)
which(someVector %% 2 == 1)             # odd indices

days[which(days$day.num %% 2 == 1),c(-6,-7)] # odd numbered days
days[which(days$day.num %% 2 == 0),c(-6,-7)] # even numbered days

## using subset:
subset(days,day.num<6)                  # first five
subset(days,weekend)                    # weekend
subset(days,!weekend)                   # weekdays

order(days)                             # not much meaning
order(days$day.num)                     # not hear either
order(days$days.en)                     # these two correspond to each other
sort(days$days.en)

## using order() to sort data frame by a column:
days[order(days$days.en),]
days[order(days$d.abbr.jp),]
