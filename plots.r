## dot plot
x <- seq(0,2*pi,0.01)
y <- sin(x)
z <- cos(x)
a <- tan(x)
#plot(y,main="sin(x)")
plot(x,y,main="sine, cosine, and tangent",asp=c(1,2))
points(x,z,col=c(2))
points(x,a,col=c(4))
legend(5.9, 0.75, c("sin", "cos", "tan"), col = c(1, 2, 4),
       text.col = "green4", pch = c(1, 1, 1),
       merge = TRUE, bg = "gray90")

## matrix plots
e <- matrix(0,10,10)
e[4:5,6:7] = 1
e[c(3,6),5:8] = 0.5
e[4:5,c(5,8)] = 0.5
contour(e)                              # elevation lines on a map
persp(e)                                # perspective view
persp(e,expand=0.4)                     # squish it a little lower
persp(e,expand=0.2)

## using a built-in matrix
str(volcano)                            # 87 by 61
contour(volcano)
persp(volcano,expand=0.2)
image(volcano)                          # heat map

## together with functions
vals <- sample(7:27,10)
names(vals) <- letters[1:10]
barplot(vals,main="Value Distribution Study")
my.mean <- mean(vals)
abline(h = my.mean)
abline(h = median(vals),col=2)
my.dev <- sd(vals)
abline(h = my.mean + my.dev, lty=2)
abline(h = my.mean - my.dev, lty=2)
legend(9, 5, c("mean","median","mean +/- sd"), col = c(1, 2),
       text.col = "blue", lty = c(1, 1, 2),
       merge = TRUE, bg = "gray90")
boxplot(vals)


## factors
num <- 20
maxn <- 50
letrange <- 1:3
x <- sample(1:maxn,num)
y <- sample(1:maxn,num)
t <- sample(letters[letrange],num,replace=T)
tf <- factor(t)
plot(x,y,pch=levels(tf))
plot(x,y,pch=as.integer(tf),col=as.integer(tf)+1,main="Dot and Colour Per Factor")
legend("bottomright", levels(tf), pch=letrange, col=letrange+1)
help(legend)
help(plot)

## same with ggplot2
library(ggplot2)
qplot(x,y)
qplot(x,y,color=tf)                     # introducing groups
help(qplot)
