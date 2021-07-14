#################################
# Opening Data and Plotting
#################################

## Goal:
# 1. Open data
# 2. Explore data
# 3. Plot data

## 1.1: Knowing data types
# What type of file do you have?
#  .csv = comma separated values
#  .txt = text file
#  .dta = STATA file
#  .spss = SPSS file

# Where is the file?
#  Saved in your computer?
#  Where in your computer?


## 1.2: Importing data
# go to: https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/ARKOTI
# download PESenergy.csv
energyData <- read.csv("PESenergy.csv")

## 2.1: Exploring data
dim(energyData)   # dimension
nrow(energyData)  # number of rows (observations)
ncol(energyData)  # number of columns (variables)

head(energyData)   # first five rows
tail(energyData)   # last five rows

colnames(energyData)  # variable names

energyData$Energy     # access variables
energyData["Energy"]
energyData[,3]

energyData[1,3]   # acces element in row 1 and column 3

energy.coverage <- energyData$Energy  # you can create a new object (vector)
energy.coverage*100

summary(energyData)       # descriptive statistics

summary(energyData$Energy)

mean(energyData$Energy)      # mean(c(1,5,15))
median(energyData$Energy)    # median(c(1,5,15))
min(energyData$Energy)
max(energyData$Energy)
quantile(energyData$Energy, 0.5)

table(energyData$Energy)


## 2.2: subsetting data
subset1 <- energyData[1:20,]                               # by row
subset2 <- energyData[,5:7]                                # by column
subset3 <- energyData[,c("Date", "Energy", "Approval")]    # by column name

# 2.3: create a new column
colnames(energyData)
energyData$New <- NA  # assign NA (=missing)
colnames(energyData)

# calculation based on two variables (columns)
energyData$New2 <- energyData$Energy/energyData$Unemploy

## 3.1: Plotting data
hist(energyData$Energy, xlab="Television Stories", main="")  # histogram

boxplot(energyData$Energy, ylab="Television Stories", main="")  # boxplot

plot(density(energyData$Energy))  # density plot
rug(energyData$Energy)

# some scatterplots
plot(energyData$Approval, energyData$Energy,
     ylab="Television Stories", xlab="Presidential Approval")

plot(energyData$Date, energyData$Energy,
     ylab="Television Stories", xlab="Date")

plot(energyData$Date, energyData$Approval,
     ylab="Presidential Approval", xlab="Date")

# use help(plot) or ?plot
# helpful online guide: http://www.statmethods.net/advgraphs/parameters.html

# most basic options
plot(x,        # x variable
     y,        # y variable
     xlab=,    # x label name
     ylab=,    # y label name
     main=,    # main title
     pch=,     # type of point
     cex=,     # size of point
     col=)     # color


## 3.2: Saving plots
pdf("stories.pdf", width=7, height=7)
plot(energyData$Approval, energyData$Energy,
     ylab="Television Stories", xlab="Presidential Approval")
dev.off()

### Exercises

# 1. Open movies.csv provided by Prof. Cetinkaya-Rundel at Duke. 
#    It is a dataset on randomly sampled movies released between 1972 to 2014 in 
#    the Unites States. The description of the variables is available on her webpage
#    (http://www2.stat.duke.edu/~mc301/data/movies.html).


# 2. How many rows and columns are there?


# 3. What is the name of the fifth column? Store it as a new object and find how many
#    of them are PG-13.


# 4. Subset the data based on the following four columns:
#      (1) runtime
#      (2) imdb_rating
#      (3) imdb_num_votes
#      (4) audience_score


# 5. What are the means of runtime and imdb_rating?
#    What are the medians of imdb_num_votes and audience_score?


# 6. Create a plot that nicely summarizes the distribution of the IMDB rating 
#    for all the movies (using imdb_rating).


# 7. Pick two numeric variables and plot them against each other. Explain what you find. 
#    Be creative and try many plot options (pch, cex, col, etc.).


# 8. Save the plots you made in Question 7 and 8 in .pdf.


# EXTRA. Create a subset of the movies that only include Drama.
#        Create a subset of the movies that were released before 1990.