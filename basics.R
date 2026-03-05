i <- 5L
i

is.integer(i)

#####################

x1 <- 4L
class(x1)

x2 <- 2.8
class(x2)

x3 <- x1 * x2
x3
class(x3)
is.integer(x3)

####################

x4 <- 2L
x5 <- 5L

x6 <- x4 / x5
class(x6)
is.integer(x6)

###################

x <- 'data'
x
class(x)

y <- factor(x)
y
class(y)

#################

nchar(x)
nchar('hello')
nchar(3)
nchar(505)
nchar(y) #'nchar()' requires a character vector

#################

d <- '2019-03-08'
class(d)

date <- as.Date('2019-03-08')
date
class(date)

as.numeric(date)


date1 <- as.POSIXct('2019-03-08 09:00')
date1
class(date1)
as.numeric(date1)

##################

TRUE * 5
FALSE * 5

k <- TRUE
class(k)
is.logical(k)