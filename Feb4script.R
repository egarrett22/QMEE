library(tidyverse)
library(ggplot2)
library(readr)

read_csv("Feb4data.csv")

Feb4data%>%group_by(Condition)%>% 
  summarise(`% change`=mean(`% change`))

Feb4data%>%group_by(Condition)%>%
  summarise(`% change`=sd(`% change`))

x<-Feb4data$Condition
y<-Feb4data$`% change`

plot.default(Feb4data)


