DATA.DIR <- file.path(".","data")
if (!dir.exists(DATA.DIR))
    dir.create(DATA.DIR)
IMG.DIR <- file.path(".","img")
if (!dir.exists(IMG.DIR))
    dir.create(IMG.DIR)

get.raw.df <- function(loc.site,loc.file,force.local=F,data.dir=DATA.DIR) {
    csv.path <- file.path(data.dir,loc.file)
    if (file.exists(loc.file) && !force.local)
        raw.data <- read.csv(csv.path)
    else {
        raw.data <- read.csv(paste0(loc.site,loc.file))
        write.csv(raw.data,file=csv.path)
    }
    return(raw.data)
}
