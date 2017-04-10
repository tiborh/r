iter <- stats::rpois(1, lambda = 10)
iter                                   # 10
## print an informative message
cat("iteration = ", iter <- iter + 1, "\n")

## 'fill' and label lines:
cat(paste(letters, 100* 1:26), fill = T, labels = paste0("{", 1:10, "}:"))
cat(paste(letters, 100* 1:26), fill = F) # one row, for which reason no need for labels
