data <- read.csv("C:/Users/Asus/Downloads/london-crime-modified.csv")

View(data)
head(data, 15)
str(data)
nrow(data)

######### Convert date after combining var. and convert into date format ########
data$Date <- as.Date(
  paste(data$year, data$month, data$day, sep = "-")
)
View(data)


######### Rename Variables ########
library(data.table)
setnames(data, old = c("borough", "major_category", "minor_category", "value", "Date"), 
         new = c("Borough", "MajorCategory", "SubCategory", "Value", "CrimeDate"))
View(data)
names(data)


######### Bar Chart ########
windows(20,20)

Borough_occur <- table(data$Gender)
barplot(Borough_occur,
        main = "Crime Count by Borough",
        xlab = "Borough",
        ylab = "Number of Crimes",
        las = 2)



######### Pie Chart ########
windows(20,20)

MajorCategory_crime<-table(data$MajorCategory)

# Percentage
MajorCategory_percent <- prop.table(MajorCategory_crime) * 100

labels <- paste(
  names(MajorCategory_crime),
  round(MajorCategory_percent, 1),
  "%"
)

pie(MajorCategory_crime,
    labels = labels,
    main = "Crime Distribution by Category")


#############################################

# Creating Region variable
data$Region <- NA

#east region
data$Region[data$Borough %in% 
              c("Barking and Dagenham","Bexley","Greenwich","Havering","Newham","Redbridge",
                "Waltham Forest","Wandsworth","Kingston upon Thames")]<-"East"

#North region
data$Region[data$Borough %in% 
              c("Barnet","Camden","Enfield","Hackney","Haringey","Islington")] <- "North"

#west region
data$Region[data$Borough %in% 
              c("Brent","Ealing","Hammersmith and Fulham","Harrow","Hillingdon",
                "Hounslow","Richmond upon Thames")] <- "West"

#south region
data$Region[data$Borough %in% c("Bromley","Croydon","Merton","Sutton")] <- "South"

#centarl region
data$Region[data$Borough %in% 
              c("Kensington and Chelsea","Lambeth","Lewisham","Southwark",
                "Tower Hamlets","Westminster")] <- "Central"

View(data)

#checking for Na values
sum(is.na(data$Region))



######### Bar plot by region #########
windows(20,20)

Region_occurance <- table(data$Region)
barplot(Region_occurance,
        main = "Crime Count by Region",
        xlab = "Region",
        ylab = "Number of Crimes",
        las = 1)

#finding the Highest and Lowest crime rate
Highest_region_occurance <- names(which.max(Region_occurance))
Lowest_region_occurance <- names(which.min(Region_occurance))

Highest_region_occurance
#Region with highest crime rate is "East"

Lowest_region_occurance
#Region with lowaest crime rate is "South"



#creating the the subset of the data of highest and lowest crimes
Highest_crimedata <- subset(data, Region == Highest_region_occurance)
Lowest_crimedata <- subset(data, Region == Lowest_region_occurance)

View(Highest_crimedata)
View(Lowest_crimedata)

#number of crimes committed in the highest region is 30683
nrow(Highest_crimedata)
#number of crimes committed in the Lowest region is 15487
nrow(Lowest_crimedata)



####################################

windows(20,10)
barplot(table(Highest_crimedata$MajorCategory),
        main = "Highest Region Crimes",
        las = 2)

barplot(table(Lowest_crimedata$MajorCategory),
        main = "Lowest Region Crimes",
        las = 2)


#saving the modified data
write.csv(data,
          "london.csv",
          row.names = FALSE)

