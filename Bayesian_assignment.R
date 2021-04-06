##Bayesian model using jags

ModBrad<-read.csv("Modified_Bradford_Calibration.csv")
library(R2jags)

## BMB: could leave variable names meaningful (i.e. use
## Protein, AbsRatio as the variable names in the Bayes calc)
Bradford <- jags(data=list(y=ModBrad$AbsRatio, a=ModBrad$Protein),  
         inits=NULL,
         n.iter=200000, 
         n.thin= 1, 
         n.chains = 3, 
         parameters=c("ma", "int", "tau"), 
         model.file="Calibration curve.bug")
##but not very useful for knowing if this is a good model or not 
plot(Bradford)
## BMB: not sure why we have that big excursion right at the beginning?

library("emdbook")
Bradford2<- as.mcmc.bugs(Bradford$BUGSoutput)
plot(Bradford2)
summary(Bradford2)


##Frequentist model: Linear model using lm

LmBradord <- lm(AbsRatio~Protein, data=ModBrad)
library(dplyr)
library(ggplot2); theme_set(theme_bw())
LmBradfordplot<-(ggplot(ModBrad, aes(Protein,AbsRatio))
  + geom_smooth(method="lm")
  +geom_point(mapping=NULL, colour="BLACK")
  )
plot(LmBradord)
print(LmBradfordplot)

## BMB: this is fine. Not much advantage in the Bayesian approach
## here (straightforward model, plenty of data, no prior info)
## grade: 2/3