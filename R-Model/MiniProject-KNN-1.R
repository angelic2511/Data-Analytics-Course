# The ClassifyRisk data set contains age, marital status, and income, 
# and target variable risk. We seek the k-nearest neighbor for record "new", using k = 2. 
library("class")  # classification algorithm
library("fields") # calculate Euclidean distance
# Data
A <- c(22,"single",46156.98,"Bad loss")
B <- c(33,"married",24188.10,"Bad loss")
C <- c(28,"other",28787.34,"Bad loss")
D <- c(51,"other",23886.72,"Bad loss")
E <- c(25,"single",47281.44,"Bad loss")
F <- c(39,"single",33994.90,"Good risk")
G <- c(54,"single",28716.50,"Good risk")
H <- c(55,"married",49186.75,"Good risk")
I <- c(50,"married",46726.50,"Good risk")
data <- rbind(A,B,C,D,E,F,G,H,I)
colnames(data) <- c("Age","Marital","Income","Risk")
data.bck <- data
risk <- data.frame(data)

# Separate single and married attributes in Marital column
risk$married <- ifelse(risk$Marital=="married",1,0)
risk$single <- ifelse(risk$Marital=="single",1,0)
risk <- risk[,-2]

# Create the data point for Record #1
new <- risk[9,]
record.1 <- new[,-3]
cll <- c(risk[,3])

# classify the k-nearest neighbor for Record #1
knn.record1 <- knn(train = risk[,c(1,2,4,5)],
                   test = record.1,
                   cl = cll,
                   k = 2
)
knn.record1

# combine data in risk and new, then calculate Euclidean Distances

together <- rbind(record.1,risk[-3])
record1.dist<-rdist(together)
record1.dist