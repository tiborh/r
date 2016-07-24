## install.packages("scrypt")
library(scrypt)
help(scrypt)
help(hashPassword)
help(verifyPassword)
password <- hashPassword(readline("Password: "))
print(password)                         # hashed
passfile = "password.saved"
save(password,file=passfile)
rm(password)
load(file=passfile)
if (verifyPassword(password,readline("Password: ")) == T) {
    print("Password check: OK")
} else {
    print("Password check: NOK")
}

rawpass <- charToRaw("test password")
help(charToRaw)
typeof(rawpass)
class(rawpass)
save(rawpass,file="rawpass")
rawToChar(rawpass)
