
# Generates 1000 random numbers and store these numbers in a data frame
numbers <- runif(1000)
RandomNum <- data.frame(random=numbers)

#Trunk the data frame that are less than 0.04 and greater than 0.06
Numbers<-runif(1000, min=0.04, max=0.96)
Random <- sample(Numbers,1000,replace = FALSE)
RandomNum2 <- data.frame(Random)

#Calculate the mean of the random numbers
random.mean <- function(x) sum(x)/length(x)
y <- Random
random.mean(y)

# Calculate the variance of the random numbers
random.variance <- function (x) sum((x-mean(x))^2)/(length(x)-1)
c <- Random
random.variance(c)
