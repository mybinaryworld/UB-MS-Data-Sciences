###########################################################
##
## This code demonstrates single and multiple regression
##
## Created: September 9, 2014
## Edited: September 10, 2018
##
###########################################################
rm(list = ls())
library(ElemStatLearn)
library(MASS)  ### contains the boston data
setwd("~/Desktop/STA_545_Fall2014")

############################
# Load the data
############################
data(Boston)
?Boston
names(Boston)

boston <- Boston

############################
# Simple Regression
############################
fit <- lm(medv ~ lstat, data = boston)
names(fit)
summary(fit)

# Compute confidence interval
confint(fit)

# Compute a Confidence interval for specific values of the 	predictors....
predict(fit, newdata = data.frame(lstat = c(5,10,15)))

predict(fit, newdata = data.frame(lstat = c(5,10,15)), interval = "confidence")

#############################################
## Multiple Regression Model
#############################################
# build a small model
small_model <- lm(medv ~ lstat + age, data = boston)
summary(small_model)

large_model <- lm(medv ~ ., data = boston)
summary(large_model)

trimmed_model <- lm(medv~ .-age, data = boston)
my_summary <- summary(trimmed_model)
names(my_summary)
my_summary$coefficients
my_summary$adj.r.squared




