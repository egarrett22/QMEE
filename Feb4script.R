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

ggplot(data = Feb4data, aes(x=Condition, y=Change, colour=Condition)) + 
  geom_point() +
  xlab("Condition") +
  ylab("% Change") +
  ggtitle("% Change in heart rate")

Feb4data%>%group_by(Condition)

library(ggplot2)

Bar1<-ggplot(data = MeansFeb4, aes(x= as.factor(Condition), y=Change, fill=Condition)) + 
     geom_bar(stat="identity") +
  xlab("Condition") + 
  ylab("% Change") +
  ggtitle("% Change in heart rate")

print(Bar1)

##i cant get the colour filling to work on this one... any ideas?
box1 <- ggplot(data = Feb4data, aes(x=as.factor(Condition), y=Change), fill = (Condition)) + 
  geom_boxplot() + 
  xlab("Condition") +
  ylab("% Change") +
  ggtitle("% Change in heart rate")

print(box1)

