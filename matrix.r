x <- matrix(1:9,3)
print(x)
solve(x)                                # error

y <- matrix(1:4,2)
print(y)
iy <- solve(y)
y * iy
y %*% iy                                # matrix multiplication
