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
The assignment code file is Feb4script.R
  would you prefer that this Feb4script.R be incorporated into the QMEE_code.R master assignment file that BMB created following the last assignment?

Because I still do not have data from my masters project (due to Covid delays) I will be using more data that I collected during my undergrad. This data set comes from an experiment in my human physiology class where we investigated the dive response. The dive response is the body's response to submersion in water. Important factors to consider are temperature effects and apnea effects.  Here we recorded % changes in heart rate when an individuals head was submerged in water for a length of time. There were 6 conditions: 

1. Breathing normally in air
2. apnea in cold water
3. apnea in air 
4. breathing in air with snorkel 
5. breathing in water with snorkel
6. apnea in water

JD: I would say good datavis should clarify the _structure_ of these conditions. Although I have to say it looks hard. 1 and 3 share something in common, and three of the conditions have apnea. But the rest is a bit mysterious. What is the comparotor for apnea in cold water, for example?

The snorkel: we used snorkels to investigate if the dive response was temperature dependent, apnea dependent or a combination of both. To do this, we had individuals use a snorkel and submerge their faces in water to allow for breathing, this would give us an idea of how temperature affected heart rate, they then breathed in air with the snorkel as a control to see if the snorkel changed heart rate. 

What are we trying to show? We are trying to show the % change in heart rate between the 6 breathing conditions. generally, apnea decreased heart rate with apnea in cold water showing the largest decrease. There is however a HUGE variability in the data which is also something that should be noted.

Choices I've made
  the ggplot scatter plot was just to see if the group_by condition would work on a scatter plot, this is not a graph you would want to report in a paper. However i do find visualizing the data points like this give you some initial sense of data range/variability before continuing with more in depth analysis, i believe this would fall under a diagnostic type plot where we are looking for general trends in the data. 
  
  the bar graph is a good way of showing the generalized trends in mean % change in heart rates across the breathing conditions. It would be even better if standard deviation error bars were added but I couldnt figure out how to make that work. I believe this, along with the new plot, the box plot, follow the cleveland hierarchy where data are compared along a "common scale", the Y axis. 

JD: I did not like the bar plot; lots of ink and little information. I thought the points plot was better. You could also think about putting the points onto a boxplot.
  
  the boxplot i believe follows what were were told in class about visulaizing "medium" amounts of data, there arent too many pointsas to overfill the box plot(not thousands, but more than 100) , but not too few to make a scatter plot 

JD: The color legends are wasted information. You might want them later if it's a better way to describe conditions, but I kind of think you won't.
  
A question: One thing I would have liked to of had on these plots but could not figure out how to print or add was a legend of what each condition number meant. Do either of you have nay guidance on this issue? 

JD: This relates to my question. It will be easier once I understand how the levels relate to each other. But a good start in general could be just to replace the conditions with good names. You can also think about trying BB's coord_flip trick to get conditions on the y axis and make it easier to associate readable text with them.




Permutation assignment (Feb 26)
For this assignment I will continue to work off of the dive response data that was used in previous assignments. 

Hypothesis 1:  We hypothesize that there will be multiple conditions where the % change in heart rate will have greater variance than the control condition (normal breathing in air(1))
  How would you evaluate this with permutation tests: To  compare all 6 conditions of this study, I would use a one way-ANOVA. I could use the permutation test here by running the ANOVA on the collected data, then one scrambled, randomized permutation data and compare the two P values. Now, an ANOVA does make assumptions about the data; that its normally distributed and that the variation within each group in similar in every group. So maybe an ANOVA is not the best statistical test if we are trying to distance ourselves from making assumptions about the data that was collected. 

JD: You are absolutely free to use the ANOVA _statistic_ to compare the observed to permuted data. That will provide a valid P value with no distributional assumptions.

For hypothesis 2 I will just consider the "normal breathing (1)" and "apnea in cold water (2)" conditions for 
Hypothesis 2: We hypothesize that the apnea in cold water condition will elicit the dive response but all other conditions will not. This will be measured as a change in % heart rate. The dive response is expected to decreases heart rate when compared to normal breathing control conditions.Therefore, mean heart rate % change should be lower in the apnea condition when compared to the normal breathing condition. Following what we learned this week, we would seek to find if we can clearly see the sign of the % change in heart rate of the apnea in cold water condition.We would expect the sign of the change to be negative.
  How to evaluate this: we could look at the difference in mean between the collected values from the study and the randomly generated permutation values and see if there is a difference, and if that difference arose due to chance. 
  
JD: Sensible, but not quite a sharp explanation
  
  
## assignment 6  

Diagnostic plot assignment

Checking the concerns about our data: 
1)Bias/linearity: residuals vs fitted: no nonlinear relationships

2)Heteroscedasticity: scale-location graph.Are there differences in variance across the conditions? Slight heteroscedasticity: The first two conditions on the left have more or less the same level of variance, and the two conditions to the right have a slightly different variance level(lower than the first two)

3)Normality: Normal Q-Q: how do the data compare to a normal distribution: Data are normal


Inferential plot 
When we initially did this experiment, the entire point of the experiment was to get a general introduction to multiple comparisons.From the pairs tables (pairs (e1)), I would assume (maybe incorrectly) that to interpret which pairings are significantly different from another you would look at the p.value for that pairing. I know from Thursday we were cautioned against picking through all these pairings and choosing which had a statistically significant P-vlaue and which did not, and perhaps mistakenly or implicitly accepting the null hypothesis for the other pairings that did not look to be statistically significantly different based solely on the p-value. In this study, the pairing we were most interested in was the condition 1 (control) vs condition 2(cold water apnea). Based solely on the P-value presented in the emmeans pairs comparison, this pairing is significantly different. You could then follow this up with a t-test of condition 1 and 2 to further test for difference between the two conditions.




## assignment 7: generalized linear models 
Data used: For this assignment I used a "new" data set I have not used before.This data set is from an animal behaviour class where we looked at duck activity at dawn, over time (2 week). Active ducks at dawn were defined by either flying/swimming/walking around within a certain marked perimeter (the visible perimeter of the pond we were looking at). This study was conducted close to when you would expect ducks to begin their migration down south. We took duck activity (a crude and relative measure of the number of ducks present in the environment) and wanted to see if we could measure duck activity decreasing as the ducks began their migration. One, among many, issues with this study is that it was not conducted over a long enough period of time, nor was it properly positioned around duck migration (i think we were a week too early). Duck activity at dawmn may also not have been the best measure, but thats what the lab protocol was at the time. 

Hypothesis: will duck activity decrease at dawn as ducks begin their normal migratory journeys to warmer climates?
What did we expect? we expected that at some point duck activity, and       therefore ducks present in the pond would plummet, and remain near zero as they all flew down south. this is not what we saw unfortunately, duck levels stayed, relatively constant, with potentially a slight downward trend in numbers over time. 

inferential ggplot (duck2):
comparing the glm to the collected values: unfortunately not all of the collected data fall in or near the model and the confidence intervals. this suggests that the data may be overdispersed and we will need to account for variable data, we will have to check the (residual deviance/residual df) to see if it is overdispersed (it is). This data doesnt visually look like a quadratic or polynomial fit would help to explain the trends in the data. Overall, the model has a slight negative trend in active duck count over time. 
This is cout data, so we would choose a poisson distribution. i believe the first time i ran the plots as a poission, the summary information said the data was overdispersed, so i switch to the quasi-poisson model. 

## JD: Better to explain model choice first and then discuss results. DATA don't have to fall in or near confidence intervals. The CIs for the average height of a Canadian woman are _very_ narrow (because many thousands of measurements); most of the points don't fall inside.

what do we conclude from the diagnostic plots: 
the residual vs fitted plot shows us that for the most part, the data are linear except for at both extremes of the x axis. fitting a quadratic model may help with this, but probably not, the slight pattern here is probably fine. 
the quasipoisson logged model/data seem normal (normal Q-Q), so there is no problem there. The model may be slightly heteroscedastic as there is a noticeable pattern in the scale-location diagnostic plot, again here, perhaps using the above mentioned quadratic model may help minimize any patterns there.
what does all of this tell us? duck activity at dawn over the two week time course did not change. 

JD: Um, everything is changing, all the time. Possibly you're trying to say tha the direction of the change wasn't clear? Or that you're confident that the change was small? Did you do any coefficient plots, or look at summary tables? Not sure where you're getting that.

Grade: 1.6/3

##assignment 8: Bayesian statistics 
The data: these data were collected to created a calibration curve with which we could measure protein concentration. The methods: use a blue dye that binds to protein, the more protein there is, the more the protein solution turns blue.We do this with a set of protien standards, We read the absorbance values of these standards and generate a calibration curve. then we take our protein solution that we dont know the concentration of, dye it, take the absorbance reading, and use the regression equation of the calibration curve to figure out what the protein concentration of the unknown sample was. 

Should we choose a bayesian or frequentist method of thinking?
Since we want to work backwards from the model to predict how much protein is in a sample based on its absorbance reading, and we want to be as certain as possible when it comes to the accuracy to the predicted protein concentration of our protein sample of unknown concentration, I believe using the bayesian statistics approach is most appropriate. 
With a frequentist approach, the question we ask ourselves is "were our observations observed by chance and	Is it likely that the observations didn’t happen by chance?". This is not really the question that interests us when we are trying to work backwards from the model. So instead we would choose the bayesian philosophy. Using the bayesian philosophy, we use probabilities to qualify the uncertainty of the results. 

Is our bayesian model any good?
If we look at the diagnostic info, the Rhat values are all 1.001, so there is no worries there, the n.eff looks decent. Also, the "caterpillar" plots generated by the as.mcmc.bugs function dont show any concerning trends 

Compare the two models 
the diagnostics for both look OK. There are no aggregious problems as far as I can tell. The frequentists method (lm model) does seem to have a better P value than the baysian model and may indicate it being a better model, but conceptually I thought the bayesian model was best suited to the kind of analysis we are trying to do with this (work backwards from the model). 

Discuss the prior assumptions: 
1. We assume the values are linear along a linear scale (and not a log scale)
2. Data may be skewed/less accurate at the extreme ends (high and low), this is due to the dye being used in the technique, it is less sensitive and the high and low ends of the spectrum of protein concentrations. 



