skewdata <- read.csv("skewdat.csv")
m1 <- lm(skew~Size, data=skewdata)
par(mfrow=c(2,2),mar=c(2,3,1.5,1),mgp=c(2,1,0))
plot(m1,id.n=4) ##id.n=4: tells you your 4 biggest outlier points 
##residuals vs fitted: test for bias 
##scale location: measure of the change in variability as the fitted value increases: less variability in larger values in reproductive squew: is the variance across you data set more or less the same 
##residuals vs leverage: how much any given residual has on the slope. if all your values are within the 0.5 range of the cooks distance then you are good, if you have an outlier that is outside the dashed red lines, consider it an outlier and see what happens 
##normal QQ plot:how does your data compare to a normally distributed data set? in this case: the more negative residues in this graph are larger than you would expect them to be 


library(dplyr)
library(ggplot2); theme_set(theme_bw())
aa <- broom::augment(m1) %>% mutate(n=1:n())
(ggplot(skewdata, aes(Size,skew))
  + geom_point(aes(colour=abs(aa$.resid)>0.1))
  + geom_smooth(method="lm")
  + scale_colour_manual(values=c("black","red"))
)


lizards <- read.csv("lizards.csv", stringsAsFactors=TRUE) 
lizards$time <- factor(lizards$time,levels=c("early","midday","late")) ##early, midday and late should not be ordered alphabetically but logically
lmint <- lm(grahami~light*time, data=lizards)
lmboth <- lm(grahami~light + time, data=lizards)##additive model: depends on time, and sunny vs shaddy
lmlight <- lm(grahami~light, data=lizards)
lmtime <- lm(grahami~time, data=lizards)

print(summary(lmboth))
##coeffs: the difference between sunny and shaddy=-19.325



anova(lmboth, lmlight, test="F")


anova(lmboth, lmtime, test="F")


drop1(lmboth, test="F")
##start with the full model, then drop 1 parameter at a time and compare them 

car::Anova(lmboth)

print(summary(lmint))




library(emmeans)
e1 <- emmeans(lmboth, "time")
pairs(e1)
print(e1)
