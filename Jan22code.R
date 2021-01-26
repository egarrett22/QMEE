## I hope it's OK that I moved your files (names should not have spaces, and don't need to repeat the fact that this is QMEE, since that's the repo name)
## I don't understand this code at all.
## You don't have any code that would read the file into R (I know I didn't fix the file name, but neither did you, and none of this would read any sort of file).
## Remember, you should be able to "restart" R and "source" your code.
## I am marking this "incomplete" -- JD
## There is also no explanation that I can see in README.
mean(Trial_data_QMEE_assignment_Jan_22$A750)
library(tidyverse)
df=Trial_data_QMEE_assignment_Jan_22
names(Trial_data_QMEE_assignment_Jan_22)=c("protein_concentration", "A750")
df_name_means=df%>%group_by(protein)%>%dplyr::summarise(Mean=means("protein_concentration", na.rm=TRUE))
means=Trial_data_QMEE_assignment_Jan_22%>%
  group_by(protein_concentration)%>%
  dplyr::summarise(Mean=mean(A750))


library(tidyverse)

Trial_data_QMEE_assignment_Jan_22 <- read_csv("Trial data QMEE assignment Jan 22.csv")


means=Trial_data_QMEE_assignment_Jan_22%>%
  group_by(Protein)%>%
  dplyr::summarise(Mean=mean(A750))
print(means)