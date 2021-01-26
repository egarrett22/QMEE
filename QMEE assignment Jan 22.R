mean(Trial_data_QMEE_assignment_Jan_22$A750)
library(tidyverse)
df=Trial_data_QMEE_assignment_Jan_22
names(Trial_data_QMEE_assignment_Jan_22)=c("protein_concentration", "A750")
df_name_means=df%>%group_by(protein)%>%dplyr::summarise(Mean=means("protein_concentration", na.rm=TRUE))
means=Trial_data_QMEE_assignment_Jan_22%>%
  group_by(protein_concentration)%>%
  dplyr::summarise(Mean=mean(A750))