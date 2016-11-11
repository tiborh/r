#!/usr/bin/env Rscript

args0 = commandArgs()
args1 = commandArgs(trailingOnly=T)

print("all:")
print(args0)
print(str(args0))
print("only user args:")
print(args1)
print(str(args1))

## example run:
## $ ./command_args.r a b c --some a --any b
## [1] "all:"
## [1] "/usr/lib/R/bin/exec/R"   "--slave"
## [3] "--no-restore"            "--file=./command_args.r"
## [5] "--args"                  "a"
## [7] "b"                       "c"
## [9] "--some"                  "a"
## [11] "--any"                   "b"
## chr [1:12] "/usr/lib/R/bin/exec/R" "--slave" "--no-restore" ...
## [1] "only user args:"
## [1] "a"      "b"      "c"      "--some" "a"      "--any"  "b"
## chr [1:7] "a" "b" "c" "--some" "a" "--any" "b"
