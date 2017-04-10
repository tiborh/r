a <- 1:10
paste(a, collapse="")                   # [1] "12345678910"

paste0( c(letters[1:3],a))              # "a" "b" "c" "1" "2" ...
paste0("a",a)                           # from a1 to a10
