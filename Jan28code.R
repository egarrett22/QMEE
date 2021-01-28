library(tidyverse)

read_csv("Jan22data.csv")

means=Jan22data%>%
  group_by(Protein)%>%
  dplyr::summarise(Mean=mean(A750))
print(means)

Jan22data$A750*5 
Jan22data$Means <- c(0.105,0.105,0.105,0.125,0.125,0.125,0.146,0.146,0.146,0.165,0.165,0.165,0.181,0.181,0.181,0.112,0.112,0.112,0.115,0.115,0.155,0.144,0.144,0.144,0.126,0.125,0.126)
