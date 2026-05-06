library(readxl)

################# Import IQ sheet #################

data <- read_excel("C:/Users/Asus/Downloads/W6_Dataset_2025.xlsx", sheet = "IQ")
View(data)


install.packages("ggplot2")
install.packages("psych")
install.packages("rstatix")
install.packages("dplyr")


library(ggplot2)
library(psych)
library(rstatix)
library(dplyr)


# 1. Histogram

(range(data$IQ))

hist(data$IQ)

?ggplot2

ggplot(data, aes(x=IQ)) + 
       geom_histogram(breaks=seq(70,140,10))+ theme_bw() + labs(x="IQ Score", y="Frequency") 
       + scale_y_continuous(breaks = seq(0,20,2)) + scale_x_continuous(breaks = seq(70,140,10)) 
       + theme(text = element_text(size = 15))


Norm <- shapiro.test(data$IQ)
Norm

(result <- t.test(data$IQ, mu=50)) # two tailed test
# by assigning output to 'result', it is possible to select attributes of the output
(result$conf.int)

(t.test(data$IQ, mu=50, alternative = "less")) # left tailed test
(t.test(data$IQ, mu=50, alternative = "greater")) # right tailed test

#if the single measurement is not normally distributed

wilcox_test(data,IQ~1,mu=50,conf.level = 0.95,detailed=T)
?wilcox.test


################# Import Breaks sheet #################


data2 <- read_excel("C:/Users/Asus/Downloads/W6_Dataset_2025.xlsx", sheet = "Brakes")

View(data2)
str(data2)


# apply the three checks, followed with test
# 1: histogram is bell-shaped

library(psych) # required for skew()
library(dplyr)
library(rstatix)
library(ggplot2)
library(magrittr)

range(data2$Diameter) #determining the spread of the data
ggplot(data2,aes(x=Diameter))+geom_histogram()+theme_bw()

ggplot(data2,aes(x=Diameter))+
  geom_histogram(breaks=seq(321.95,322.05,.010))+
  theme_bw()+
  labs(x = "Diameter score", y = "Frequency")+
  scale_y_continuous(breaks=seq(0,60,10))


Norm<-shapiro.test(data2$Diameter)
Norm

#one sample t-test
(result<-t.test(data2$Diameter,mu=322)) #2-tailed test
result$p.value
result$conf.int 


#one sample t-test
(result<-t.test(data2$Diameter,mu=322, alternative = "less")) #2-tailed test
result$p.value
result$conf.int 

#one sample t-test
(result<-t.test(data2$Diameter,mu=322, alternative = "greater")) #2-tailed test
result$p.value
result$conf.int 


################# Import independent t-test #################


data3 <- read_excel("C:/Users/Asus/Downloads/W6_Dataset_2025.xlsx", sheet = "Independent t-test")

View(data3)
str(data3)


# properties
is.factor(data3$Group) # returns FALSE
data3$Group<-factor(data3$Group,levels=c("Placebo","Caffeine")) # set as factor and specify order of levels
is.numeric(data3$Score) # returns TRUE

##Normality
hist(data3$Score)
# normality
Norm<-shapiro.test(data3$Score)
Norm

##pipe operator (%>%) in R is used to chain together a sequence of operations,
##making the code more readable and concise
library(dplyr)
Norm1<-data3 %>% group_by(Group) %>% 
  summarise(shapiro.test(Score)$p.value)
t(Norm1)

Norm2<-data3 %>% group_by(Group) %>% 
  summarise(Sample=n(),
            Mean = round(mean(Score),1), 
            Median = round(median(Score),1), 
            p_value= shapiro.test(Score)$p.value,
            Normally_distributed=ifelse
            (shapiro.test(Score)$p.value>0.05,"Yes","No"))
t(Norm2)

boxplot(data3$Score)

boxplot( Score ~ Group , data = data3,
         xlab = "Group",
         ylab = "Score")

# outliers are present ... through investigation outliers are found to be typos

min(data3$Score[data3$Group=="Caffeine"]) # locating exact value of the outlier
data3$Score[data3$Score == 2] <- 11.9 # let us say this is a typo and should have been 12
max(data3$Score[data3$Group=="Placebo"]) # locating exact value of the outlier
data3$Score[data3$Score == 20] <- 9.2 # let us say this is a typo and should have been 12

#rerun the boxplot
#boxplot(Indep$Score)
windows(20,10)
boxplot( Score ~ Group , data = data3,
         xlab = "Group",
         ylab = "Score")

# normality


Norm1<-data3 %>% group_by(Group) %>% summarise(shapiro.test(Score)$p.value)
t(Norm1)
Norm_2<-data3 %>% 
  group_by(Group) %>% 
  summarise(Sample=n(),
            Mean = round(mean(Score),1), 
            Median = round(median(Score),1), 
            p_value= shapiro.test(Score)$p.value,
            Normally_distributed=ifelse
            (shapiro.test(Score)$p.value>0.05,"Yes","No"))
t(Norm_2)

# test for homogeneity of variances
#all comparison groups have the same variance. 
library(car)
(leveneTest(Score ~ Group,center=mean, data=data3))

#A t-test is an inferential statistical test that’s used to determine if there’s a 
#significant difference between the means of two groups and how they’re related.

# independent t-test (IF measurements are normally distributed and variances equal)

#The t-value, or t-score, is a ratio of the difference between the
#mean of the two sample sets and the variation that exists within the sample sets.
#A t-value of 0 indicates that the sample results exactly equal the null hypothesis. 

# t.test(Score ~ Group, var.equal=TRUE,data=data3) # gives same output

t.test(data3$Score ~ data3$Group, var.equal=TRUE)


t.test(data3$Score ~ data3$Group, var.equal=TRUE,alternative= 'greater')
####t.test(data3$Score ~ data3$Group, var.equal=TRUE,alternative= 'less')


##t.test(Group  ~ Score, var.equal=TRUE, data=data3) won't work

# Mann-Whitney U test (IF measurements are not normally distributed)
library(rstatix)
wilcox_test(data3,Score~Group,conf.level = 0.95,paired=F,detailed=T)

# independent t-test (IF measurements are normally distributed), but equal variances are not assumed
t.test(data3$Score ~ Indep$Group, var.equal=FALSE)

# effect size for shooting accuracy ...standardised difference
library(rstatix)
cohens_d(data3,Score~Group,paired=F) # IF data is normally distributed
wilcox_effsize(data3,Score~Group,paired=F) # IF data is not normally distributed

