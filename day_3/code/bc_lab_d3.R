############################################
## Lab 3: More on Data Types and Plotting ##
############################################


#### Reviewing different data types in R ####

## Two functions to check data type:
## class(x) - returns class of objecct 
## is._____(x) - returns TRUE or FALSE

## numeric
class(5)
is.numeric(5)
class(.0001)
is.numeric(.0001)
class(Inf)
is.numeric(Inf)

## character
class("hello world")
is.character("hello world")

## logical
class(TRUE)
is.logical(TRUE)
class(FALSE)
is.logical(FALSE)
class(NA)
is.logical(NA)

## dataframe
## make sure to use setwd() to locate to where data is saved
load("drugCoverage.Rda") ## use load() to read in R data
class(drugCoverage)
is.data.frame(drugCoverage)

#### How do data types interact in R? ####

## Remember vectors take only one datatype
## So what happens when you try to combine
## data types in a vector?
nums <- c(1, 2, 3)
nums

nums_and_strings <- c(1, 2, 3, "hello", "world")
nums_and_strings

nums_and_logicals <- c(1, 2, 3, FALSE, TRUE)
nums_and_logicals

strings_and_logicals <- c("hello", "world", TRUE, FALSE)
strings_and_logicals


#### More plotting practice ####

## Description of drug coverage data is in Monogan, 3.5
## Histogram of counts of number of nightly television
## news stories in a month focusing on drugs

## default bins
hist(drugCoverage$approval)

## breaks argument allows for control over bins
hist(drugCoverage$approval, breaks = 20) 

## let's add more detail to the plot
hist(drugCoverage$approval,
     breaks = 20,
     main = "Presidential Approval for 1977-1992",
     xlab = "Approval Rate",
     col = "purple")

## let's subset the data to just news stories when
## George H.W. Bush was president
hist(drugCoverage$drugsmedia[drugCoverage$year >= 1989],
     breaks = 20,
     main = "Histogram of Monthly News Coverage
     on Drugs from 1989 - 1992",
     xlab = "Number of Stories in a Month",
     col = "light blue",
     ylim = c(0, 25))

## now we can add another histogram from when
## Reagan was president
hist(drugCoverage$drugsmedia[drugCoverage$year < 1989 & drugCoverage$year >= 1981],
     breaks = 20,
     col = "light pink",
     add = TRUE) ## add argument allows us to do this

## But we can't see under the pink...
## We can add transparency to our colors
#?rgb
myblue <- rgb(red = 0, green = 0, blue = 1, alpha = .25)
mypink <- rgb(red = 1, green = 0, blue = 0, alpha = .25)


## Now do our same histograms as above, but with new colors
## Now we can see where they overlap and where they don't
hist(drugCoverage$drugsmedia[drugCoverage$year >= 1989],
     breaks = 20,
     main = "Histogram of Monthly News Coverage
     on Drugs from 1989 - 1992",
     xlab = "Number of Stories in a Month",
     col = myblue,
     ylim = c(0, 25))
hist(drugCoverage$drugsmedia[drugCoverage$year < 1989 & drugCoverage$year >= 1981],
     breaks = 20,
     col = mypink,
     add = TRUE)


## Remember how to save plots
pdf("pres_approval.pdf")
plot(density(drugCoverage$approval))
dev.off()


## We can add more than one plot to a figure
par(mfrow = c(1,2)) ## 1 row, 2 columns
plot(density(drugCoverage$approval))
plot(density(drugCoverage$unemploy))
dev.off() ## turns off what you set in par()


## Now let's do it all in one saved file
pdf("two_plots.pdf")
par(mfrow = c(1,2))
plot(density(drugCoverage$approval), main = "Pres Approval")
plot(density(drugCoverage$unemploy), main = "Unemployment")
dev.off()



### Extra exercises 

## 1. Load crime data and read the help file.
data("USArrests")
?USArrests



## 2. Create a histogram for all 50 states of assault arrests.



## 3. Now create two histograms on the same plot, one for the number
## of assaults for states with less than the mean urban population and one
## for the number of assaults for states at or above the mean urban population




## 4. Interpret your plot.  Why is it not the best to examine
## arrests across states in this way?




#### Bonus ####

## 1. Examine how murder and rape arrests are related to percent
## urban population on one scatterplot



## 2. Interpret your plot -- do these crimes have similar trends?


