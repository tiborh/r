DATA.DIR <- file.path(".","data")
if (!dir.exists(DATA.DIR))
    dir.create(DATA.DIR)
IMG.DIR <- file.path(".","img")
if (!dir.exists(IMG.DIR))
    dir.create(IMG.DIR)

get.raw.df <- function(loc.site,loc.file,force.remote=F,data.dir=DATA.DIR) {
    remote.site <- paste0(loc.site,loc.file)
    local.path <- file.path(data.dir,loc.file)
    if (file.exists(local.path) && !force.remote)
        raw.data <- read.csv(local.path)
    else {
        raw.data <- read.csv(remote.site)
        write.csv(raw.data,file=local.path)
    }
    return(raw.data)
}
