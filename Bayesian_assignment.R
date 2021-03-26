ModBrad<-read.csv("Modified_Bradford_Calibration.csv")
library(R2jags)

Bradford<- jags(data="ModBrad",  
         inits=NULL,
         n.iter=200000, 
         n.thin=1,
         parameters=c("ma", "tau"), 
         model.file="Calibration curve.bug")

plot(Bradford)
