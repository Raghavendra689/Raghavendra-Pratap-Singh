# Data analysis on employees salaries for different jobs role


#Importing of Data:
Employee_data<-read.csv("ds_salaries.csv")
Employee_data

#Viewing the Data:
View(Employee_data)

#using dplyr

#glimpse shows the columns and data of a data frame in a transposed format
glimpse(Employee_data)

#Mean and median of employee's salary
mean(Employee_data$salary)
median(Employee_data$salary)

#Mean and median of employee's salary in USD
mean(Employee_data$salary_in_usd)
median(Employee_data$salary_in_usd)

#details of Employees with highest salary
max_salary<-subset(Employee_data,salary==max(Employee_data$salary))
max_salary

#details of Employees with lowest salary
min_salary<-subset(Employee_data,salary==min(Employee_data$salary))
min_salary

#summary function will tell us about all statistical measures of a column
summary(Employee_data$salary)
summary(Employee_data$salary_in_usd)

#Histogram of work year of employees
hist(Employee_data$work_year,xlab = "Emp_work in years",main = "Histogram of Estimated Employed",col = "orange",border = "black")

#Boxplot of Employees salaries in USD 
boxplot(Employee_data$salary,main = " Boxplot of Employee's salaries ",ylab = "salary")

#Histogram of employee's salary
log0<-log(Employee_data$salary)
hist(log0,xlab = "salary",main = "Histogram of salary",col = "orange",border = "black")

#Histogram Of employee's salary in USD
log1<-log(Employee_data$salary_in_usd)
hist(log1,xlab = "salaries in USD",main = "Histogram of salaries in USD",col = "orange",border = "black")


#Installing necessary packages
install.packages("ggplot2")
library(ggplot2)

#ggplots
ggplot(Employee_data) +
  geom_point(mapping = aes(x = job_title, y = log0, color = job_title))+
  labs(y = "experience_level")

ggplot(data=Employee_data,aes(x=salary,fill=experience_level))+geom_histogram()+facet_wrap(~experience_level)

ggplot(data=Employee_data,aes(x=job_title,y=))+geom_boxplot()

#Let's give colors to the boxplot.
ggplot(data=Employee_data,aes(x=job_title,y=salary,fill = job_title))+geom_boxplot()

#Let's fill the colors inside the region.
ggplot(data=Employee_data,aes(x=work_year,y=salary_in_usd,fill=work_year))+geom_boxplot()

#Let's flip the graph to otherside using the function "coord_flip".
ggplot(data=Employee_data,aes(x=job_title,y=experience_level,color=job_title))+geom_boxplot()+coord_flip()

#When applied in conjunction with a boxplot, geom_jitter() adds a small amount of random noise to the data points, making it easier to visualize the distribution of individual points within each group.
ggplot(data=Employee_data,aes(x=salary,y=company_size,color=salary))+geom_boxplot()+geom_jitter(width=0.2,alpha=0.3)

#Drawing the regression by using ggplot.
ggplot(data=Employee_data, aes(x =remote_ratio, y =salary )) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Linear Regression with ggplot2")








