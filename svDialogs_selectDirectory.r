#!/usr/bin/env Rscript
require(svDialogs)
chdir <- function() {
    input.obj <- dlgDir(default = getwd())
    new.wd <- input.obj$res
    if (nchar(new.wd) < 1) {
        print("'Cancel' has been clicked.")
    } else {
        setwd(new.wd)
        print(paste0("working directory has been set to'",new.wd,"'"))
    }
}

getwd()
chdir()                                 # no good in script environment
getwd()
