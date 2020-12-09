# Prepare the data set
mpg <- c(14.0, 31.9,17.0,15.0,30.5,23.0)
cubicinches <- c(350,89,302,400,98,350)
hp <- c(165,71,140,150,63,125)
brand <- c("US","Europe","US","US","US","US")
cars <- data.frame(Name=mpg,Name=cubicinches,Name=hp, Name =brand)
names(cars) <- c("mpg","cubicinches","hp","brand")

# Include some missing values for demonstration purposes
cars[2,2]<-cars[4,4]<-NA

# Replace missing values with constants
cars[2,2] <- 0 
cars[4,4] <- "US"
head(cars)

# Alternatively, replace missing values with mean and mode
cars[2,2] <- mean(na.omit(cars$cubicinches)) # Replace cell(2,2) with mean
our_table <- table(cars$brand) # create a pivot table with counts
our_mode <- names(our_table) [our_table == max(our_table)] # which value occurs the most?
cars[4,4] <- our_mode # Replace cell (4,4) with mode
head(cars)

# Alternatively, replace missing values with random observations
obs_brand <- sample(na.omit(cars$brand),1)
obs_cubicinches <- sample(na.omit(cars$cubicinches),1)
cars[2,2] <- obs_cubicinches
cars[4,4] <- obs_brand
head(cars)

# Create a Histogram
par(mfrow = c(1,1))
hist(cars$mpg, breaks = 30, xlim = c(10,35), col = "blue", border = "black", ylim = c(0,5), xlab = "mpg", ylab = "Counts", main = "Histogram of Car mpg")
box(which = "plot", lty = "solid", col="black")

# Create a Scatter Plot
plot(cars$mpg,cars$hp, xlim = c(10,35), ylim = c(60,170), xlab = "mpg", ylab = "hp", main = "Scatterplot of hp by mpg", type = "p",pch=16,col="blue")
points(cars$mpg, cars$hp, type = "p", col="black")

# Transformations
# min-max normalization
summary(cars$mpg)
mi <- min(cars$mpg)
ma <- max(cars$mpg)
minmax.mpg <- (cars$mpg-mi)/(ma-mi)
minmax.mpg
#Z-score standarization
m <- mean(cars$mpg)
s <-sd(cars$mpg)
z.score <- (cars$mpg-m)/s
z.score
length(cars.mpg)
# Categorical variables
cars$brand_num[cars$brand=="US"] <- 1
cars$brand_num[cars$brand=="Europe"] <- 2
cars$brand_num

# Duplicates
anyDuplicated(cars)
