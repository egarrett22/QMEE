Feb4<-read.csv("Feb4data.csv")
Feb4$Condition<-factor(Feb4$Condition)
print(Feb4)

library("ggplot2"); theme_set(theme_bw())
library("lmPerm")
library("coin")
library("gtools")
library("rcompanion")

##Statistical test 1
##One way ANOVA of the 6 test conditions. I tried to set up a permutation test for this, but could not figure out how to properly set up the loop for all 6 conditions then run all the anovas for the perrmutation sets 
one.way <- aov(Feb4$Change ~ Feb4$Condition, data = Feb4)
summary(one.way)

anova.comp<- pairwise.t.test(Feb4$Change, Feb4$Condition, p.adj= NULL)
print(anova.comp)

##permutation test(partial)
anova.perm.test<-independence_test(Feb4$Change ~ Feb4$Condition,
                  data = Feb4 )
print(anova.perm.test)
##after this point im not sure how to go about comparing the observed value ANOVA results with the permutation ANOVA results 


##Statistical test 2
##difference in means of the observed values  
mean(Feb4$Change[Feb4$Condition=="1"])
mean(Feb4$Change[Feb4$Condition=="2"])
obs.mean.diff<-(mean(Feb4$Change[Feb4$Condition=="1"])-
                     mean(Feb4$Change[Feb4$Condition=="2"]))
print(obs.mean.diff)


##permutation test (difference in means)
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


all.mean.diff<- c(res, obs.mean.diff)
sum(all.mean.diff>=obs.mean.diff)/10000
mean(all.mean.diff>=obs.mean.diff)

##two tailed test the way multiplying by 2 way
2*mean(all.mean.diff>=obs.mean.diff)
##count both tails
mean(abs(all.mean.diff)>=abs(obs.mean.diff))






##Diagnostic plots assignment March 4th 2021
diagplot1 <- lm(Feb4$Change~Feb4$Condition, data=Feb4)
par(mfrow=c(2,2),mar=c(2,3,1.5,1),mgp=c(2,1,0))
plot(diagplot1,id.n=4)
print(diagplot1)


##Inferential plot
Feb4$Condition<-factor(Feb4$Condition, levels=c("1","2","3","4","5","6"))
lmcond<-lm(Feb4$Change~Feb4$Condition, data=Feb4)
print(lmcond)

library(emmeans)
e1<-emmeans(lmcond, "Condition")
pairs(e1)
plot(e1)
