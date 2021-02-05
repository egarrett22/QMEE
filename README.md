# QMEE

## Assignment 1

**BMB: You don't need to use comment characters ## in this, it's basically a plain text file with a little bit of extra stuff for headings, boldface, etc.**

For the Jan22 data set that I used, the values represent a simple protein concentration curve that I had done for my undergrad thesis that later allowed me to quantify the protein I was working with.

I worked with red algae that produced a compound called DMSP or dimethylsulfoniopropionate, and molecule that allows the algae to osmoregulate in harsh marine conditions; it's also thought to be an important player in the global sulfur cycle. I was working to characterize one of the enzymes involved in the production of DMSP, which often required me to perform protein quantifications.

**JD: what are the numbers being analyzed by your script?**

The numbers are absorbances readings at 750nm and mean protein concentration in mg/ml

## Assignment 2 information

I worked off the same data as in the first assignment. This time I plotted it (simple scatter plot) and put a simple regression line through it. I didn't find any mistakes in the data. 

**BMB: how did you examine your data for mistakes? (This data is very small so you can pretty much just look at it in Excel or whatever, but it will really help to come up with strategies that you can use when your data sets are larger/more complicated)**

I removed the protein 1 in 2, 1 in 4, etc data from the data set because those would not be included in the protein standard concentration curve.

**BMB: I'm not sure what that means or how you removed it?**

I would rather work off the regression equation to then figure out what those absorbance value represented in terms of protein concentration. I know you both had mentioned not having blank spaces in titles, does that also apply to plot titles and axis titles? how would those best be formated?

**BMB: we don't want blank spaces in FILE NAMES. Blank spaces and punctuation are great in titles!**

In terms of replicable components, in any given experiment series i have had to do protein quantification via multiple methods, i could also break data up by protein type, I tend not to only investigate one protein, but many, so the various dilution series for each protein could be broken up into replicates. 
I was wondering what the best way would be to get the intercept as well as the regression line equation?

**BMB: I'm not sure what you mean here. If you want the coefficients (including the intercept and slope, save the model and use `coef(fitted_model)`**


Assignment 3: Data visualization 
Because I still do not have data from my masters project (due to Covid delays) I will be using more data that I used during my undergrad. This data set comes from an experiment in my human physiology class where we investigated the dive response. The dive response in short is the bodys response to submerssion in water. Here we recorded % changes in heart rate when an individuals head was submerged in water for a length of time. There were 6 conditions: 
1)Breathing normally in air
2. apnea in cold water
3. apnea in air 
4. breathing in air with snorkel 
5. breathing in water with snorkel
6. apnea in water

What are we trying to show? We are trying to show the % change in heart rate between the 6 breathing conditions. generally, apnea decreased heart rate with apnea in cold water showing the largest decrease. There is however a HUGE variability in the data which is also something that should be noted 
Choice ive made
  the ggplot scatter plot was just to see if the group_by condition would work on a scatter plot 
  the bar graph is a good way of showing the generalized trends in mean % change in heart rates across the breathing conditions 
  the boxplot i believe follows what were were told in class about visulaizing "medium" amounts of data, there arent too many points as to overfill the box plot, but not too few to make a scatter plot 