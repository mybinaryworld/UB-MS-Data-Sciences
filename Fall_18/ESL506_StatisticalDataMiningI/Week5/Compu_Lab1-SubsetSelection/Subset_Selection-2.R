#########################################################################################
## This code is perform subset selection using different methods.
## Rachael Blair 
## Created: September 20, 2016
## Edited: September 23, 2018
#########################################################################################
rm(list = ls())

library(MASS)
library(leaps)

##################
##
## load data
##################
data(Boston)

boston <- Boston #cap sensitive
##################
# All possible subsets
##################
regfit.full <- regsubsets(medv~., data = boston, nbest = 1, nvmax = 13, method = "exhaustive")
my_sum <- summary(regfit.full)

par(mfrow = c(2,2))
plot(my_sum$cp, xlab = "Number of Variables", ylab = "Cp", type = "l")
plot(my_sum$bic, xlab = "Number of Variables", ylab = "BIC", type = "l")

plot(my_sum$rss, xlab = "Number of Variables", ylab = "RSS", type = "l")
plot(my_sum$adjr2, xlab = "Number of Variables", ylab = "Adjusted R^2", type = "l")

#They both agree model with 11 variables is the best.
which(my_sum$cp == min(my_sum$cp))
which(my_sum$bic == min(my_sum$bic))

x11()
plot(regfit.full, scale = "r2")
x11()
plot(regfit.full, scale = "adjr2")
x11()
plot(regfit.full, scale = "Cp")
x11()
plot(regfit.full, scale = "bic")

#######################################
# Forward and Backwards subset selection
#######################################
regfit.fwd <- regsubsets(medv~., data = boston, nvmax = 13, method = "forward")
regfit.bwd <- regsubsets(medv~., data = boston, nvmax = 13, method = "backward")
summary(regfit.fwd)
summary(regfit.bwd)

# Examine the best 7 (or whatever) variable models
summary(regfit.full)$outmat[7,]
summary(regfit.fwd)$outmat[7,]
summary(regfit.bwd)$outmat[7,]

# Look at the regression models determined by the different methods
coef(regfit.full, 5)
coef(regfit.fwd, 5)
coef(regfit.bwd, 5)








