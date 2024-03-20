#Data Analysis on Unemployment in India at the time of Covid 19

#Importing of Data:
my_data<-read.csv("Unemployment in India.csv")
my_data

library(dplyr)
glimpse(my_data)

# Using tidyr package to clean the data
library(tidyr)
clean<-drop_na(my_data)
View(clean)

#Analysing the structure of the data
str(clean)

#View of Data:
View(my_data)
ncol(clean)
nrow(clean)


typeof(clean$Region)
class(clean$Estimated.Unemployment.Rate....)
#showing that Estimated.Employed is not a categorical Factors.
levels(clean$Estimated.Employed)


#mean and median of the Estimated Employed.
mean(clean$Estimated.Employed)
median(clean$Estimated.Employed)

#summary function will tell us about all statistical measures of a column.
summary(clean$Estimated.Employed)
summary(clean$Estimated.Unemployment.Rate....)
summary(clean$Estimated.Labour.Participation.Rate....)

#Histogram of Estimated Employed.
hist(clean$Estimated.Employed,xlab = "Estimated Employed",main = "Histogram of Estimated Employed",col = "orange",border = "black")

#Histogram of Estimated.Unemployment.Rate.
hist(clean$Estimated.Unemployment.Rate....,xlab = "Estimated.Unemployment.Rate....",main = "Histogram of Estimated.Unemployment.Rate....",col = "yellow",border = "black")

#Boxplot of Estimated Employed in India in starting of 2020.
boxplot(clean$Estimated.Employed,main = "Boxplot of Estimated Employed ",ylab = "Estimated.Employed")




#Data Visualisation using ggplot.

#installing the ggplot package.
install.packages("ggplot2")
library(ggplot2)


#Bar graph
ggplot(data=clean,aes(x=Region,colors="red"))+geom_bar()
ggplot(data=clean,aes(x=Region,fill="red"))+geom_bar()


#Scatter Plot
plot(clean$Estimated.Unemployment.Rate....,clean$Estimated.Employed)

#Histogram
ggplot(data=clean,aes(x=Estimated.Labour.Participation.Rate....,color="blue"))+geom_histogram()
ggplot(data=clean,aes(x=Estimated.Labour.Participation.Rate....,fill="blue"))+geom_histogram()

ggplot(data=clean,aes(x=Estimated.Labour.Participation.Rate....,fill=Region))+geom_histogram()

#To see the Region.1 in different graphs.
ggplot(data=clean,aes(x=Estimated.Labour.Participation.Rate....,fill=Region))+geom_histogram()+facet_wrap(~Region)

ggplot(data=clean,aes(x=Region,y=Estimated.Unemployment.Rate....))+geom_boxplot()

#Let's give colors to the boxplot.
ggplot(data=clean,aes(x=Region,y=Estimated.Unemployment.Rate....,color = Region))+geom_boxplot()

#Let's fill the colors inside the region.
ggplot(data=clean,aes(x=Region,y=Estimated.Unemployment.Rate....,fill=Region))+geom_boxplot()

#Let's flip the graph to otherside using the function "coord_flip".
ggplot(data=clean,aes(x=Region,y=Estimated.Unemployment.Rate....,color=Region))+geom_boxplot()+coord_flip()

#When applied in conjunction with a boxplot, geom_jitter() adds a small amount of random noise to the data points, making it easier to visualize the distribution of individual points within each group.
ggplot(data=clean,aes(x=Region,y=Estimated.Unemployment.Rate....,color=Region))+geom_boxplot()+geom_jitter(width=0.2,alpha=0.3)

#Drawing the regression by using ggplot.
ggplot(data=clean, aes(x =Estimated.Unemployment.Rate...., y =Estimated.Labour.Participation.Rate.... )) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Linear Regression with ggplot2")





