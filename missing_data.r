## is it random?

## is it a consequence of something?

## empty string?
## other formats than NA in imported data

## numbers: NaN, Inf

df <- data.frame(A = sample(c(1:10,NA,NA,NA,Inf),5,replace=T),
                 B = sample(c(1:10,NA,NA,NA,Inf),5,replace=T),
                 C = sample(c(1:10,NA,NA,NA,Inf),5,replace=T)
                 )
df
is.na(df)
any(is.na(df))
sum(is.na(df))
summary(df)

## if missing value is removable:
complete.cases(df)
df[complete.cases(df),]
## alternatively
na.omit(df)
