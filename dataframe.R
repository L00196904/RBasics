Subject <- c(1:7)
Gender <-  c(rep('Male', times=3), NA, rep('Female', times=3))
Age <- c(23,34,32,54,65,45,35)
Weight <- c(67.5, NA, 63.7, 56.8, 89.9, 87.5, 77.5)

Trial <- data.frame(Subject, Gender, Age, Weight)
View(Trial)

# output the data from 4th row in 3rd column
# Trial[row number, column number]
(Trial[4,3])

# output 3rd column since its not specified any row
(Trial[,3])


install.packages('data.table')
library(data.table)
setnames(Trial, old='Subject', new='Participant')
View(Trial)

# find the rows which has NA values (incomplete cases)
Trial[!complete.cases(Trial),]

# find the rows with complete cases (No NA values)
(Trial_1 <- Trial[complete.cases(Trial),])


# set weight of participant 2 to 65.0
# data frame$column[data frame$row==row number]

Trial$Weight[Trial$Participant==2]
Trial$Weight[Trial$Participant==2] <- 65


Trial$Gender[Trial$Participant==4] <- 'Female'




