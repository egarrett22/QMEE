##updates to the Jan22 assignment for class. From this line down the code should run
## JD: The goal is that code should just run; I've deleted what's above here
## You can use github to save parts of it if that proves necessary
## You're also free to edit and track files that aren't part of your assignment

## BMB: PLEASE delete comments from us that you've dealt with/that are no
##  longer relevant.

library(tidyverse)

## JD: How strongly do you object to the shorter and simpler name?
##Shorter names are fine, this is just the normal way i keep files on my computer which i am now realizing may not be so friendly when working with RStudio
Trial_data_QMEE_assignment_Jan_22 <- read_csv("Jan22data.csv")

means=Trial_data_QMEE_assignment_Jan_22%>%
  group_by(Protein)%>%
  dplyr::summarise(Mean=mean(A750))
print(means)



##just me playing around trying to get familiar with the name function and pulling out variables from a dataframe. Sorry if its messy, i can do this in another file it it muddles things up too much

## BMB: you never assigned to a variable "Jan22data", so this code
## and all of the code below here will fail. PLEASE run your code
## in a clean R session (easiest way is with the "Source" button)
## to check for issues like this.

## BMB: fixing this for you so the rest of the code works
Jan22data <- Trial_data_QMEE_assignment_Jan_22

Jan22data$Protein
Jan22data$A750
names(Jan22data)

## BMB: yes, please clean up stuff that isn't part of your workflow
## before submitting. Part of the goal of the course is to get you
## to write scripts for analysis that are clean and understandable,
## and too much "just playing around" code makes it harder to follow

##do I have to assignment columns as variables as i did below for the subsequent functions to work? i tried to run the functions off just the column names and i got a ton of error messages but when i assigned the column to variables x and y the code ran fine.
## BMB: many R functions have 'data' arguments and ways to specify the
## variables via formula (see below)
## Usually better to refer to variables _within_ the data frame so
## you don't end up with lots of confusing stuff lying around in your
## workspace (see examples below)
##
## This is another reason we like to keep variable names short
## (although TAB/completion can help with that)
x<-Jan22data$Protein
y<-Jan22data$A750
cor.test(x,y)

## BMB: this is probably best
cor.test(~ Protein + A750, data=Jan22data)
## or
cor.test(Jan22data$Protein, Jan22data$A750, data=Jan22data)
## or
with(Jan22data, cor.test(Protein, A750))

plot(x,y, main = "ProteinQuantificationCurve", xlab="ProteinConcentrationmg/mL", ylab="AbsorbanceAt750nm")

## BMB:
plot(A750~Protein,
     data=Jan22data,
     main = "Protein Quantification Curve",
     xlab="Protein Concentration (mg/mL)",
     ylab="Absorbance (@ 750nm)")
## BMB: you are allowed and ENCOURAGED to have spaces and punctuation
## in your plot labels!

abline(lm(A750~Protein, data=Jan22data), col="blue")

## BMB: definitely looks curvilinear
## is there a standard nonlinear function that's used for this
## type of quantification (Michaelis-Menten etc.)?

## BMB: I tried this but it didn't work at all, we can talk if you
## want to go this direction
## (nfit1 <- nls(A750 ~ SSmicmen(Protein+1e-6, Vm, K), data=Jan22data))

## abline(lm(y~x, data=Jan22data), col="blue")

## mark: 1.9