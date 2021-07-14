#############################################
## Lab 4: Data Types & Sampling Distributions 
#############################################


#### Goals
#### a) Reviewing different data types in R
#### b) Working with pnorm and qnorm
#### c) Practical example of a sampling distribution

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

## Subsetting data

## == means "equal to"
## >, <, >=, <=

movies <- read.csv("movies.csv")

# Subset by movie genre
dramas <- movies[movies$genre=="Drama",]

table(dramas$genre)

# Subset by runtime
long.movies <- movies[movies$runtime >= 120,]

plot(density(movies$runtime, na.rm=T), 
     lty=2, 
     main="Distrubtion of Runtime",
     xlab="Rutime (minute)",
     col="gray50", 
     ylim=c(0,0.05))

lines(density(long.movies$runtime, na.rm=T))

legend("topright", 
       legend=c("All Movies", "Long Movies"),
       lty=c(2,1),
       col=c("gray50", "black"),
       bty="n",
       cex=0.8)


## Combine multiple conditions
## & means "and"
## | means "or"

# Subset by genre "and" release year
old_comedies <- movies[movies$genre=="Comedy" & movies$thtr_rel_year < 1980,]

# Get Drama "or" Walt Disney Pictures
drama_and_disney <- movies[movies$genre=="Drama" | movies$studio=="Walt Disney Pictures",]

table(drama_and_disney$genre)


## 1. Read in the Trump Job Approval poll data.
##    Variables are as follows:
##    - Approve = Proportion of the respondents who approve Trump
##    - survey_house = Survey company
##    - end_date = Date the survey ended
##    - sample_subpopulation = Sample type
##    - observations = Number of observations
##    - mode = Survey method



## 2. Plot a histogram of the Trump job approval rates. 

##################### Extra #####################

## We would like to know the long-term trends in Trum approval from
## Gallup, SurveyMonkey, and YouGov/Economist.
## Using "Approve" and "end_date", create a line plot that summarizes overtime 
## changes in Trump approval rates by survey company (draw three separate lines 
## for the three companies). Which one is most supportive of Trump?

# First, you have to run the following line (change the name of the data):
polls$end_date <- as.Date(polls$end_date, "%m/%d/%Y")


