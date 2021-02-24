library("ggplot2"); theme_set(theme_bw())
library("lmPerm")
library("coin")
library("gtools")

ants <- read.csv("ants.csv")
ants$place <- factor(ants$place)
print(ants)

print(ggplot(ants,aes(place,colonies))
      + geom_boxplot(fill="lightgray")
      + stat_sum())

str(ants)
##shows that place is a factor

##same as the graph right before this
ggplot(ants,aes(x=place, y=colonies))+geom_boxplot() + stat_sum()


set.seed(101) ##when working with random number generators. synchronizing the random numbers 
##sramble data and calculate statistic and do that multiple times 
nsim <- 9999
res <- numeric(9999) 
for (i in 1:9999) {
  
  perm <- sample(nrow(ants))
  bdat <- transform(ants,colonies=colonies[perm])
  fieldmean<- mean(bdat[bdat$place=="field", "colonies"])
  forestmean<- mean(bdat[bdat$place=="forest", "colonies"])
  res[i]<-fieldmean-forestmean ##saves the result 
}

print(hist(res))

truefieldmean <- mean(ants[ants$place=="field","colonies"])
trueforestmean <- mean(ants[ants$place=="forest","colonies"])
truefieldmean-trueforestmean
obsval <- truefieldmean- trueforestmean
hist(res)

abline(v=obsval, col="red")
plot(table(res))
allvals<- c(res, obsval)
sum(allvals>=obsval)/10000
mean(allvals>=obsval)

2*mean(allvals>=obsval)
mean(abs(allvals)>=abs(obsval))

tt <- t.test(colonies~place,data=ants,var.equal=TRUE)
print(tt)
tt$statistic

library(lmPerm)
summary(lm(colonies~place, data=ants)) ## gives you some of the smae info as a t test
lmp(colonies~place, data=ants) ##does not rely on data distribution (normal or abnormal)
m1<- lmp(colonies~place, data=ants)
summary(m1)





skewdat <- read.csv("skewdat.csv")
(ggplot(skewdat, aes(Size,skew))
  + geom_point()
  +geom_smooth(method="lm", formula=y~x)
)

summary(lm(skew~Size,data=skewdat))


simfun_rsamp2 <- function(respvar="skew",data=skewdat) {
  permdat <- data
  permdat[[respvar]] <- sample(permdat[[respvar]])
  permdat
}
sumfun_skew <- function(dat) {
  coef(lm(skew~Size,data=dat))["Size"]
}