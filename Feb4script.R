library(tidyverse)
library(readr)

read_csv("Feb4data.csv")

Feb4data <- read_csv("Feb4data.csv") 
  

MeansFeb4<- Feb4data%>%group_by(Condition)%>% 
  summarise(Change=mean(Change))

SDFeb4<-Feb4data%>%group_by(Condition)%>%
  summarise(Change=sd(Change))

x<-Feb4data$Condition
y<-Feb4data$Change

plot.default(Feb4data)

Feb4data%>%group_by(Condition)

library(ggplot2)

Bar1<-ggplot(data = MeansFeb4, aes(x= as.factor(Condition), y=Change)) + 
     geom_bar(stat="identity") +
  xlab("Condition") + 
  ylab("% Change")

print(Bar1)


box1 <- ggplot(data = Feb4data, aes(x=as.factor(Condition), y=Change), fill = as.factor(Condition)) + 
  geom_boxplot() + 
  xlab("Condition") +
  ylab("% Change")

print(box1)
