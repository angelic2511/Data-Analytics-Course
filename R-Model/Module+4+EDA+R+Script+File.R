setwd("/Users/jj30/OneDrive - Texas State University/Teaching/Data Intensive Analysis and Simulation/Lectures/Module 3")
churn <- read.csv("churn.csv",header=TRUE,sep=",")

# Summarize the Churn variable
sum.churn <- summary(churn$Churn)
sum.churn

# Calculation proportion of churners
prop.churn <- sum.churn[2]/length(churn$Churn)

# Bar chart of variable Churn
barplot(sum.churn,
        ylim = c(0,3000),
        main = "Bar Graph of Churners and
        Non-Churners",
        col = "lightblue")
box(which ="plot",
    lty = "solid",
    col = "black")

#Make a table for counts for Churn and International Plan
counts <- table(churn$Churn,
                churn$international.plan,
                dnn=c("Churn","International Plan"))
counts

#Overlayed bar chart
barplot(counts,
        legend = rownames(counts),
        col=c("blue","red"),
        ylim = c(0,3300),
        ylab = "Count",
        xlab = "International Plan",
        main = "Comparison Bar Chart: Churn Proportions by
          International Plan")
box(which="plot",
    lty = "solid",
    col="black")

# Create a table with sums for both variables
sumtable <- addmargins(counts,FUN = sum)
sumtable

# Create a table of proportions over rows
row.margin <- round(prop.table(counts,margin=1),4)*100
row.margin

# Create a table of proportions over columns
col.margin <- round(prop.table(counts,margin=2),4)*100
col.margin

# Clustered Bar Chart, with legend
barplot(counts,
        col=c("blue","red"),
        ylim = c(0,3300),
        ylab = "Count",
        xlab = "International Plan",
        main = "Churn Count by International Plan",
        beside = TRUE)
legend("topright",
      c(rownames(counts)),
      col = c("blue","red"),
      pch = 15,
      title = "Churn")
box(which="plot",
    lty = "solid",
    col="black")

# Clustered Bar Chart of Churn and International Plan with Legend
barplot(counts,
        col=c("blue","green"),
        ylim = c(0,3300),
        ylab = "Count",
        xlab = "Churn",
        main = "International Plan Count by Churn",
        beside = TRUE)
legend("topright",
       c(rownames(counts)),
       col = c("blue","green"),
       pch = 15,
       title = "International Plan")
box(which="plot",
    lty = "solid",
    col="black")

# Histogram of non-overlayed Customer Service Calls
hist(churn$number.customer.service.calls,
     xlim=c(0,10),
     col = "light blue",
     ylab = "Count",
     xlab = "Customer Service Calls",
     main = "Histogram of customer service calls")

#Download and install the R Package ggplot2
install.packages("ggplot2")
library(ggplot2)

# Overlayed bar charts
ggplot() + 
  geom_bar(data=churn,
           aes(x=factor(churn$number.customer.service.calls),
           fill=factor(churn$Churn)),
           position="stack")+ 
           scale_x_discrete("Customer Serive Calls")+
           scale_y_continuous("Percent")+
           guides(fill=guide_legend(title="Churn"))+
           scale_fill_manual(values = c("blue","red"))

ggplot() + 
  geom_bar(data=churn,
           aes(x=factor(churn$number.customer.service.calls),
               fill=factor(churn$Churn)),
           position="fill")+ 
           scale_x_discrete("Customer Serive Calls")+
           scale_y_continuous("Percent")+
           guides(fill=guide_legend(title="Churn"))+
           scale_fill_manual(values = c("blue","red"))

# Two-sample T-Test for Int'l Calls
#Partition data
churn.false <- subset(churn,
                     churn$Churn==levels(churn$Churn)[1])
churn.true <- subset(churn,
                     churn$Churn==levels(churn$Churn)[2])
# Run the test
t.test(churn.false$total.intl.calls,
       churn.true$total.intl.calls)

# Scatterplot of everning minutes and night minutes, colored by Churn
plot(churn$total.day.minutes,
     churn$total.eve.minutes,
     xlim = c(0,400),
     ylim = c(0,400),
     xlab = "Evening Minutes",
     ylab = "Day Minutes",
     main = "Scatterplot of Day and Evening Minutes by Churn",
     col = ifelse(churn$Churn==levels(churn$Churn)[2],"red","blue"))
legend("topright",
       c("True","False"),
       col=c("red","blue"),
       pch = 1,
       title = "Churn")

# Scatterplot of Day Minutes and Customer Service Calls, colored by Churn
plot(churn$total.day.minutes,
     churn$number.customer.service.calls,
     xlim = c(0,400),
     xlab = "Day Minutes",
     ylab = "Customer Service Calls",
     main = "Scatterplot of Day Minutes and Customer Service Calls by Churn",
     col = ifelse(churn$Churn==levels(churn$Churn)[2],"red","blue"),
     pch = ifelse(churn$Churn==levels(churn$Churn)[2],16,20))
legend("topright",
       c("True","False"),
       col=c("red","blue"),
       pch = c(16,20),
       title = "Churn")
# Scatterplot matrix
pairs(~churn$total.day.minutes+
        churn$total.day.calls+
        churn$total.day.charge)

# Regression of Day Charge vs Day Minutes
fit <- lm(churn$total.day.charge~churn$total.day.minutes)
summary(fit)

# Correlation values, with p-values
days <- cbind(churn$total.day.minutes,churn$total.day.calls,churn$total.day.charge)
MinsCallsTest <- cor.test(churn$total.day.minutes,churn$total.day.calls)

# Correlation values and p-values in matrix form
# collect the variables of interest
corrdata <- 
  cbind(churn$account.length,
        churn$number.vmail.messages,
        churn$total.day.minutes,
        churn$total.day.calls,
        churn$number.customer.service.calls)
corrdata
# declare the matrix
corrpvalues <- matrix(rep(0,25),ncol=5)
corrpvalues
# fill the matrix with correlations
for (i in 1:4) {
  for (j in (i+1):5) {
    corrpvalues[i,j] <-
      corrpvalues[j,i] <-
         round(cor.test(corrdata[,i],
                        corrdata[,j])$p.value,4)
  }
}
round(cor(corrdata),4)
corrpvalues
