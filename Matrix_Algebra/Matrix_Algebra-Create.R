library(imager)

im <- load.image("./Matrix_Algebra/einstein.jpg")

plot(im)

M <- grayscale(im) %>% as.matrix
M = M[,rev(1:ncol(M))]

image(M, col = gray((1:100)/100), asp = 1, axes = FALSE)


### Set up


n = nrow(M)
p = ncol(M)

set.seed(123)
A <- diag(rnorm(p))
set.seed(456)
B <- tcrossprod(as.matrix(array(rnorm(25), c(5,5))))
set.seed(789)
x <- abs(rnorm(p))
set.seed(101)
y <- rnorm(n)
set.seed(112)
H <- as.matrix(array(rnorm(n*p), c(n,p)))


### Reverse reverse


svd <- svd(H)

tr <- sum(svd$d)

M = M*tr

M <- M / (100*svd$u)



M <- M/t(tcrossprod(x,y))

evs <- eigen(B)
M <- M/sum(evs$vectors[,3])

det <- det(B)
M <- M - det

Y <- diag(y)

M <- Y %*% M

k <- kronecker(rep(1, n), t(x))

M <- M/k

M <- M %*% solve(A)

write.table(M, "./Matrix_Algebra/img.txt", sep = ",", row.names = FALSE, col.names = FALSE)




