############################################################
# 1. VARIABLES AND ASSIGNMENT
############################################################

# The assignment operator "<-" stores a value inside a variable.
# Here, the numeric value 2 is stored in variable x.

x <- 2

# Typing the variable name prints the value.
x


# Store value 5 inside variable y.
y <- 5
y


# Multiple assignment:
# Both variables a and b receive the same value 7.
a <- b <- 7

a
b


# Remove variable a from memory using rm().
rm(a)

# This will generate an error because variable a no longer exists.
a


############################################################
# 2. DATA TYPES IN R
############################################################

# R automatically stores numbers as numeric (double) by default.
x <- 5

# class() shows the data type.
class(x)

# Check whether x is numeric.
is.numeric(x)


# Integer values must include suffix "L".
i <- 5L

# Print integer value.
i

# Check whether variable is integer type.
is.integer(i)


# Create integer variable.
x1 <- 4L
class(x1)

# Create numeric variable.
x2 <- 2.8
class(x2)


# When integer and numeric are combined,
# R automatically converts result into numeric.
x3 <- x1 * x2

x3

# Check result type.
class(x3)


# Division always returns numeric even if both numbers are integers.
x4 <- 2L
x5 <- 5L

x6 <- x4 / x5

x6

class(x6)


############################################################
# 3. CHARACTER AND FACTOR DATA
############################################################

# Character strings must be inside quotation marks.
x <- "data"

x


# factor() converts character values into categorical data.
# Factors are commonly used in statistics and machine learning.
y <- factor("data")

y


############################################################
# 4. STRING FUNCTIONS
############################################################

# nchar() counts number of characters.

nchar(x)

# Counts letters in word "hello".
nchar("hello")

# Numeric values are automatically converted into text.
nchar(3)

nchar(505)

# Works with factor values as well.
nchar(y)


############################################################
# 5. DATE AND TIME
############################################################

# Convert text into Date object.
date1 <- as.Date("2019-03-08")

date1

# Check class of date object.
class(date1)


# Convert date into numeric representation.
# Dates are stored as number of days since 1970-01-01.
as.numeric(date1)


# POSIXct stores date and time together.
date2 <- as.POSIXct("2019-03-08 09:00")

date2

class(date2)

# Converts datetime into seconds since 1970-01-01.
as.numeric(date2)


############################################################
# 6. LOGICAL VALUES
############################################################

# TRUE behaves like 1 in calculations.
TRUE * 5

# FALSE behaves like 0.
FALSE * 5


# Logical variable.
k <- TRUE

# Check class.
class(k)

# Check whether logical.
is.logical(k)


############################################################
# 7. VECTORS
############################################################

# c() combines multiple values into a vector.

(assign('a', c(10, 150, 30, 45, 20.3)))

(b <- c(10, 150, 30, 45, 20.3))

(c = c(10, 150, 30, 45, 20.3))


# Numeric vector.
x <- c(10.4, 5.6, 3.1, 6.4, 21.78)

x


# Multiply every element by 5.
x * 5


# Find reciprocal of each element.
1 / x


# Add 5 to each element.
y <- x + 5

y


# Combine vectors together.
z <- c(x, 0, x)

z


############################################################
# 8. VECTOR RECYCLING
############################################################

# Vector recycling happens when vectors have different lengths.

p <- c(1,2,3)
q <- c(1,2,3,4,5,6)

# Shorter vector p repeats automatically.
p + q

p - q

p * q

p / q


############################################################
# 9. INSTALLING AND LOADING PACKAGES
############################################################

# Install package from CRAN repository.
install.packages("swirl")

# Load package into R session.
library(swirl)

# Start swirl interactive tutorial.
swirl()


############################################################
# 10. VECTOR STATISTICS
############################################################

x <- c(10.4, 5.6, 3.1, 6.4, 21.7)

# Combine vectors.
y <- c(x, 0, x)

# Perform vector arithmetic.
z <- 2 * x + y + 1

x
y
z


# Smallest value.
min(z)

# Largest value.
max(z)

# Minimum and maximum together.
range(z)

# Number of elements.
length(z)

# Sum of elements.
sum(z)

# Product of elements.
prod(z)

# Average value.
mean(z)

# Variance of data.
var(z)


# Sort values in ascending order.
sort(z)

sorted_z <- sort(z)

sorted_z


# Class of sorted vector.
class(sorted_z)

# Storage type.
typeof(sorted_z)


# Sort in descending order.
sorted_z1 <- sort(z, decreasing = TRUE)

sorted_z1


############################################################
# 11. SEQUENCES
############################################################

# Create sequence from 1 to 30.
1:30

# Reverse sequence.
30:1

# Multiply sequence by 2.
2 * 1:10


# seq() creates custom sequences.

# Sequence from 1 to 20.
seq(1,20)

# Descending sequence.
seq(20,1)

# Sequence with step size of 2.
seq(1,20,by=2)

# Generate 30 equally spaced values.
seq(1,20,length.out=30)

# Multiply sequence.
2 * seq(1,20)

# Decimal sequence.
seq(-5,5,by=.2) -> s3

s3


# Sequence with fixed length.
s4 <- seq(length=51,5,by=.2)

s4


# Create sequence from -100 to 100 with interval 0.6.
seq3 <- seq(from=-100,to=100,by=.6)

seq3

# Mean of sequence.
mean(seq3)

# Sort descending.
sort(seq3,decreasing = TRUE)


# along.with creates sequence matching vector length.
y <- c(1,4,6,9)

x <- seq(from=0,to=20,along.with=y)

x


############################################################
# 12. REP FUNCTION
############################################################

x <- c(10.4,5.6,3.1,6.4,21.7)

# Repeat entire vector 5 times.
s5 <- rep(x,times=5)

s5


# Repeat each element 5 times before moving to next.
s6 <- rep(x,each=5)

s6


############################################################
# 13. LOGICAL VECTORS AND NA VALUES
############################################################

# Returns TRUE for values greater than 13.
temp <- x > 13

temp


# Check missing values.
is.na(s6)


# Create vector with missing value.
z <- c(1:4,NA)

# Detect missing values.
result <- is.na(z)

result


# Incorrect way to compare NA.
x1 <- x == NA

x1


# Correct way to identify missing values.
is.na(x)


############################################################
# 14. FILTERING VECTORS
############################################################

x <- c(10.4,5.6,0.0,3.1,6.4,21.7)

# Keep only non-missing values.
y <- x[!is.na(x)]

y


# Select values that are:
# 1. Not missing
# 2. Greater than 0
# Then add 1 to selected values.
(x + 1)[(!is.na(x)) & x > 0] -> z

z


############################################################
# 15. VECTOR INDEXING
############################################################

# Positive indexing selects elements.
x[1:10]

# Select 6th element.
x[6]


# Negative indexing removes elements.
y <- x[-(1:4)]

y


############################################################
# 16. FACTOR VECTORS
############################################################

# Vector containing sports names.
vec1 <- c(
  "Hockey",
  "Football",
  "Baseball",
  "Curling",
  "Rugby",
  "Hurling",
  "Basketball",
  "Tennis",
  "Cricket",
  "Lacrosse"
)

vec1


# Add additional sports.
vec2 <- c(
  vec1,
  "Hockey",
  "Lacrosse",
  "Hockey",
  "Water Polo",
  "Hockey",
  "Lacrosse"
)

vec2


# Select specific elements.
vec3 <- vec2[c(1,3,6)]

vec3


# Convert to factor.
vec3_factor <- as.factor(vec3)

vec3_factor


# Check class.
class(vec3)


# Ordered factor example.
factor(
  x = c(
    "Degree",
    "High School",
    "Masters",
    "Doctorate"
  ),
  levels = c(
    "High School",
    "Degree",
    "Masters",
    "Doctorate"
  ),
  ordered = TRUE
)


############################################################
# 17. DATA FRAMES
############################################################

# Create columns as vectors.
Subject <- c(1:7)

Gender <- c(
  'Male',
  'Male',
  'Male',
  NA,
  'Female',
  'Female',
  'Female'
)

Age <- c(23,34,32,54,65,45,35)

Weight <- c(67.5,NA,63.7,56.8,89.9,87.5,77.5)


# Combine vectors into data frame.
Trial <- data.frame(
  Subject,
  Gender,
  Age,
  Weight
)

# Open spreadsheet-style viewer.
View(Trial)


# Access row 4 column 3.
Trial[4,3]


# Access entire 3rd column.
Trial[,3]


############################################################
# 18. DATA.TABLE PACKAGE
############################################################

# Load package.
library(data.table)

# Rename column Subject to Participant.
setnames(
  Trial,
  old='Subject',
  new='Participant'
)

View(Trial)


# Show rows with missing values.
Trial[!complete.cases(Trial),]


############################################################
# 19. MODIFYING DATA FRAME VALUES
############################################################

# Display weight of participant 2.
Trial$Weight[Trial$Participant == 2]


# Update weight value.
Trial$Weight[Trial$Participant == 2] <- 65.0


# Update gender of participant 4.
Trial$Gender[Trial$Participant == 4] <- 'Female'


############################################################
# 20. BASIC VECTOR OPERATIONS
############################################################

x <- c(3,12,7)
y <- c(4,9,11)

x
y


# Add vectors element by element.
z <- x + y

z


# Increase all x values by 2.
x <- x + 2

# Increase all y values by 50.
y <- y + 50

x
y


# Sum all elements.
sum(x)

# Mean of elements.
mean(y)


############################################################
# 21. HANDLING NA VALUES
############################################################

n <- c(1,2,NA,3,4)

# Ignore missing values during calculation.
sum(n,na.rm = TRUE)


# Check internal storage type.
typeof(n)

typeof(x)


############################################################
# 22. COMPARISON OPERATORS
############################################################

# Greater than comparison.
x > y

# Less than comparison.
x < y

# Not equal comparison.
x != y

# Equal comparison.
x == y


############################################################
# 23. APPEND FUNCTION
############################################################

u <- c(5:20)

u


# Append first lowercase letter.
u <- append(u,letters[1])

u


# Append first five lowercase letters.
u <- append(u,letters[1:5])

u


############################################################
# 24. MERGING DATASETS
############################################################

# Read CSV datasets.
new_managers_data <- read.csv("MoreData.csv")

managers_data <- read.csv("managers.csv")


# Examine structure of datasets.
str(new_managers_data)

str(managers_data)


# Show column names.
names(managers_data)

names(new_managers_data)


# Reorder columns so both datasets match.
new_managers_data <- new_managers_data[,c(
  "Date",
  "Country",
  "Gender",
  "Age",
  "Q1",
  "Q2",
  "Q3",
  "Q4",
  "Q5"
)]

new_managers_data


# Preview datasets.
head(managers_data)

head(new_managers_data)


# Combine rows from both datasets.
rbind(managers_data,new_managers_data)

############################################################
# 25. CREATE NEW COLUMNS
############################################################

# attach() allows direct access to column names
# without writing dataframe name repeatedly.
attach(new_managers_data)

# Create Age Category column based on age ranges.

# If age is 45 or above → Elder
new_managers_data$AgeCat[Age >= 45] <- "Elder"

# If age is between 26 and 44 → Middle Aged
new_managers_data$AgeCat[
  Age >= 26 & Age <= 44
] <- "Middle Aged"

# If age is 25 or below → Young
new_managers_data$AgeCat[Age <= 25] <- "Young"

# Replace missing age values with Elder category
new_managers_data$AgeCat[
  is.na(Age)
] <- "Elder"

# detach() removes dataframe from search path
detach(new_managers_data)

new_managers_data


# Create total score and mean score columns
attach(new_managers_data)

# Add Q1–Q5 values row-wise
new_managers_data$Answer.total <-
  Q1 + Q2 + Q3 + Q4 + Q5

# rowMeans() calculates average for each row
new_managers_data$mean.value <-
  rowMeans(new_managers_data[5:9])

detach(new_managers_data)

# Display first few rows
head(new_managers_data)


############################################################
# 26. DATE CONVERSION
############################################################

# Check structure of date columns
str(managers_data$Date)

str(new_managers_data$Date)


# Convert character dates into Date type
converted_date <- as.Date(
  managers_data$Date,
  format = c(
    "%Y-%d-%m",
    "%m/%d/%Y",
    "%Y-%d-%m"
  )
)

converted_date

# Confirm data type
class(converted_date)

# Replace original Date column
managers_data$Date <- converted_date


# Convert second dataset dates
formatted_date <- as.Date(
  new_managers_data$Date,
  format = "%m/%d/%Y"
)

formatted_date

class(formatted_date)

new_managers_data$Date <- formatted_date


############################################################
# 27. MERGE DATA FRAMES
############################################################

# rbind() merges data vertically.
# Both datasets must have same structure.
managers_data <- rbind(
  managers_data,
  new_managers_data
)

managers_data


############################################################
# 28. MISSING DATA HANDLING
############################################################

# Reload managers dataset
managers_data <- read.csv("managers.csv")

managers_data


# na.omit() removes rows containing NA values.
new_data <- na.omit(managers_data)

new_data


# complete.cases() returns TRUE if row has no missing values.
complete_data <- complete.cases(managers_data)

complete_data


# Count number of complete rows
sum(complete_data)


# Extract rows with complete data only
complete_data <- managers_data[
  complete.cases(managers_data),
]

complete_data

# Count rows
nrow(complete_data)


# Display rows containing missing values
managers_data[
  !complete.cases(managers_data),
]


# Store incomplete rows separately
missing_data <- managers_data[
  !complete.cases(managers_data),
]

missing_data

# Count incomplete rows
nrow(missing_data)


# Count missing values in Age column
sum(is.na(managers_data$Age))


# Calculate proportion of missing values
mean(is.na(managers_data$Age))


# Mean proportion of incomplete rows
mean(!complete.cases(managers_data))


############################################################
# 29. MICE PACKAGE
############################################################

# Install package for missing data imputation
install.packages("mice")

# Load package
library(mice)

# Show missing data pattern
md.pattern(managers_data)


############################################################
# 30. VIM PACKAGE
############################################################

# Install visualization package
install.packages("VIM")

# Load package
library(VIM)

# aggr() visualizes missing values
missing_values <- aggr(
  managers_data,
  prop = FALSE,
  numbers = TRUE
)

# Summary of missing data
summary(missing_values)


# matrixplot() creates heatmap-style visualization
matrixplot(managers_data)


############################################################
# 31. CREATE MANAGERS DATASET
############################################################

# Create vectors for each column
Manager <- c(1:5)

Date <- c(
  "2018-15-10",
  "2018-01-11",
  "2018-21-10",
  "2018-28-10",
  "2018-01-05"
)

Country <- c(
  "US",
  "US",
  "IRL",
  "IRL",
  "IRL"
)

Gender <- c(
  "M",
  "F",
  "F",
  "M",
  "F"
)

# 99 represents invalid age data
Age <- c(32,45,25,39,99)

Q1 <- c(5,3,3,3,2)
Q2 <- c(4,5,5,3,2)
Q3 <- c(5,2,5,4,1)

# NA indicates missing data
Q4 <- c(5,5,5,NA,2)
Q5 <- c(5,5,2,NA,1)


# Combine vectors into dataframe
managers_data <- data.frame(
  Manager,
  Date,
  Country,
  Gender,
  Age,
  Q1,
  Q2,
  Q3,
  Q4,
  Q5
)

View(managers_data)

# Examine structure
str(managers_data)


############################################################
# 32. RECODING DATA
############################################################

# Replace invalid age value 99 with NA
managers_data$Age[
  managers_data$Age == 99
] <- NA

managers_data


############################################################
# 33. REMOVE COLUMNS
############################################################

# Remove Manager column using subset()
managers_data_1 <- subset(
  managers_data,
  select = -Manager
)

managers_data_1


# Remove first column by index
managers_data_2 <- subset(
  managers_data,
  select = -1
)

managers_data_2


############################################################
# 34. CREATE AGECAT COLUMN
############################################################

# Create placeholder column
managers_data$AgeCat <- 5

managers_data


# Replace placeholder values
managers_data$AgeCat <- c(1,2,3,4,5)

managers_data


# Remove AgeCat column again
managers_data <- managers_data[,c(1:9)]


# Assign Elder category
managers_data$AgeCat[
  managers_data$Age >= 45
] <- "Elder"


# Assign Middle Aged category
managers_data$AgeCat[
  managers_data$Age >= 26 &
    managers_data$Age <= 44
] <- "Middle Aged"


# Assign Young category
managers_data$AgeCat[
  managers_data$Age <= 25
] <- "Young"


# Replace NA ages with Elder
managers_data$AgeCat[
  is.na(managers_data$Age)
] <- "Elder"

managers_data


# Convert AgeCat into ordered factor
managers_data$AgeCat <- factor(
  managers_data$AgeCat,
  order = TRUE,
  levels = c(
    "Young",
    "Middle Aged",
    "Elder"
  )
)

# Check class
class(managers_data$AgeCat)


############################################################
# 35. SUMMARY & MEAN COLUMNS
############################################################

# Create total score column
managers_data$summary_col <-
  managers_data$Q1 +
  managers_data$Q2 +
  managers_data$Q3 +
  managers_data$Q4 +
  managers_data$Q5

managers_data


# Calculate row means
mean_value <- rowMeans(
  managers_data[5:9]
)


# Add mean values to dataframe
managers_data <- data.frame(
  managers_data,
  mean_value
)

managers_data


# Rename columns
names(managers_data)[12] <- "mean value"

names(managers_data)[11] <- "Answer total"


# Examine structure
str(managers_data)


############################################################
# 36. COLUMN SUMMARY
############################################################

# Open help page
help("colSums")


# colSums() calculates total of selected columns
column_summary <- colSums(
  managers_data[,c(4:9,11:12)],
  na.rm = TRUE
)

column_summary


############################################################
# 37. SUBSETTING DATA
############################################################

# Load dataset
managers <- read.csv(
  "RPrograming_2025/managers (3).csv"
)

managers


# %in% checks whether column names match values
include_list <- names(managers) %in% c(
  "Q3",
  "Q4"
)

include_list


# Extract selected columns
new_data <- managers[(include_list)]

new_data


# Extract rows where Age >35 or Age <24
# Select only Q1-Q4 columns
new_data <- subset(
  managers,
  managers$Age >= 35 |
    managers$Age < 24,
  select = c(Q1,Q2,Q3,Q4)
)

new_data


############################################################
# 38. RANDOM SAMPLING
############################################################

# Random sample WITHOUT replacement
# Same row cannot appear twice
my_sample <- managers[
  sample(
    1:nrow(managers),
    3,
    replace = FALSE
  ),
]

my_sample


# Random sample WITH replacement
# Same row can appear multiple times
my_sample <- managers[
  sample(
    1:nrow(managers),
    3,
    replace = TRUE
  ),
]

my_sample


############################################################
# 39. SORTING DATA
############################################################

attach(managers_data)

# Sort rows by Age
new_data <- managers_data[
  order(Age),
]

new_data


# Sort by Gender then Age
new_data <- managers_data[
  order(Gender,Age),
]

new_data

detach(managers_data)


############################################################
# 40. SAVE CSV FILE
############################################################

# Export dataframe to CSV file
write.csv(
  my_sample,
  file = "random sample.csv"
)


############################################################
# 41. PLOTTING AND CHARTS
############################################################

# Create vectors
dose <- c(20,30,40,45,60)

drugA <- c(16,20,27,40,60)

drugB <- c(15,18,25,31,40)

opinion <- c(
  "Excellent",
  "No effect",
  "Some effect",
  "No effect",
  "Some effect"
)


# Create dataframe
drugs <- data.frame(
  dose,
  drugA,
  drugB,
  opinion
)

drugs

# Show structure
str(drugs)


# General plot of dataframe
plot(drugs)

attach(drugs)


# Plot dose with points connected by lines
plot(
  dose,
  type="o",
  col="blue"
)


# type = "b" means both points and lines
plot(
  dose,
  type="b",
  col="green"
)


############################################################
# 42. FACTOR PLOTS
############################################################

# Convert opinion column into factor
drugs$opinion <- as.factor(
  drugs$opinion
)

# Plot factor against numeric data
plot(
  drugs$opinion,
  drugs$drugA,
  type="b",
  col="green"
)

# Plot categorical counts
plot(drugs$opinion)


# las controls label direction
plot(drugs$opinion, las=2)


############################################################
# 43. CUSTOMIZED LINE CHARTS
############################################################

# Simple line graph
plot(
  dose,
  drugB,
  type="b"
)


# Dashed line with triangle points
plot(
  dose,
  drugA,
  type="b",
  lty=2,
  pch=17
)


# Custom line chart
plot(
  drugA,
  type="b",
  lty=3,
  lwd=3,
  pch=19,
  cex=1,
  ylim=c(0,100)
)

# Add title
title(
  main="Drug dosage",
  col.main="blue",
  font.main=4
)


# Add second line to existing graph
lines(
  drugB,
  type="o",
  pch=22,
  lty=2,
  col="red"
)


############################################################
# 44. GRAPH RANGE & AXES
############################################################

# Determine graph range automatically
graph_range <- range(
  0,
  drugA,
  drugB
)

graph_range


# Create empty graph with custom range
plot(
  drugA,
  type="o",
  col="blue",
  ylim=graph_range,
  axes=FALSE,
  ann=FALSE
)


# Add second line
lines(
  drugB,
  type="o",
  pch=22,
  lty=2,
  col="red"
)


# Create x-axis
axis(
  1,
  at=1:5,
  lab=c(
    "20 ml",
    "40 ml",
    "60 ml",
    "80 ml",
    "100 ml"
  )
)


# Create y-axis
axis(
  2,
  las=1,
  at=5 * 0:graph_range[2]
)


# Draw box around chart
box()


# Add x-axis label
title(
  xlab="Dosage (ml)",
  col.lab=rgb(0,0.5,0)
)

# Add y-axis label
title(
  ylab="Drugs",
  col.lab=rgb(0,1,0)
)


# Add legend
legend(
  1,
  graph_range[2],
  c("Drug A","Drug B"),
  cex=0.8,
  col=c("blue","red"),
  pch=21:22,
  lty=1:2
)


# Add graph title
title(
  main="Drug dosage",
  col.main="red",
  font.main=4
)


############################################################
# 45. HISTOGRAMS
############################################################

# Histogram of miles per gallon
hist(mtcars$mpg)


# Customized histogram
hist(
  mtcars$mpg,
  breaks=12,
  col="red",
  xlab="Miles Per Gallon",
  main="Coloured histogram with 12 bins"
)


############################################################
# 46. BOXPLOTS
############################################################

# Create boxplot
boxplot(
  mtcars$mpg,
  main="Box plot",
  ylab="Miles per Gallon"
)

# Show statistical details
boxplot.stats(mtcars$mpg)


# Boxplot grouped by cylinder count
boxplot(
  mpg ~ cyl,
  data=mtcars,
  main="Car Mileage Data",
  xlab="Number of Cylinders",
  ylab="Miles Per Gallon"
)


############################################################
# 47. BAR CHARTS
############################################################

# Install package
install.packages("vcd")

# Load package
library(vcd)

View(Arthritis)

# Create frequency table
counts <- table(
  Arthritis$Improved
)

counts


# Vertical bar chart
barplot(
  counts,
  main="Simple Bar Plot",
  xlab="Improvement",
  ylab="Frequency"
)


# Horizontal bar chart
barplot(
  counts,
  main="Horizontal Bar Plot",
  xlab="Frequency",
  ylab="Improvement",
  horiz=TRUE
)


############################################################
# 48. PIE CHARTS
############################################################

# Pie chart data
slices <- c(10,12,4,16,8)

lbls <- c(
  "US",
  "UK",
  "Australia",
  "Germany",
  "France"
)


# Basic pie chart
pie(
  slices,
  labels=lbls,
  main="Simple Pie Chart"
)


# Calculate percentages
pct <- round(
  slices / sum(slices) * 100
)


# Combine labels and percentages
lbls2 <- paste(
  lbls,
  " ",
  pct,
  "%",
  sep=""
)

lbls2


# Pie chart with percentages
pie(
  slices,
  labels=lbls2,
  col=rainbow(length(lbls2)),
  main="Pie Chart with Percentages"
)
