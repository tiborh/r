if (!require(hash)) install.packages("hash")
library(hash)

h <- hash( keys=letters, values=1:26 )  # also: h <- hash( letters, 1:26 )
str(h)

h$a                                     # [1] 1
h$z                                     # [1] 26
h                                       # a : 1, and so on
h$foo <- 36
fn = file.path("data","h_hash.dat")
save(h,file=fn)
clear(h)
h                                       # NA : NULL
rm(h)
load(fn)
h["foo"]                                # info + key-value pair
h[["foo"]]                              # value only

## same with .set
H <- hash()
H                                       # NA : NULL
.set(H, keys=LETTERS, values=27:52)
.set(H, a="foo",b="bar",c="baz")
.set(H, c(aa="foo",ab="bar",ac="baz"))

new.H <- copy(H)                        # deep copy

del(c("aa","ab","ac"),H)                # delete() also works

## check if key exists
has.key("A",H)                          # true
has.key("z",H)                          # false
all( has.key( letters, h ) )            # true
has.key( letters, h )                   # vector of logicals

## hash()
is.hash(h)                              # true
is.hash("a")                            # false
is.hash(hash())                         # true

## can take pairs, vectors, and lists
hash( a=1, b=2, c=3 )
hash( c(a=1, b=2, c=3) )
hash( list(a=1,b=2,c=3) )
hash( c("foo","bar","baz"), lapply(1:3, seq, 1 ) ) # value as vector
h

## add value:
h[ letters[1:4] ] <- 4:1

## accessors
is.empty(h)                             # false
is.empty(hash())
length(h)                               # 27
keys(h)                                 # vector of keys
class(values(h))                        # vector with named rows

invert(h)                               # invert keys and values
invert(hash(a=1,b=1))                   # 1 : a b
ih <- inverted.hash(a=1,b=1:2,c=1:3)
ih
length(ih)  # 3
values(ih)  # list

names(h)                                # same as keys()

letters
make.keys(letters)                      # same output as above
make.keys(1:26)                         # turns into character vector

## values()
values(h)                               # named vector
values(h, simplify=F)                   # list
values(h, USE.NAMES = F)                # only value vector
values(ih, keys=1:3)
values(h, keys=letters[1:5])
values(h, keys=letters[1:5]) <- 6:10    # changing only a subset
## h[[make.keys(letters[1:5])]]         # wrong arguments for subsetting an environment
h[make.keys(letters[1:5])]              # subsetting



