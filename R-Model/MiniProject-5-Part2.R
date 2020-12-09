# Construct a table of the first 10 records of the data set

adults <- read.csv(file="C:/Users/angel/Desktop/SPRING 2020/IE 4399F - DATA ANALYTICS/adult.csv", stringsAsFactors=TRUE)
adults[1:10]

# For three of the categorical variables, construct a bar chart of the variable, with an overlay of the target variable
adults <- read.csv(file="C:/Users/angel/Desktop/SPRING 2020/IE 4399F - DATA ANALYTICS/adult.csv", stringsAsFactors=TRUE)
age <- table(adults$income,adults$age,dnn=c("Income","Age"))
age
barplot(age, legend = row.names(age), col = c("green","red"), ylim = c(0,1000), xlim = c(0,100), ylab = "Count", xlab="Age")



education <- table(adults$income,adults$education,dnn=c("Income","Education"))
education
barplot(education, legend = row.names(education), col = c("green","red"), ylab = "Count", xlab="Education")

gender <- table(adults$income,adults$gender,dnn=c("Income","Gender"))
gender
barplot(gender, legend = row.names(gender), col = c("green","red"), ylab = "Count", xlab="Gender", ylim = c(0,35000))


# Pick three pairs of numerical variabes and construct a scatter plot for each pair. Dicuss your salient results

plot(adults$age,adults$capital_gain, col = c("blue","red"))
plot(adults$age,adults$capital_loss, col = c("blue","red"))
plot(adults$age,adults$hours_per_week, col = c("blue","red"))
