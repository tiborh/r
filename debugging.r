## message: the tamest
## warning: sth unexpected happened
## error: fatal problem, execution stops + error msg
## condition: try/catch

## warning
log(-1)                                 # NaN

printmessage <- function(x) {
    if (x > 0)
        print("X is greater than zero")
    else
        print("x is less than or equal to zero")
    invisible(x)                        # Return a (temporarily) invisible copy of an object.
}

printmessage(2)                         # return value is not printed
x <- printmessage(2)
print(x)

printmessage(NA)                        # missing value where TRUE/FALSE needed

printmessage <- function(x) {
    if(is.na(x))                        # fixed version
        print("x is a missing value!") 
    else if (x > 0)
        print("x is greater than zero")
    else
        print("x is less than or equal to zero")
    invisible(x)                       
}

x <- printmessage(NA)
print(x)
x <- log(-1)
print(x)
y <- printmessage(x)
print(y)

## traceback: function stack; most recent error only, need to be called immediately
## debug:     flags function
## browser:   suspends execution of function and puts it in debug mode
## trace:     allows the insertion of debugging code in specific spaces
## recover:   allows for the modification of error behaviour, to help browse function call stack

rm(x)
mean(x)                                 # Error in mean(x) : object 'x' not found
traceback()                             # 1: mean(x)  (not a huge stack)
## ‘lm’ is used to fit linear models.
lm(y-x)                                 # Error in stats::model.frame(formula = y - x,
                                        # drop.unused.levels = TRUE) : object 'x' not found
traceback()                             # 4: stats::model.frame(formula = y - x, drop.unused.levels = TRUE)
                                        # 3: eval(expr, envir, enclos)
                                        # 2: eval(mf, parent.frame())
                                        # 1: lm(y - x)

debug(lm)
lm(y-x)                                 # debugging in: lm(y - x)
                                        # debug: {
                                        #    ret.x <- x
                                        #    ret.y <- y
                                        #    cl <- match.call()
                                        # [...]
                                        #     if (!qr) 
                                        #        z$qr <- NULL
                                        #    z
                                        # }
                                        # Browse[2]>
                                        # (browser got called at the end)
                                        # Browse[2]> n
                                        # debug: ret.x <- x
                                        # (n for next line)
                                        # [...]
                                        # Browse[2]> n
                                        # debug: mf <- eval(mf, parent.frame())
                                        # Browse[2]> n
                                        # Error in stats::model.frame(formula = y - x,
                                        # drop.unused.levels = TRUE) : 
                                        #  object 'x' not found
options(error = recover)
read.csv("nosuchfile")                  # Error in file(file, "rt") : cannot open the connection
                                        # In addition: Warning message:
                                        # In file(file, "rt") :
                                        #   cannot open file 'nosuchfile': No such file or directory
                                        # 
                                        # Enter a frame number, or 0 to exit   
                                        # 
                                        # 1: read.csv("nosuchfile")
                                        # 2: read.table(file = file, header = header, sep = sep,
                                        # quote = quote, dec = de
                                        # 3: file(file, "rt")
                                        # 
                                        # Selection:
