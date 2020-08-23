#!/usr/bin/env Rscript

## source("common.r")

## install.packages("scrypt")
if(!require(scrypt))
    stop("'scrypt' is needed.")
## useful functions:
## help(scrypt)
## help(hashPassword)
## help(verifyPassword)
## works only in interactive mode:
## password <- hashPassword(readline("Enter password: "))
cat("Enter password: ")
password <- hashPassword(readLines(file("stdin"),n=1))
cat("password hashed:",password,"\n")
passfile = "password.saved"
save(password,file=passfile)
cat("Password saved as:",passfile,"\n")
rm(password)
load(file=passfile)
cat("Enter password again: ")
if (verifyPassword(password,readLines(file("stdin"),n=1)) == T) {
    cat("Password check: OK\n")
} else {
    cat("Password check: NOK\n")
}

test.passw <- "test password"
cat(paste0("Test password: '",test.passw,"'\n"))
rawpass <- charToRaw(test.passw)
cat("Raw password:",rawpass,"\n")
## help(charToRaw)
## typeof(rawpass)
## class(rawpass)
rpass.fn = "rawpass"
save(rawpass,file=rpass.fn)
cat("Raw password saved as:",rpass.fn,"\n")
rm(rawpass)
cat("(raw password variable removed.)\n")
load(file=rpass.fn)
cat("read back from file:",rawpass,"\n")
cat("rawToChar:",rawToChar(rawpass),"\n")
