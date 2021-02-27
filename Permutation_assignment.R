Feb4<-read.csv("Feb4data.csv")
Feb4$Condition<-factor(Feb4$Condition)
print(Feb4)


##One way ANOVA of the 6 test conditions 
one.way <- aov(Feb4$Change ~ Feb4$Condition, data = Feb4)
summary(one.way)


##difference in means of the observed values  
mean(Feb4$Change[Feb4$Condition=="1"])
mean(Feb4$Change[Feb4$Condition=="2"])
obs.mean.diff<-(mean(Feb4$Change[Feb4$Condition=="1"])-
                     mean(Feb4$Change[Feb4$Condition=="2"]))
print(obs.mean.diff)


library("ggplot2"); theme_set(theme_bw())
library("lmPerm")
library("coin")
library("gtools")

##permutation test
set.seed(101)
nsim<-9999
res<-numeric(nsim)
for (i in 1:nsim) {
  perm <- sample(nrow(Feb4))
  edat <- transform(Feb4,Change=Change[perm])
  meancond1 <- mean(edat[edat$Condition=="1", "Change"])
  meancond2 <- mean(edat[edat$Condition=="2", "Change"])
  res[i] <- meancond1-meancond2
}


allvals<- c(res, obs.mean.diff)
sum(allvals>=obs.mean.diff)/10000
mean(allvals>=obs.mean.diff)

##two tailed test the way multiplying by 2 way
2*mean(allvals>=obs.mean.diff)
##count both tails
mean(abs(allvals)>=abs(obs.mean.diff))


