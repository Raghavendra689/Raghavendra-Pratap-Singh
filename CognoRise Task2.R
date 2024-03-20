#Data analysis on cereals 
my_cerealdata<-read.csv("cereal.csv")
my_cerealdata


#Analysing the structure of the data
str(clean)

#View of Data:
View(my_cerealdata)
ncol(my_cerealdata)
nrow(my_cerealdata)


typeof(my_cerealdata$protein)
class(my_cerealdata$calories)
class(my_cerealdata$name)
#showing that calories is not a categorical Factors.
levels(my_cerealdata$calories)


#mean and median of the protein,.
mean(my_cerealdata$protein)
median(my_cerealdata$weight)
mean(my_cerealdata$weight)
median(my_cerealdata$protein)

#summary function will tell us about all statistical measures of a column.
summary(my_cerealdata$protein)
summary(my_cerealdata$weight)
summary(my_cerealdata$sugars)

#Histogram of protein.
hist(my_cerealdata$protein,xlab = "protein",main = "Histogram of protein",col = "red",border = "black")

#Histogram of weight.
hist(my_cerealdata$weight,xlab = "weight",main = "Histogram of ",col = "orange",border = "black")

#Boxplot of fat in food item
boxplot(my_cerealdata$fat,main = "Boxplot of fat",ylab = "fat")




#Data Visualisation using ggplot.

#installing the ggplot package.
install.packages("ggplot2")
library(ggplot2)


#Bar graph
ggplot(data=my_cerealdata,aes(x=name,color="red"))+geom_bar()



#Scatter Plot
plot(my_cerealdata$protein,my_cerealdata$fat,main = "protein vs fat")

#Histogram
ggplot(data=my_cerealdata,aes(x=protein,color="blue"))+geom_histogram()
ggplot(data=my_cerealdata,aes(x=weight,fill="red"))+geom_histogram()

ggplot(data=my_cerealdata,aes(x=carbo,fill=protein))+geom_histogram()

#To see the Region.1 in different graphs.
ggplot(data=my_cerealdata,aes(x=calories,fill=protein))+geom_histogram()+facet_wrap(~protein)

ggplot(data=my_cerealdata,aes(x=name,y=weight))+geom_boxplot()
ggplot(data=my_cerealdata,aes(x=name,y=protein))+geom_boxplot()

#Let's give colors to the boxplot.
ggplot(data=my_cerealdata,aes(x=name,y=weight,color=name))+geom_boxplot()

#Let's fill the colors inside the region.
ggplot(data=my_cerealdata,aes(x=name,y=vitamins,fill=name))+geom_boxplot()

#Let's flip the graph to otherside using the function "coord_flip".
ggplot(data=my_cerealdata,aes(x=name,y=vitamins,color=name))+geom_boxplot()+coord_flip()

#When applied in conjunction with a boxplot, geom_jitter() adds a small amount of random noise to the data points, making it easier to visualize the distribution of individual points within each group.
ggplot(data=my_cerealdata,aes(x=rating,y=protein,color=rating))+geom_boxplot()+geom_jitter(width=0.2,alpha=0.3)

#Drawing the regression by using ggplot.
ggplot(data=my_cerealdata, aes(x =rating, y =calories )) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Linear Regression with ggplot2")

colnames(my_cerealdata)[2]<-"Manufacturer"




