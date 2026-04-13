new_managers_data <- read.csv("C:/Users/Asus/Downloads/MoreData.csv")
managers_data <- read.csv("C:/Users/Asus/Downloads/managers.csv")

View(new_managers_data)
View(managers_data)


# check the structure of the dataset
str(new_managers_data)
str(managers_data)

# show headers of both dataset
names(new_managers_data)
names(managers_data)


new_managers_data <- new_managers_data[,c( "Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5" )]
new_managers_data

head(new_managers_data)


attach(new_managers_data)
new_managers_data$AgeCat[Age >= 45] <- "Elder"
new_managers_data$AgeCat[Age >= 26 & Age<= 44] <- "Middle Aged"
new_managers_data$AgeCat[Age <= 45] <- "Young"
new_managers_data$AgeCat[is.na(Age)] <- "Elder"
detach(new_managers_data)

new_managers_data

attach(new_managers_data)
new_managers_data$Answer.total <- Q1 + Q2 + Q3 + Q4 + Q5
new_managers_data$mean.value <- new_managers_data$Answer.total / 5
detach(new_managers_data)



converted_date <- as.Date(managers_data$Date, 
                          format = c("%Y-%d-%m", "%m/%d/%Y", "%Y-%d-%m"))
converted_date
class(converted_date)


managers_data$Date <- converted_date
managers_data$Date


formatted_date <- as.Date(new_managers_data$Date, format="%m/%d/%Y")
formatted_date
class(formatted_date)


(subset(managers_data, select = -X))
managers_data <- subset(managers_data, select = -X)
managers_data

managers_data <- rbind(managers_data, new_managers_data)
managers_data
