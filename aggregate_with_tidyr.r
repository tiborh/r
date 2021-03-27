#!/usr/bin/env Rscript

require(dplyr)
A <- c(1.2, 2.3, 2.3, 1.2, 3.4, 1.2)
B <- c(4, 4, 6, 3, 2, 5)
C <- c(8, 9, 0, 3, 1, 1)

df <- data_frame(A, B, C)

cat("original:")
print(df)

df2 <- df %>%
    group_by(A) %>% 
    summarise(num = n(),
              totalB = sum(B))

cat("result:")
print(df2)
