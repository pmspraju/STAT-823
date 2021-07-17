library(graphics)
library(ggplot2)
library(MASS)
library(Hmisc)
library(epiDisplay)
library(vcd)
library(mnormt)
library(MASS)
library(car)
library(ggpubr)
library(PairedData)
library(lmtest)
library(xtable)
library(faraway)
library(leaps)
library(psych)
library(Matrix)
library(dobson)
library(jtools)

# Problem 1
data(doctors)
str(doctors)
des(doctors)
doc <- data.frame(
  age       = as.numeric(unclass(as.factor(doctors$age))), 
  agesq     = (as.numeric(unclass(as.factor(doctors$age))))^2,
  agecat    = as.character(doctors$age),
  smoke     = as.numeric(unclass(as.factor(doctors$smoking))),
  deaths    = as.numeric(doctors$deaths),
  personyrs = as.numeric(doctors$'person-years')
)
doc
des(doc)

# Problem 1(a)
poismod <- glm(deaths ~ age + agesq + smoke + smoke:age, offset = log(personyrs), family = poisson(link = "log"), data = doc)
#summary(poismod)
summary(poismod, confint = TRUE, digits = 3, ci.width = 0.95)
  