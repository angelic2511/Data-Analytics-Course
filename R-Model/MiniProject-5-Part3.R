adult <- read.csv(file="adult.csv",header=TRUE, sep=",",stringsAsFactors = TRUE,)
library(arules)
support<-0.15
confidence<-0.80
maxitems<-3
testing <- as(adult[,-c(1,3,4,5,7,8,9,11,12,13,14)],"transactions")
rules <- apriori(testing,
                 parameter = list(supp=support,
                                  conf =confidence,
                                  maxlen=maxitems))
inspect(sort(rules))

# Set the confidence to 0.50% and support to 0.15

adult <- read.csv(file = "C:/Users/angel/Desktop/SPRING 2020/IE 4399F - DATA ANALYTICS/adult.csv", stringsAsFactors = TRUE)
library(arules)
support <- 0.15
confidence <- 0.50
maxitems <- 3

testing <- as(adult[,-c(1,3,4,5,7,8,9,11,12,13,14)], "transactions")
rules <- apriori(testing, parameter = list(supp = support, conf = confidence, maxlen= maxitems))
inspect(sort(rules))

# The top three rules of LHS are NULL. If the workclass is private, then income  <=50K, there were 17733 instances in the data set, which represent
# 54.4% of the number of record with 78.13% confidence.

#Set the confidence to 0.80 and support to 0.30
adult <- read.csv(file = "C:/Users/angel/Desktop/SPRING 2020/IE 4399F - DATA ANALYTICS/adult.csv", stringsAsFactors = TRUE)
library(arules)
support <- 0.30
confidence <- 0.80
maxitems <- 3

testing <- as(adult[,-c(1,3,4,5,7,8,9,11,12,13,14)], "transactions")
rules <- apriori(testing, parameter = list(supp = support, conf = confidence, maxlen= maxitems))
inspect(sort(rules))

# With this problem, there are 2 rules. With the Marital_status=Never-married, then income <= 50K, the confidence, the count and the support are similar to the 
# first problem. That is 31.3% of the records contained the value Never-married, 10192 instances in the data set