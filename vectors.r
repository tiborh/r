#!/usr/bin/env Rscript

cat("full:\n")
print(letters)

cat("access certain elements:\n")
cat("sequence:\n")
print(letters[1:5])
cat("sequence: by 2\n")
print(letters[seq(to=length(letters),by=2)])
cat("sampling:\n")
print(letters[sample(c(F,T),size=length(letters),replace=T)])
print(letters[sample(1:length(letters),5)])
print(sample(letters,5))
cat("Randomise order by indexing: v[sample(1:len,len)]\n")
print(letters[sample(1:length(letters),length(letters))])
cat("negative index [-1]:",letters[-1],"\n")
cat("negative indices [c(-1,-3,-5)]:",letters[c(-1,-3,-5)],"\n")

cat("Vector algebra:\n")
a = 1:5
cat("a ==",a,"\n")
cat("multiplication:",a*a,"\n")
cat("division (a/rev(a)):",a/rev(a),"\n")

cat("Recycling:\n")
b = 1:10
cat("b ==",b,"\n")
cat("a + b ==",a+b,"\n")

rb <- sample(b,length(b))
cat("Randomised b:",rb,"\n")
cat("Sorted b:",sort(b),"\n")
cat("Rev-sorted b:",sort(b,decreasing=T),"\n")

a=1:100
a.df <- data.frame(a=a,a_per_rev_a=a/rev(a),len_a_per_a=length(a)/a)
plot(a,a/rev(a),col="red")
points(a,length(a)/a,col="blue")
