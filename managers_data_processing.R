# Load the CSV file into a dataframe
managers_data <- read.csv("C:/Users/Asus/Downloads/managers.csv")

# Open the dataset in a spreadsheet-style viewer
View(managers_data)

# Count total number of missing (NA) values in the dataset
sum(is.na(managers_data))


# Access the Date column
managers_data$Date

# Check the data type (class) of the Date column
class(managers_data$Date)


# Convert Date column from character/factor to Date format
# Multiple formats are attempted (though only the first valid one is used)
converted_date <- as.Date(managers_data$Date, 
                          format = c("%Y-%d-%m", "%m/%d/%Y", "%Y-%d-%m"))

# View converted dates
converted_date

# Check class after conversion (should be "Date")
class(converted_date)


# Replace original Date column with converted Date values
managers_data$Date <- converted_date

# View updated Date column
managers_data$Date

# Display structure of dataset (data types and columns)
str(managers_data)


# Define a date range
startDate <- as.Date("2018-10-15")
endDate <- as.Date("2018-11-01")

# Filter rows where Date falls within the specified range
new_Data <- managers_data[
  managers_data$Date >= startDate & 
    managers_data$Date <= endDate
]

# View filtered data
new_Data

# Check structure again
str(managers_data)


# Select columns 8 and 9
include_list1 <- managers_data[, 8:9]
include_list1


# Select columns 1–7 and 10–13 (excluding 8 and 9)
include_list2 <- managers_data[, c(1:7, 10:13)]
include_list2


# Logical vector: TRUE for columns named "Q3" or "Q4"
include_list3 <- names(managers_data) %in% c("Q3", "Q4")
include_list3


# Attempt to subset dataset using logical vector (incorrect usage)
# This actually filters rows instead of columns — likely unintended
new_Data1 <- managers_data[(include_list3)]
new_Data1


# Display all column names
names(managers_data)

# Logical vector for selecting specific columns by name
include_list4 <- names(managers_data) %in% 
  c("X", "Date", "Country", "Gender", "Age", 
    "Q1", "Q2", "Q5", "AgeCat", "Answer.total", "mean.value")

include_list4


# Remove columns 8 and 9 using negative indexing
new_Data <- managers_data[, c(-8, -9)]
new_Data


# Attach dataset so column names can be used directly (not recommended generally)
attach(managers_data)

# Subset rows where Age > 35 OR Age < 24
# Select only Q1–Q4 columns
subset(managers_data, Age > 35 | Age < 24, 
       select = c(Q1, Q2, Q3, Q4))

# Detach dataset to avoid conflicts
detach(managers_data)


# Filter rows where Gender = "M" AND Age > 25
# Select columns from Gender to Q4
new_Data <- subset(managers_data, 
                   Gender == "M" & Age > 25, 
                   select = c(Gender:Q4))

new_Data


# Take a random sample of 3 rows (without replacement)
my_sample <- managers_data[
  sample(1:nrow(managers_data), 3, replace = FALSE)
]

my_sample


# Take a random sample of 10 rows (with replacement, duplicates possible)
my_sample_1 <- managers_data[
  sample(1:nrow(managers_data), 10, replace = TRUE)
]

my_sample_1


# Save the random sample to a CSV file
write.csv(my_sample, file = "random sample.csv")


# Attach dataset again
attach(managers_data)

# Sort dataset by Age in ascending order
new_Data <- managers_data[order(Age),]

# View sorted data
new_Data


new_Data <- managers_data[order(Gender, Age),]
new_Data



