aids<-read.csv("aids.csv")
library(ggplot2)
aids <- transform(aids, date=year+(quarter-1)/4)
gg0 <- ggplot(aids,aes(date,cases))+geom_point()
plot(gg0)
gg1 <- gg0 + geom_smooth(method="glm",colour="red",
                         formula=y~x,
                         method.args=list(family="quasipoisson"(link="log")))
plot(gg1)

g1 <- glm(cases~I(date-min(date)),aids,family=quasipoisson(link="log"))
summary(g1)
plot(g1)
##residuals vs fitted: clear pattern (exponential looking curve). Worry about this before anything else
##over predicting at the beginning and end, underpredicting in the middle 
##how to deal with this? fit a quadratic model instead of a linear model 

g1p<-update(g1, family=poisson(link="log"))
summary(g1p)
##what does the p value on the intercept mean? confident that the log of the aids cases is greater than 1 at the intercept 
##the p value of the I(date-min date) tells us that we are confident that we are seeing the sign we think we are 


g2 <- update(g1,.~poly(date,2))
summary(g2)
plot(g2)



acf(residuals(g1))