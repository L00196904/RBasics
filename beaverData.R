?beavers

str(beaver1)
View(beaver1)

is.factor(beaver1$activ)
beaver1$activ<-factor(beaver1$activ,labels=c("no","yes"))

is.numeric(beaver1$temp) # check the numeric 

# do all for the continuous data 
range(beaver1$temp)
mean(beaver1$temp)
median(beaver1$temp)
var(beaver1$temp)

##Normality

# H0 - data is normally distributed
# H1 - data is not normally distributed

# Histogram
hist(beaver1$temp, xlab = 'temp', ylab = 'count')

install.packages('lattice')
library('lattice')

attach(beaver1)
windows(20,10)
histogram(~temp | activ,
          data = beaver1,
          main = 'Distribution of beaver activity data',
          xlab = 'Temperature (degrees)',
          ylab = 'Activity %')
detach(beaver1)

####################################
# QQ-plot
attach(beaver1)


windows(16,10)
par(mfrow = c(1,2))

with(beaver1, {
  qqnorm(temp[activ = 'yes'],
  main = 'Beavers active data')
  qqline(temp[activ = 'yes'])
})

with(beaver1, {
  qqnorm(temp[activ = 'no'],
         main = 'Beavers inacive data')
  qqline(temp[activ = 'no'])
})


# P value is 0.01226, which is < 0.05
# You reject the null hypothesis (which assumes the data is normally distributed).
# Data is not normally distributed

Norm<-shapiro.test(beaver1$temp)
Norm

library('dplyr')
install.packages('rlang')
library('rlang')

norm1 <- beaver1 %>% group_by(activ) %>% summarise(shapiro.test(temp)$p.value)
t(norm1)

norm2 <- beaver1 %>% group_by(activ) %>% summarise(Sample = n(), Mean = round(mean(temp), 1),
                                                   Median = round(median(temp), 1),
                                                   Skewness = round(skewness(temp), 2),
                                                   p_value = shapiro.test(temp)$p.value,
                                                   Normally_distributed = ifelse(shapiro.test(temp)$p.value > 0.05,
                                                                                 "Yes", "No")
                                                   )
t(norm2)


attach(beaver1)
wilcox.test(temp~activ) # reject H0 p = 0.0001 < 0.05 then reject H0, So activity has effect on body temperature
detach(beaver1)


# find correlation 

library()


