# ways to define vectors

assign('a', c(10,150,30,45,20.5))
b <- c(10,150,30,45,20.5)
c = c(10,150,30,45,20.5)

# mathematics operations
(x <- c(10.5, 17.25, 5.8, 5.3, 87.0))
(c(58, 69.2, 1.25) -> y)

(x+1)
(x*5)
(1/x)

(z <- x + 5)

z <- c(x, 0, x)
z

################

p <- c(1,2,4,7)
q <- c(5,5,5,5)

p+q
p-q

###############

i <- c(1,2,3,4,5,6)
j <- c(1,2,3)


(i + j)

##############

r <- c(1,2,3)
s <- c(1,2,3,4,5,6)

(r + s)

##############

install.packages('swirl')
library(swirl)
swirl()
