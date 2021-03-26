ModBrad<-read.csv("Modified_Bradford_Calibration.csv")
print(ModBrad)

library(R2jags)


Bradford <- jags(data=list(y=ModBrad$AbsRatio, a=ModBrad$Protein),  
         inits=NULL,
         n.iter=200000, 
         n.thin=1,
         parameters=c("ma", "tau"), 
         model.file="Calibration curve.bug")

plot(Bradford)

library("emdbook")
Bradford2<- as.mcmc.bugs(Bradford$BUGSoutput)
plot(Bradford2)