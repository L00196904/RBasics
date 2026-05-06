?women

var <- lm(weight ~ height, data = women)
var

summary(var)
View(women)

?cars

View(cars)

library(ggplot2)
 
windows(16,10)
ggplot(cars, aes(x = speed, y = dist, fill = speed)) +
  geom_boxplot() +
  labs(
    title = "Stopping Distance by Speed",
    x = "Speed (mph)",
    y = "Stopping Distance (ft)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")


windows(20,12)
scatter.smooth(x=cars$speed, y=cars$dist, main="Dist ~ Speed")

install.packages("e1071")
library(e1071)

windows(20,12)
par(mfrow=c(1,2))

plot(density(cars$speed),
     main = "density plot : speed",
     ylab = "Frequency",
     sub = paste("Skewness:",
                 round(skewness(cars$speed),2)))

polygon(density(cars$speed), col = "blue")

plot(density(cars$dist),
     main = "density plot : distance",
     ylab = "Frequency",
     sub = paste("Skewness:",
                 round(skewness(cars$dist),2)))

polygon(density(cars$dist), col = "red")



cor(cars$speed, cars$dist)
cor(cars)

shapiro.test(cars$speed)
shapiro.test(cars$dist)


linearMod <- lm(dist ~ speed, data = cars)
linearMod


nrow(cars)
no_of_records <- sample(1:nrow(cars), 0.8 * nrow(cars))
str(no_of_records)


training_data <- cars[no_of_records,]
training_data
nrow(training_data)

test_data <- cars[-no_of_records, ]
test_data
nrow(test_data)

linear_train <- lm(dist ~ speed, data =training_data)
linear_train
summary(linear_train)


dist_predicted <- predict(linear_train, test_data)
dist_predicted

actual_preds <- data.frame(cbind(actuals = test_data$dist, predicted = dist_predicted))

actual_preds
head(actual_preds)


attach(actual_preds)
correlation_accuracy <- cor(actuals, predicted)
correlation_accuracy


attach(actual_preds)
mape <- mean(abs(predicted ~ actuals) / actuals)
mape


saveRDS(linear_train, "./cars_model.rds")

lr_model <- readRDS("./cars_model.rds")
