name.changer <- function(from,to,vect) {
    the.names <- names(vect)
    the.index <- match(from,the.names)  # whole string only
    if (!is.na(the.index))
        names(vect)[the.index] = to
    else
        warning(paste0("No match for '",from,"' in column names."))
    return(vect)
}

a <- 1:5
b <- data.frame(one.two.three = a, two.three = letters[a], three = LETTERS[a])

name.changer("two","four",b)            # not found
c <- name.changer("three","four",b)          # replaced
names(b) == names(c)                         # T T F
