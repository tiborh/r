clean.states <- function(df) {
    df$name = as.character(df$name)
    df$abbreviation = as.character(df$abbreviation)
    df$assoc_press = as.character(df$assoc_press)
    df$notes = as.character(df$notes)
    return(df)
}

clean.states0 <- function(df) {
    df <- df[-c(1,52,53),]
    df$Sr.No <- as.integer(df$Sr.No)
    df$Population.est. <- as.numeric(gsub(",","",df$Population.est.))
    Sys.setlocale("LC_TIME","en_GB.utf8")
    df$Statehood <- as.Date(df$Statehood,format="%B %d, %Y")
    for (colnum in 8:10)
        df[,colnum] = gsub("[,()]","",df[,colnum])
    return(df)
}
