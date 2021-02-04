library(tidyverse)
library(readr)

read_csv("Feb4data.csv")

Feb4data%>%group_by(Condition)%>% 
  summarise(`% change`=mean(`% change`))

Feb4data%>%group_by(Condition)%>%
  summarise(`% change`=sd(`% change`))

x<-Feb4data$Condition
y<-Feb4data$`% change`

plot.default(Feb4data)

library(ggplot2)

##when i run the boxplot like we did it class, i am getting these errors and have no idea how to resolve them
box1<-(ggplot(Feb4data, aes(x=Condition,y=% change,
                            colour=Condition
       + geom_boxplot(outlier.colour=NULL))
