Manager <- c(1:5)
Date <- c('2018-15-10','11/01/2018','2018-21-10','2018-28-10','05/01/2018')
Country <- c(rep('US', times=2), rep('IRL', times=3))
Gender <- c('M', 'F', 'F', 'M', 'F')
Age <- c(32,45,25,39,NA)
Q1 <- c(5, rep(3, times=3), 2)
Q2 <- c(4,5,5,3,2)
Q3 <- c(5,2,5,4,1)
Q4 <- c(rep(5, times=3), NA, 2)
Q5 <- c(5,5,2,NA,1)

Survey <- data.frame(Manager, Date, Country, Gender, Age, Q1, Q2, Q3, Q4, Q5)
View(Survey)

Survey[1:5,]


# display the internal structure of an object.
str(Survey)

#Survey$Age[Survey$Age == 99] <- NA

# Create a new data set by removing the Manager column using its name
(Survey_1 <- subset(Survey, select = -Manager))
# Create another data set by removing the first column using its index
(Survey_2 <- subset(Survey, select = -1))
# Create another data set by selecting columns 2 to 10
(Survey_3 <- Survey[, 2:10])

# Create a new column "AgeCat" to categorize ages
Survey$AgeCat[Survey$Age <= 25] <- "Young"
Survey$AgeCat[Survey$Age >= 45 ] <- "Elder"

Survey$AgeCat[Survey$Age >= 26 & Survey$Age <= 44] <- "Middle Aged"


Survey$AgeCat[is.na(Survey$Age)] <- "Elder"

class(Survey$AgeCat)

# Convert AgeCat into an ordered factor
# This means the categories have a logical order
Survey$AgeCat <- factor(Survey$AgeCat, order=TRUE, levels = c('Young', 'Middle Aged', 'Elder'))

# Check the updated structure of the dataset
str(Survey)


Survey$Summary_col <- Survey$Q1 + Survey$Q2 + Survey$Q3 + Survey$Q4 + Survey$Q5

Survey$Mean_col <- Survey$Summary_col / 5

# rowMeans calculates the mean across specified columns
# mean_value <- rowMeans(Survey[5:9])
# Survey <- data.frame(Survey, mean_value)

# Rename column 13 to "mean value"
names(Survey)[13] <- "mean value"
names(Survey)[12] <- "answer total"

str(Survey)

# Calculate the sum of selected columns:
# Columns 5–10 (Age and Q1–Q5) and columns 12–13 (answer total and mean value)
column_summary <- colSums(Survey[,c(5:10, 12:13)],na.rm=TRUE)
column_summary

