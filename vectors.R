####### Ways to define vectors in R ######

# Using assign() function to create a vector and store it in variable 'a'
assign('a', c(10,150,30,45,20.5))

# Using the <- assignment operator (most common method)
b <- c(10,150,30,45,20.5)

# Using = assignment operator (also valid but less common in R scripts)
c = c(10,150,30,45,20.5)





##### Mathematical operations with vectors ######

# Create vector x and print it
(x <- c(10.5, 17.25, 5.8, 5.3, 87.0))

# Create vector y using rightward assignment operator -> and print it
(c(58, 69.2, 1.25) -> y)

# Add 1 to each element of vector x
(x + 1)

# Multiply each element of x by 5
(x * 5)

# Take the reciprocal of each element in x (1 divided by each value)
(1 / x)

# Add 5 to each element in x and store result in vector z
(z <- x + 5)

# Concatenate vector x, the value 0, and x again into a new vector z
z <- c(x, 0, x)

# Display the new vector z
z





###### Vector arithmetic with vectors of equal length ######

# Define vector p
p <- c(1,2,4,7)

# Define vector q
q <- c(5,5,5,5)

# Element-wise addition
p + q

# Element-wise subtraction
p - q




###### Vector recycling example ######

# Create vector i
i <- c(1,2,3,4,5,6)

# Create shorter vector j
j <- c(1,2,3)

# When vectors have different lengths, R recycles the shorter vector
# j becomes (1,2,3,1,2,3) to match the length of i
(i + j)




###### Another recycling example ######

# Define vector r (length 3)
r <- c(1,2,3)

# Define vector s (length 6)
s <- c(1,2,3,4,5,6)

# r will be recycled to (1,2,3,1,2,3)
(r + s)




# Install the 'swirl' package (interactive R learning tool)
install.packages('swirl')

# Load the swirl package
library(swirl)

# Start swirl interactive R tutorials
swirl()