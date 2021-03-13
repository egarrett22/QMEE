ducks<-read.csv("Ducks at dawn.csv")

library(ggplot2)

##inferential plots
duck1 <- ggplot(data = ducks,aes(day.since.start,ducks))+geom_point()
plot(duck1)

duck2 <- duck1 + geom_smooth(method="glm",colour="blue",
                         formula=y~x,
                         method.args=list(family="quasipoisson"(link="log")))
plot(duck2)

##diagnostic plot
duck3 <- glm(ducks~day.since.start,data=ducks,family= "quasipoisson" (link="log"))
summary(duck3)
plot(duck3)




