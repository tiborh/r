e0 <- expression(1+1)
e0                                      # expression(1 + 1)
eval(e0)                                # 2

length(ex1 <- expression(1 + 0:9)) # 1
ex1
eval(ex1) # 1:10

length(ex3 <- expression(u, v, 1+ 0:9)) # 3
ex3                                     # expression(u, v, 1 + 0:9)
mode(ex3 [3])   # expression
mode(ex3[[3]])  # call
rm(ex3)
