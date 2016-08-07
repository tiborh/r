library(tidyr)
iris$rowID <- 1:nrow(iris)              # to avoid duplicate rows error
iris.wide <- iris %>%
    gather(Measure,Value, -c(Species,rowID)) %>%
    separate(Measure,c("Part","Measure"),sep="\\.") %>%
    spread(Measure,Value)
iris <- iris[-6]

iris.tidy <- iris %>%
    gather(key, Value, -Species) %>%
    separate(key,c("Part","Measure"), sep="\\.")

library(gnumeric)
gfp <- file.path("data","mamsleep.gnumeric")
read.gnumeric.sheet.info(gfp)
gsl <- read.gnumeric.sheets(gfp,head=T)
#str(gsl)
mamsleep <- as.data.frame(gsl[[1]])
#str(mamsleep)
