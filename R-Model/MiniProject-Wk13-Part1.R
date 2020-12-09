setwd("/Users/angel/Desktop/SPRING 2020/IE 4399F - DATA ANALYTICS")
baseball <- read.csv("baseball.csv", header = TRUE)
names(baseball)

# reduce the dataset by filtering out those records with fewer than 100 at bats

x <- baseball[which(baseball$at_bats<100),]
new_baseball <- x[,sapply(x,is.numeric)]


# Calculate eigenvalues & eigenvectors

baseball.cov <- cov(new_baseball)
baseball.eigen <- eigen(baseball.cov)

# Use a 90% of Proportion of Variance Explained Criterion

PVE <- baseball.eigen$values/sum(baseball.eigen$values)
round (PVE,3)
choose.baseball <- new_baseball[which(PVE <= 0.1), ]


#Show the correlation matrix

cor(choose.baseball)

 
# Show the covariance matrix

cov(choose.baseball)

# Perform a principal componets analysis

pca_result <- prcomp(choose.baseball, center = TRUE, scale. = TRUE)
summary(pca_result)

# produce a Scree Plot to show the profile of the components


screeplot(pca_result, main="Scree plot for Baseball Data", type ="lines")


 # List the variables and the corresponding loadings for the principal component 1
choose.baseball.cov <- cov(choose.baseball)
choose.baseball.eigen <- eigen(choose.baseball.cov)

PC1 <- choose.baseball.eigen$vectors[,1]
PC1


 # List the variables and the corresponding loadings for the principla component 2

PC2 <- choose.baseball.eigen$vectors[,2]
PC2

 # Produce the biplot to plot the principal components 1 and 2

 biplot(pca_result, choices = 1:2, scale = 0)