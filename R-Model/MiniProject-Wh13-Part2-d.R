# Confidence Intervals
confint(mreg1, level=0.95)
predict(mreg1, newdata=data.frame(sugars=5, fiber=5), interval = c("confidence"))
predict(mreg1, newdata=data.frame(sugars=5, fiber=5), interval = c("prediction"))