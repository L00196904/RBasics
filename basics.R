# Create an integer variable using the L suffix
i <- 5L
i

# Check if the variable is of integer type
is.integer(i)




# Create an integer value
x1 <- 4L
# Check the class of x1 (should be integer)
class(x1)

# Create a numeric (double) value
x2 <- 2.8
# Check the class of x2 (numeric/double)
class(x2)

# Multiply integer and numeric values
x3 <- x1 * x2
# Display the result
x3

# Check the class of the result (will be numeric because one operand is numeric)
class(x3)

# Check if the result is an integer (expected FALSE)
is.integer(x3)





# Define two integer variables
x4 <- 2L
x5 <- 5L

# Divide two integers
x6 <- x4 / x5

# Check the class of the result (division returns numeric, not integer)
class(x6)

# Check if x6 is integer (expected FALSE)
is.integer(x6)





# Create a character string
x <- 'data'

# Print the value
x

# Check the class (character)
class(x)

# Convert the character variable into a factor
y <- factor(x)

# Print the factor
y

# Check the class (factor)
class(y)





# Count the number of characters in x
nchar(x)

# Count characters in a literal string
nchar('hello')

# nchar() coerces numeric values to character before counting digits
nchar(3)
nchar(505)

# This will produce an error because nchar() expects character input
# and factors must be converted to character first
nchar(y) #'nchar()' requires a character vector





# Create a date as a character string
d <- '2019-03-08'

# Check its class (character)
class(d)

# Convert the character string to a Date object
date <- as.Date('2019-03-08')

# Print the date
date

# Check the class (Date)
class(date)

# Convert the Date to numeric (number of days since 1970-01-01)
as.numeric(date)

# Create a POSIXct date-time object
date1 <- as.POSIXct('2019-03-08 09:00')

# Print the date-time
date1

# Check the class (POSIXct/POSIXt)
class(date1)

# Convert the date-time to numeric (seconds since 1970-01-01)
as.numeric(date1)





# Logical TRUE is treated as 1 in numeric operations
TRUE * 5

# Logical FALSE is treated as 0
FALSE * 5

# Create a logical variable
k <- TRUE

# Check the class (logical)
class(k)

# Check if the variable is logical
is.logical(k)