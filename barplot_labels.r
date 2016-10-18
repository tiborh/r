library(pander)
## simplest, below the figure:
vals <- 1:5
names(vals) <- letters[1:5]
pander(vals)
mp <- barplot(vals)
pander(mp)
str(mp)                                 # vector)
mtext(side = 1, at = mp, text = vals, line = 3)

## put them in the figure:
counts <- table(mtcars$vs, mtcars$gear)
pander(counts)
bplt <- barplot(counts, 
                main="Car Distribution by Gears and VS", xlab="Number of Gears", 
                col=c("darkblue","red"), legend = rownames(counts), 
                beside=T, horiz=TRUE)
pander(bplt)
text(x= counts+0.3, y= bplt, labels=as.character(counts), xpd=TRUE)


## not a solution for this one
bplt2 <- barplot(counts, 
                main="Car Distribution by Gears and VS", xlab="Number of Gears", 
                col=c("darkblue","red"), legend = rownames(counts), 
                beside=F, horiz=TRUE)
pander(bplt2)
## text(x= counts+0.3, y= bplt2, labels=as.character(counts), xpd=TRUE) # wrong


## solution for that scenario:
tt = structure(c(7L, 13L, 24L, 30L, 30L, 38L, 35L, 45L, 37L, 43L, 38L, 59L, 33L, 45L, 37L, 58L),
               .Dim = c(2L, 8L),
               .Dimnames = structure(list(param = c("A", "B"),
                                          xvar = c("5", "6", "7", "8", "9", "10", "11", "12")
                                          )
                                     ),
               .Names = c("param", "xvar"),
               class = "table")
pander(tt)
col.sums <- colSums(tt)
str(col.sums)
max.val <- max(col.sums) + (10 - max(col.sums) %% 10)
bb <- barplot(tt, col=c("grey60","grey80"),ylim=c(0,max.val))
text(bb,tt[1,]-4,labels=tt[1,],cex=.8)
text(bb,col.sums-4,labels=tt[2,],cex=0.8)
text(bb,col.sums+4,labels=col.sums,cex=0.8,xpd=T)
