managers_data <- read.csv("C:/Users/Asus/Downloads/managers.csv")
View(managers_data)

str(managers_data)

new_data <- na.omit(managers_data)
View(new_data)


missing_data <- managers_data[!complete.cases(managers_data),]

(complete_data <- managers_data[complete.cases(managers_data),])

sum(complete_data)


(complete_data <- managers_data[complete.cases(managers_data),])
nrow(complete_data)


missing_data <- managers_data[!complete.cases(managers_data),]
nrow(missing_data)


(mean(!complete.cases(managers_data)))


install.packages('mice')
library(mice)
windows(20,10)
md.pattern(managers_data)
managers_data

install.packages('VIM')
library(VIM)
windows(20,10)

missing_values <- aggr(managers_data, prop=TRUE, numbers=FALSE)

summary(missing_values)


windows(20,10)
matrixplot(managers_data)








