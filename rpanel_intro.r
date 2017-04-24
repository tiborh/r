#!/usr/bin/env Rscript

require(rpanel)
require(gstat)

data<-read.table("data.txt",sep="\t",header=T)
sp::coordinates(data)=~Lat+Lon

##Variogram Fitting
variogram.plot <- function(panel) {
    with(panel, {
        variogram<-gstat::variogram(Oxigen~1,data,cutoff=Cutoff)
        vgm.var<-gstat::vgm(psill=Sill,model=Model,range=Range,nugget=Nugget)
                                        #fit<-fit.variogram(variogram,vgm.var)
        plot(variogram$dist,variogram$gamma,xlab="Distance",ylab="Semivariance")
        lines(gstat::variogramLine(vgm.var,maxdist=Range))
    })
    panel
}

var.panel <- rp.control("Variogram",Sill=20,Range=250,Nugget=0,Model="Mat",Cutoff=250)
rp.listbox(var.panel,Model,c("Mat","Sph","Gau"))
rp.slider(var.panel, Cutoff, 0,500,showvalue=T)
rp.slider(var.panel, Sill, 0,500,showvalue=T)
rp.slider(var.panel, Range, 0,1000,showvalue=T)
rp.slider(var.panel, Nugget, 0,15,showvalue=T)
rp.button(var.panel, title = "Fit", action = variogram.plot)
