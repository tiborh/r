#!/usr/bin/env Rscript

## source("common.r")

if(!require(tools))
    stop("tools is needed.")

fn.analyse <- function(fn.str) {
    cat("\n")
    cat("full:",fn.str,"\n")
    cat("dirname: ",dirname(fn.str),"\n")
    cat("basename:",basename(fn.str),"\n")
    cat("extension:",file_ext(fn.str),"\n")
    cat("without extension:",file_path_sans_ext(fn.str),"\n")
}

fn <- vector("character")

fn[1] <- "file.txt"
fn[2] <- "./file.tar.gz"
fn[3] <- "/home/user/my_file.ext"
fn[4] <- "../readme"
fn[5] <- "~/tilde\ check"
fn[6] <- file.path("..","file.path_check")
fn[7] <- file.path("~","another_attempt.tst")

for(f in fn) {
    fn.analyse(f)
}
