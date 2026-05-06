cars <- mtcars

View(cars)
str(cars)

summary(cars)

# Check missing values
colSums(is.na(cars))

#  examine whether there is a link between the weight of cars and their fuel efficiency as measured by MPG

is.numeric(cars$mpg)
is.numeric(cars$wt)

# check the spread of mpg
range(cars$mpg)
mean(cars$mpg)
median(cars$mpg)
var(cars$mpg)

# check the spread of wt
range(cars$wt)
mean(cars$wt)
median(cars$wt)
var(cars$wt)


##Normality

# H0 - data is normally distributed
# H1 - data is not normally distributed

# Histogram
hist(cars$wt, xlab = 'weight', ylab = 'count')


# examine link betweeen transmission and horsepower

# independent - transmission dependent - horsepower

?mtcars

is.factor(cars$am)
cars$am <- factor(cars$am, labels = c("Automatic", "Manual"))
View(cars)

is.numeric(cars$hp)

hist(cars$hp, xlab = 'Transmission', ylab = 'count')

library(lattice)
attach(cars)
windows(20,10)
histogram(~hp | am,
          data = mtcars,
          main = "Distribution of Horsepower by Transmission",
          xlab = "Horsepower",
          ylab = "Density")
detach(cars)

qqnorm(mtcars$hp,
       main = "Q-Q Plot of Horsepower",
       ylab = "Sample Quantiles",
       xlab = "Theoretical Quantiles")

qqline(mtcars$hp, col = "red", lwd = 2)


attach(cars)
windows(20,10)
par(mfrow = c(1, 2))

with(cars, {
  qqnorm(hp[am == "Automatic"],
         main = "Automatic")
  qqline(hp[am == "Automatic"], col = "red")
})

with(cars, {
  qqnorm(hp[am == "Manual"],
         main = "Manual")
  qqline(hp[am == "Manual"], col = "red")
})


par(mfrow = c(1, 1))
detach(cars)



shapiro.test(cars$hp)


library(dplyr)
install.packages('moments')
library(moments)

norm1 <- cars %>%
  mutate(am = factor(am, labels = c("Automatic", "Manual"))) %>%
  group_by(am) %>%
  summarise(
    Sample = n(),
    Mean = round(mean(hp), 1),
    Median = round(median(hp), 1),
    Skewness = round(skewness(hp), 2),
    p_value = shapiro.test(hp)$p.value,
    Normally_distributed = ifelse(shapiro.test(hp)$p.value > 0.05,
                                  "Yes", "No")
  )
t(norm1)


wilcox.test(hp ~ am, data = cars)


# Gearbox = independent var , hp = dependent var

?mtcars

is.factor(cars$gear)
cars$gear <- factor(cars$gear, levels = c(3, 4, 5), labels = c("3 gears", "4 gears", "5 gears"))
View(cars)

hist(cars$hp, xlab = 'HorsePower', ylab = 'count')

library(lattice)
attach(cars)
windows(20,10)
histogram(~hp | gear,
          data = cars,
          main = "Distribution of Horsepower by Transmission",
          xlab = "Horsepower",
          ylab = "Density")
detach(cars)

attach(cars)
windows(20,10)
par(mfrow = c(1, 2))

with(cars, {
  qqnorm(hp[am == "3 gears"],
         main = "3 gears")
  qqline(hp[am == "3 gears"], col = "red")
})

with(cars, {
  qqnorm(hp[am == "4 gears"],
         main = "4 gears")
  qqline(hp[am == "4 gears"], col = "red")
})

with(cars, {
  qqnorm(hp[am == "5 gears"],
         main = "5 gears")
  qqline(hp[am == "5 gears"], col = "red")
})


par(mfrow = c(1, 1))
detach(cars)

summary(aov(hp~gear, data=cars))
kruskal.test(hp~gear)

library(rstatix)
cohens_d(cars, hp~gear)


chisq.test(vs, gear)


