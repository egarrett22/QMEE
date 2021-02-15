library(tidyverse)
library(readr)

## JD: Did you think about choosing a theme?

## read_csv("Feb4data.csv") ## This is practice code and can be commented out for submission

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

## library(ggplot2) left over

Bar1<-ggplot(data = MeansFeb4, aes(x= as.factor(Condition), y=Change, fill=Condition)) + 
     geom_bar(stat="identity") +
  xlab("Condition") + 
  ylab("% Change") +
  ggtitle("% Change in heart rate")

print(Bar1)

##i cant get the colour filling to work on this one... any ideas?
## JD: It was not inside the aesthetic mapping
box1 <- ggplot(data = Feb4data, aes(x=as.factor(Condition), y=Change, fill = Condition)) + 
  geom_boxplot() + 
  xlab("Condition") +
  ylab("% Change") +
  ggtitle("% Change in heart rate")

print(box1)

## Grade 2.0/3

## BMB:
labs <- c("breathing_air", "apnea_coldwater",
          "apnea_air","snorkel_air","snorkel_water",
          "apnea_water")
ff <- Feb4data %>%
    mutate(across(Condition,
           ~factor(.,levels=1:6,
                   labels=labs))) %>%
    separate(Condition, into=c("breathtype","environment"))


## https://stackoverflow.com/questions/52122977/consistent-width-of-boxplots-if-missing-data-by-group
theme_set(theme_bw())
ggplot(ff, aes(x=environment, y=Change, fill = breathtype)) + 
    geom_boxplot(alpha=0.5,
                 notch=TRUE,
                 position=position_dodge(preserve="single")) +
    ## I would add points but positioning them is a pain
    ## geom_point(aes(colour=breathtype),position=position_dodge(width=0.75)) +
    xlab("Condition") +
    ylab("% Change")



