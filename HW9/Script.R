install.packages("faraway")
library(faraway)
data(chredlin)
str(chredlin)
summary(chredlin)

par(mfrow=c(2,3))
for (i in 1:6){
  stripchart(chredlin[,i],main=names(chredlin)[i],
             vertical = TRUE, method = "jitter")
  }

par(mfrow=c(1,1))

summary(lm(involact~race, chredlin))
plot(involact ~ race, chredlin)
abline(lm(involact ~ race, chredlin))

plot(fire ~ race, chredlin)
abline(lm(fire ~ race, chredlin))

g <- lm(involact ~ race + fire + theft + age + log(income), chredlin)
summary(g)

plot(fitted(g), residuals(g))
abline(h=0)
qqnorm(residuals(g))
qqline(residuals(g))

gi <- influence(g)
qqnorm(gi$coef[,4])
halfnorm(cooks.distance(g))

range(rstudent(g))
chredlin[c(6,24),]

g <- lm(involact ~ race + fire + theft + age + log(income), chredlin, subset = -c(6,24))
summary(g)

prplot(g,1)
prplot(g,2)

chreduc <- chredlin[-c(6,24),]
install.packages("leaps")
library(leaps)
b <- regsubsets(involact~race + fire + theft + age + log(income), force.in = 1, data = chreduc)
rs <- summary(b)
names(rs)
rs$outmat
rs$adj


g <- lm(involact~race + fire + theft + age, chredlin, subset = -c(6,24))
summary(g)
galt <- lm(involact~race + fire + log(income), chredlin, subset = -c(6,24))
summary(galt)
galt <- lm(involact~race + fire , chredlin, subset = -c(6,24))
g <- lm(involact~race + fire + theft + age, chredlin)
summary(g)

g <- lm(involact)

