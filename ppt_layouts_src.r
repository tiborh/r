#if (!require(ReportRs)) install.packages('ReporteRs')
library(ReporteRs)

show.layouts <- function(doc){
    layouts <- slide.layouts(doc)                      # list
    ##  plot each slide style
    j = 1
    out.vector = vector()
    for(i in layouts ){
        par(mar=c(0.5,0.5,2,0.5), cex=0.7)
        if (nchar(i) == 0) next;
        if (i == "Blank Slide") next;
        if (i == "Blank") next;
        if (i == "Logo only") next;
        print(paste0(j,": '",i,"'"))
        slide.layouts(doc, i )
        title(main = paste0("'", i, "'" ))
        out.vector[j] = i
        j = j + 1
        if(interactive()) readline(prompt = "Show next slide layout")
    }
    return(out.vector)
}
