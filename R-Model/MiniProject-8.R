# Example to demonstrate the CART algorithm
# Description of dataset is found at: http://scg.sdsu.edu/dataset-adult_r/
setwd("/Users/angel/Desktop/SPRING 2020/IE 4399F - DATA ANALYTICS")
salary <- read.csv("salary.csv",header = T, stringsAsFactors = T)

# Collapse some of the categories by giving them the same factor label

levels(salary$Salary)[1] <- "Level 1"
levels(salary$Salary)[2:3] <- "Level 2"
levels(salary$Salary)[4:6] <- "Level 3"
levels(salary$Salary)[7:8] <- "Level 4"
levels(salary$Occupation)
levels(salary$Gender)
levels(salary$Age)

#Standardize the numeric variables
salary$Age.z <- (salary$Age-mean(salary$Age))/sd(salary$Age)


# Requires package "rpart"
library("rpart")
cartfit <- rpart(Salary~Age.z+Gender,
                 data = salary,
                 method = "class")
print(cartfit)

# Plot the decision tree
library("rpart.plot")
rpart.plot(cartfit,main= 
             "Classification Tree", box.palette ="red" )
