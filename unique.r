s1 <- sample(1:10,10,replace=T)
s1                                      # repetitions occur
unique(s1)                              # repetitions removed

unique.letters <- function(name) {
    name <- gsub("\\s", "", name) # [[:space:]] is also good
    name <- tolower(name)
    letters <- strsplit(name, split="")[[1]]
    sort(unique(letters))
}

unique.letters("Nanes")
