# Individual Variable Scatter Plots of Rating vs. Sugars and Fiber
par(mfrow=c(1,2),
    mar=c(4.5,4,3,3),
    oma=c(0,1,0,0))
lm91 <- lm(cereal$rating~
             cereal$sugars,
           data=cereal)
lm92 <- lm(cereal$rating~
             cereal$fiber,
           data=cereal)
plot(cereal$rating~
       cereal$sugars,
     data = cereal,
     pc=16,
     col="red",
     ylab = "Rating",
     xlab = "Sugar")
abline(lm91,col="blue")
plot(cereal$rating~
       cereal$fiber,
     data = cereal,
     pc=16,
     col="red",
     ylab = "Rating",
     xlab = "Fiber")
abline(lm92,col="blue")
#Reset plot area
par(mfrow=c(1,1))