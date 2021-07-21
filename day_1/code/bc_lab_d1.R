##############################
# Lab 1: How R and GitHub work
##############################

# Goal:
# 1. Calculate simple arithmetic
# 2. Assign a value to an object
# 3. Types of Data

##############
# 1 What is R?
##############

# Data analysis software
# A programming language
# an open-source software
# a community of over 2 million users


# 1.1: Install R
# http://cran.r-project.org/bin/
# I recommend using R studio because it provides a more user-friendly environment
# Download from here: http://www.rstudio.com/


# 1.2: Basics
# It is possible to do some things using the menus, but we will mostly use command line entry.
# Don't be scared!

# Layout (Four windows):
# Editor: Top left window. This is where you type R code to solve the exercises in this course.
# Console: Bottom left window. The output of your code is displayed.
# Workspace: Top right window. You can see a history of your commands and see all active objects.
# Top bottom window. You can see plots, list of packages, additional information, and so on.
# Show some of the graphics that R can produce
demo("graphics")

# Running R code
# To send a line of code to your console, use either 
# (PC users:) "control + enter"
# (Mac users:) "command + return"
# You can also simply copy and paste the line of code. 
# You can also use "Run" button to execute a single line of code and "Source" button to execute all the codes.
print("Hello world")

# Commenting
# Anything that comes after a "#" sign.
# Comments describe what the code is doing.
# I try very hard to use descriptive comments

# Features
# Everything in R is object oriented. Data, functions, inputs and outputs will all be data objects.
# R is case sensitive. For that matter, it is also spelling sensitive.
# R is an open-source platform that comes with many basic functions.
# Additional functionality are available in user-contributed packages that can be downloaded, loaded, and used.
# A community of over 2 million users; write handouts for class, write websites, etc.


# 1.3: R as a calculator
# Basic arithmetic
# addition
2 + 3
# multiplication
2*3  
# division
5/3 
# subtraction
4 - 5
# exponents
3^3 
# more exponents
625^(1/4)
# modular arithmetic (11 mod 2)
# "wrap around": 11am + 2 hours = 1pm
11%% 2 
# The integer part of a fraction
# how many 7s go into 31?
31 %/% 7
# natural log
log(10) 
# R follows order of operation
3+4/2 
(3+4)/2 
2*(3-4)+2
2*(3-4)+2*(4 + 3)^(1/3)

#########
# Task 1:
#########

# Calculate 67 + 6


# R comes with a number of constants pre-stored that you can use
6.25 # numbers
pi # And a few others
NA # Missing value
NULL # Nothing.
0/0 # NaN means "Not a number"
1/0 # Inf means infinity


## Note: Use the up and down arrows 
# in the "Console" to access previously typed commands


# 1.4: Objects and named storage
# The "<-" and "=" symbols are used to assign a variable to a value.
# My personal preference is "<-".
# Create a and b that take on the values of 7 and 8.
a <- 7
b = 8 
# Print the values.
print(a)
print(b)
# or simply
a
b

# we can perform all of the mathematical functions on a now as if it is any other number
a + 3
c <- 30
a + b + c

# Object names cannot start with numbers!!
06election <-50000 # no

# You can overide previous code by assigning altenative values.
y <- 3
y
x <- (y-8) + 7
x

# change the assignment
x <- 4 
x

# Vectors: a sequence of data elements of the same basic type.
# Command c() returns a vector of numbers.
c(1,4,9)

# multiplying a vector by a constant multiplies each of the numbers in the vector by that constant
c(1, 4, 9)*4

# likewise for other arithmetic functions
c(1, 4, 9) + 4
c(1, 4, 9) - 4
c(1, 4, 9) / 4

# store a vector

x <- c(1,4,9)

#########
# Task 2: 
#########

# Assign the value 100 to x

# more example: turnout in Alaska
total.votes.ak <-  238307
voting.age.population.ak <- 496387
turnout.ak <-total.votes.ak/voting.age.population.ak
turnout.ak

#########
# Task 3: 
#########

# 1) Assign some nuermic value to the variables 'political' and 'science' and 
# 2) Add these two variables together


# Named objects are stored in the "global environment", 
# which means that they can be accessed at any time by any function you might run.
# They are "global" variables (which makes them different from "local" variables).

objects() # List the objects currently on your global
# equivalent to
ls()

# you can also remove objects
ASDS <- 100
ls()
rm(ASDS)
# equivalent to
remove(ASDS)

# more example:
ls()
LabA <- LabB <- LabC <- 100
ls()
rm(list=c("LabA", "LabB"))
objects()

# combine them to remove everything
rm(list=ls())

# Some things are present in the working environment, but not shown
.x<-"Hide me"
print(.x)
ls()

# Note: anything that starts with a "." will be there, but are hidden

# Best way to remove everything: start a new R session by quiting Rstudio

# Or, this function, which removes all packages, datasets,
# functions, or utilities floating around in your session:
# remove objects
rm(list=ls())
# detach all libraries
detachAllPackages <- function() {
  basic.packages <- c("package:stats","package:graphics","package:grDevices",
                      "package:utils","package:datasets","package:methods","package:base")
  package.list <- search()[ifelse(unlist(gregexpr("package:",search()))==1,TRUE,FALSE)]
  package.list <- setdiff(package.list,basic.packages)
  if (length(package.list)>0)  for (package in package.list) detach(package, character.only=TRUE)
}
detachAllPackages()


#########
# Task 4: 
#########

# 1) Create three objects 
# 2) Remove those objects


# 1.5: Types of Data
# three data types: numeric, character, and logical	

# numeric are numbers
numeric_vector = c(1,2,3,4,5)
numeric_vector

# a vector of characters
# Note: you have to use quotation marks to tell R that something is a character
character_vector <- c("No", "NO", "YES", "YES")
character_vector

# logical vectors take on values of TRUE or FALSE (must be all caps)
logical_vector <- c(TRUE, TRUE, FALSE, TRUE, FALSE)
logical_vector
logic <- TRUE
logic


# 1.6: Saving R script

# Save your code as a script using a ".R" file extension to a specific folder.
# The file that you are reading now is the code file, usually saved with a .R extension.
# I will need your .R files for problem sets so that I can replicate your work.


##########################
# Part 2: 
# Word processing in Latex
##########################

####################################
# Part 3: 
# Doing Problems Sets in R and Latex
####################################

# What is GitHub?
# https://programminghistorian.org/en/lessons/getting-started-with-github-desktop

# The first thing that you need are the .R and .tex files
# https://github.com/jeffreyziegler/QTM200Spring2021/tree/main/problem_sets

# Once you have downloaded both files into the same 
# working directory, you should create duplicates with new names
# like "PS1_my_answers.R"

# Now, you can open up "PS1_my_answers.R" and "PS_my_answers.tex"
# and begin to edit with your answers in 
# Rstudio and Texstudio

