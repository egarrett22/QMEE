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

##just me playing around trying to get familiar with the name function and pulling out variables from a dataframe. Sorry if its messy, i can do this in another file it it muddles things up too much
Jan22data$Protein
Jan22data$A750
names(Jan22data)

##do I have to assignment columns as variables as i did below for the subsequent functions to work? i tried to run the functions off just the column names and i got a ton of error messages but when i assigned the column to variables x and y the code ran fine.
x<-Jan22data$Protein
y<-Jan22data$A750
cor.test(x,y)

plot(x,y, main = "ProteinQuantificationCurve", xlab="ProteinConcentrationmg/mL", ylab="AbsorbanceAt750nm")

abline(lm(y~x, data=Jan22data), col="blue")
