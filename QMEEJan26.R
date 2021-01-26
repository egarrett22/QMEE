library(tidyverse)

Trial_data_QMEE_assignment_Jan_22 <- read_csv("Trial data QMEE assignment Jan 22.csv")


means=Trial_data_QMEE_assignment_Jan_22%>%
  group_by(Protein)%>%
  dplyr::summarise(Mean=mean(A750))
print(means)