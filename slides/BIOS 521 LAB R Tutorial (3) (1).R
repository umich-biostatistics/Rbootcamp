#--------------------------------------------------------------------------------
#R Tutorial for Biostatistics 521
#--------------------------------------------------------------------------------

# This tutorial provides an introduction to the R programming software, including   
# basic commands to upload datasets and take an initial look at data.

# This tutorial is designed to help you become more familiar with some of the 
# basic commands of R.  It will start by simply copy-pasting code in the command line.
# Towards the end of the tutorial, you will write your own code by making simple changes
# to previous examples.
#--------------------------------------------------------------------------------

# The first step is to install two packages that contain functions needed
# to complete the labs. These packages only needed to be installed one time
# and can be used in future work.

install.packages("readr")
install.packages("dplyr")

# Next, load the packages into your current R session

library(readr)
library(dplyr)

# The library command need to be run every time you start a new R session.

# Now that we have loaded the necesaary packages, let's load some data into R.
# Each of the three datasets (EHS, Nutrition, Epidemiology) are in csv format 
# (comma-separated values). Use the read_csv function to read the dataset you
# will be using into the memory of your current R session. 
# NOTE: Be sure to properly set the path of the csv file so that 
# R knows where to look on your computer

#EHS dataset
DATA=read.csv("PATH_OF_FILE/EHS2015DATA.csv", na.strings="")

#Nutrition dataset
DATA=read.csv("PATH_OF_FILE/HEI_NHANES2015.csv", na.strings="")

#Epidemiology dataset
DATA=read.csv("PATH_OF_FILE/EPID2005DATA.csv", na.strings="")

#You can substitute the name "DATA" with thatever you'd like to call your dataset,
#but for the rest of the tutorial, it will be referred to as "DATA".

# The first step with any data you encounter is to view the dataset and take a
# look at what type of information is contained within.  To do that, use the 
# 'View' function.  Note that this function, unlike most other R function, is 
# capitalized.

View(DATA)

# Note that there are many 'NA' values present in the data, these indicate
# missing measurements for an observation

# Now that we have looked at our dataset, let's see what functions we can use on 
# this data.  First, let's see how many observations and variables are contained in 
# the dataset. The 'dim' function will return two numbers: the first is the number of rows
# (observations) and the second is the number of columns (variables)

dim(DATA)

# You now know how many variables there are, but not the types of variables 
# contained within the dataset.  To see what type of data you are dealing with,
# use the 'class' function.  Let's try an example using the variable 'Age'.

class(DATA$RIDAGEYR)

# Whenener you want to reference only one column of DATA, type the name of the 
# dataset, then type a dollar sign ($) before typing the name of the column you
# want to look at.

# In the previous command, you should have gotten that age was the type 'Integer'.
# This means that R is treating as a numeric variable containing only integers (whole numbers).
# Now, look at the class of the 'BMI' variable

class(DATA$BMXBMI)

# You should get that BMI is 'numeric' meaning R is treating BMI as a continuous 
# numeric variable

# Now, let's look at the 'sex' variable.

class(DATA$RIAGENDR)

# You should get that 'sex' is called a "factor" indicating that R is treating 
# sex as a categorical variable.

#-------------------------------------------------------------------------
# Now that we have taken a surface glance at the dataset, let's look deeper into
# some of the variables in the data.  One important statistic to find for 
# variables are their averages (means).  Let's start out by finding the mean 
# for 'Age'.

mean(DATA$RIDAGEYR, na.rm=TRUE)

# The argument 'na.rm=TRUE' is required to remove missing values from the calculation
# Try running mean(DATA$RIDAGEYR) to see what happens if you remove this argument.

# Next, create a histogram to see the distribution of the age variable  
hist(DATA$RIDAGEYR, main="Histogram for Age", xlab="Age", col="gray")

# The distribution for Age can also be viewed using a boxplot
boxplot(DATA$RIDAGEYR, ylab="Age")

# Histograms and boxplots are used for numeric variables such as Age and BMI.
# The dataset also contains categorical varaibles as well, for example Sex (RIAGENDR)
# First, view the levels for the sex variable:

levels(DATA$RIAGENDR)

# Create a table with counts for each level of the categorical variable using 
# the table function:

table(DATA$RIAGENDR)

# The proportions (rather than counts) can be computed using 

prop.table(table(DATA$RIAGENDR))

# A barchart is used to visualize counts for the categorical variable:
# Note that the col argument lets you change the colors of each bar

barplot(table(DATA$RIAGENDR), col=c("red", "blue"))

# The variable names that come with a dataset can often be cumbersome.
# We can rename a variable to something simpler and more intuitive using the
# rename function. The example below changes the variable name from 
# "RIDAGEYR" to "Age."

DATA = rename(DATA, Age=RIDAGEYR)

# To confirm the change, use either the View function or the head 
# function to view the first several lines of the data

head(DATA)

# We can create new variables in the dataset using the mutate function
# Imagine that we would like to indicate samples that are over age 50.
# We will create a new variable called 'Age50' that is '1' if the sample
# is 50 or over and '0' if person is under 50.

DATA <- mutate(DATA, Age50=ifelse(Age>=50,1,0))
View(DATA)

# We used the 'ifelse' function to create the new variable.  
# This function takes three arguments:
# The logical expression (here, if Age exceeds 50),
# the value if the expression is TRUE (here, 1)
# and the value if the expression is false (here 0).
# This example is a bit more advance, so don't worry if you are a bit confused.
# You can get by in the labs without it. Plus you will become a better R coder!

#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------

# Now, it's your turn to try writing R code of your own. 
# Write code to answer the following questions using the examples from above.

#1: Compute the proprotions for each level in the race cagtegory.

#2: Compute the mean for each numerical variable in your dataset.

#3: Create a new variable containing the squared value of Age.

#4: Create a histogram of the squared age variable you just created.
    # What does the distribution of this variable?

#5: Create a barchart for the Age50 categorical variable.
    # How many samples are 50 years of age or older in your dataset?







