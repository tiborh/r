a.df <- data.frame(Capitals=sample(LETTERS,10),Ten=sample(letters,10))
b.df <- data.frame(Capitals=sample(LETTERS,5),Five=sample(letters,5))
c.df <- data.frame(Capitals=sample(LETTERS,7),Seven=sample(letters,7))

merged.df <- merge(a.df,b.df,by="Capitals",all=T)
merged.df <- merge(merged.df,c.df,by="Capitals",all=T)

library(dplyr)
sorted.df <- merged.df %>% arrange(Capitals)
print(sorted.df)
library(pander)
pander(sorted.df,missing="-")
