stockPrices <- c(10,7,20,12,75,15,9,18,4,12,8,14)

# Calculate the mean and mode stock price
mean(stockPrices)
# Create the MODE function
mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x,ux)))]
}
mode(stockPrices)

# Compute the SD of the stock price. Interpret what this number means
sd(stockPrices) # It means how much the stock prices relative tothe mean value

# Find the min-max normalized stock price for the stock price $20
price <- 20
mi <- min(stockPrices)
ma <- max(stockPrices)
minmax.stock <- (price - mi)/(ma - mi)
minmax.stock

# Compute the Z-score standardized stock price for the stock price $20
m <- mean(stockPrices)
s <- sd(stockPrices)
z.stock <- (price - m)/s
z.stock

# Identify the outlier
boxplot(stockPrices)
OutVal <- boxplot(stockPrices)$out
OutVal

# Find the mean score and the median score, with the outlier
mean(stockPrices)
median(stockPrices)

# Find the mean score and the median score without  the outlier
mean(OutVal)
median(OutVal)

# state which measure, the mean or the median, the presence of the outlier affect more, and why

