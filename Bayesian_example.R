set.seed(411)
N <- 40
## predictor variables
a <- runif(N)
b <- runif(N)
c <- runif(N)
y <- rnorm(N,mean=2+1*a+4*b+1*c,sd=1)
dat <- data.frame(y,a,b,c)

library("R2jags")

j<- jags(data=list(y=y, a=a, b=b, c=c, N=nrow(dat)), 
         inits=NULL,
         n.iter=200000, 
         n.thin=1,
         parameters=c("ma", "mb", "mc", "tau"), 
         model.file="bayes.bug")

##diagnostics
plot(j)
library("emdbook")
bb<- as.mcmc.bugs(j$BUGSoutput)
plot(bb)
##want this too look like a caterpillar, want all fuzzy, dont want to see any trend (for the Trace of...). 
##density plot: where are the values centered around. Fine if this is squewed a bit. not particular form it has to take 

