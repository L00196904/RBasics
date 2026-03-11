# Create a numeric vector x
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)

# Create vector y by combining x, 0, and x again
(y <- c(x,0,x))

# Create vector z using element-wise operations:
# multiply x by 2, add corresponding elements of y, then add 1
(z <- 2*x + y + 1)

# Calculate the product of all elements in z
prod(z)

# Calculate mean (average) of z
(mean(z))

# Calculate median (middle value) of z
(median(z))

# Try to compute mode of z
# NOTE: R does not have a built-in statistical mode function.
# This returns the storage type instead (usually "numeric").
(mode(z))

# Calculate variance of z
(var(z))

# Sort the elements of z in ascending order
(sort(z))

# Store sorted z into a new variable
sorted_z <- sort(z)

# Display sorted values
sorted_z

# Show class of the sorted vector
class(sorted_z)

# Show internal data type of the vector
typeof(sorted_z)


# Sort z in descending order
sorted_z1 <- sort(z, decreasing = TRUE)
sorted_z1


# Generate integers from 1 to 30
(1:30)

# Multiply sequence 1 to 15 by 2
(2*1:15)

# Generate integers from 30 down to 1
(30:1)


# Generate sequence from 1 to 20
(seq(1,20))

# Generate sequence from 20 down to 1
(seq(20,1))

# Generate sequence from 1 to 20 with step size 2
(seq(1,20, by=2))

# Generate 30 equally spaced numbers between 1 and 20
(seq(1,20, length.out=30))

# Multiply sequence 1 to 20 by 2
(2*seq(1,20))


# Generate sequence from -5 to 5 with step size 0.2
seq(-5, 5, by=0.2) -> s3
s3

# Create sequence starting at 5 with step size 0.2
# and total length of 51 elements
(s4 <- seq(length=51, 5, by=0.2))


# Generate sequence from -100 to 100 with step size 0.6
seq3 <- seq(from=-100, to=100, by=0.6)
seq3

# Calculate mean of seq3
mean(seq3)

# Sort seq3 in descending order
(sort(seq3, decreasing =TRUE))



# Create vector y
y <- c(1,4,6,9)

# Create sequence from 0 to 20 with length equal to length(y)
(x <- seq(from=0, to=20, along.with=y))

# Open help documentation for rep() function
?rep


# Create vector w
w <- c(10.4, 5.6, 3.1, 6.4, 21.7)

# Repeat entire vector w five times
(s5 <- rep(w, times=5))

# Repeat each element of w five times before moving to next
(s6 <- rep(w, each=5))


# Logical test: check which values of w are greater than 13
temp <- w > 13
temp


# Display vector s6
s6

# Check if elements in s6 are NA (missing values)
is.na(s6)

# Create vector containing numbers and a missing value
(z <- c(1:4, NA))

# Identify which elements are NA
(result <- is.na(z))


# Incorrect way to test NA (will return NA results)
x1 <- w == NA
x1

# Correct way: check NA values in x1
is.na(x1)


# Create vector x with a zero included
x <- c(10.4, 5.6, 0.0, 3.1, 6.4, 21.7)

# Remove NA values from x (none here, but shown as example)
y <- x[!is.na(x)]
y

# Add 1 to x, then select values that:
# 1. Are not NA
# 2. Are greater than 0
(x+1)[(!is.na(x)) & x>0] -> z
z


# Display first 10 elements of x (if available)
(x[1:10])

# Get last element of x
(tail(x, n=1))