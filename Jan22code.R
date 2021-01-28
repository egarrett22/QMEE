##updates to the Jan22 assignment for class. From this line down the code should run
## JD: The goal is that code should just run; I've deleted what's above here
## You can use github to save parts of it if that proves necessary
## You're also free to edit and track files that aren't part of your assignment

library(tidyverse)

## JD: How strongly do you object to the shorter and simpler name?
##Shorter names are fine, this is just the normal way i keep files on my computer which i am now realizing may not be so friendly when working with RStudio
Trial_data_QMEE_assignment_Jan_22 <- read_csv("Jan22data.csv")

means=Trial_data_QMEE_assignment_Jan_22%>%
  group_by(Protein)%>%
  dplyr::summarise(Mean=mean(A750))
print(means)
