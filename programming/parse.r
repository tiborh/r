fn <- file.path("xyz.Rdmped")
cat("x <- c(1, 4)\n  x ^ 3 -10 ; outer(1:7, 5:9)\n", file = fn)
     # parse 3 statements from the file "xyz.Rdmped"
parse(file = fn, n = 3)
unlink("xyz.Rdmped")

     # A partial parse with a syntax error
txt <- "
     x <- 1
     an error
     "
## [1] "\n     x <- 1\n     an error\n     "

sf <- srcfile("txt")                    # txt
class(sf)                               # srcfile
str(sf)                                 # Class 'srcfile' <environment: 0x2557c20> 
try(parse(text = txt, srcfile = sf))
getParseData(sf)
