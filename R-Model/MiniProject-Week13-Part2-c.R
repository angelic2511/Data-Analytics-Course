# Multiple Regression: #Output, t-Tests, F-Tests
mreg1 <- lm(rating~
              sugars+
              fiber,
            data = cereal)
summary(mreg1)
# t-test are in the
# coefficients table
# F-test: bottom row
# of the output
ma1 <- anova(mreg1)
ma1
# SSR is broken up 
# between predictors