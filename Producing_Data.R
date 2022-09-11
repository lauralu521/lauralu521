# Note that all lines that start with a # is a comment

# ## Introduction to R
# # This tutorial introduces you to R. Nearly all code and topics are from [R in action by Manning Publications](https://www.manning.com/books/r-in-action#toc), which you can access at the above link.
#
# ### R and RStudio
# #For the most part, when we work with R on our computer, we use an interface like [RStudio](https://www.rstudio.com/products/rstudio/download/). Your instructor will go over the RStudio interface in class, and explain how to create a R or RMarkdown document.
#
# #### RStudio Cloud
# #Those of you using Chromebooks will need to use [RStudio Cloud](http://rstudio.cloud) to run R. Here is a short [tutorial](https://video.kent.edu/media/RStudio+Cloud+Access/1_3x067gfq) in accessing RStudio Cloud, creating a project, and uploading the required files.
#
# /*
# ## LAB - Producing Data
# #In this lab, you will
#
# 1. Understand and set your working directory
# 2. Import a csv file
# 3. Calculate basic descriptive measures for the variables in your file

# Working Directory -------------------------------------------------------

# A working directory is the directory where R looks for files by default. The command for that is *getwd()*.
#
getwd()

# What was your working directory?
#
# Now, let us create a new directory for all your lab assignments. To do that,
#
# 1. Use the Files Tab in the bottom right pane to navigate to where you want to create a new folder
# 2. Click on the icon which looks like a brown folder with a white on green background cross
# 3. Create a new folder, if you haven't done it already. Call it something like *BA1*. Navigate to that folder.
# 4. Now, set it to the working directory by clicking on the Gear Icon and down arrow.
# 5. Choose *Set as Working Directory*
#
# Let's confirm that.
getwd()

# Now that you have a folder, move this file, and the *Tech-Sales-Reps.csv* file to this folder.
# When we read or write files to the system, the program will by default look for the file in the current working directory. You can find out what the current working directory is by using the *getwd()* function. Similarly, you can set the current working directory using the *setwd()* function.
#
# To get help, type *help("getwd")* or *help("setwd")*

# You can also use setwd() to set the working directory. For example,

# setwd("~/.") # sets the WD to your default directory
# getwd() # This gives the new WD


# Reading Data (csv) ------------------------------------------------------


# One of the most common ways of importing data is through a comma delimited file. To do that, we use the *read_csv()* function like in the following example. Note that, by default, the file is assumed to reside in your working directory. If not, you will need to specify the full file path.
# Your file should be in the working directory. If not, either set the working directory to where the file is, or provide the full path to that directory.

# Let us now read a CSV file that is available on the web, and write it to a dataframe (object) called testFile.
# The file gives hurricane and tropical storm counts for 2005-2015. Each record includes 13 values: month, historical average, counts for 2005 through 2015. Eight records are stored, for months "May" through "Dec". There is also an initial header line.

testFile <- read.csv("https://people.sc.fsu.edu/~jburkardt/data/csv/hurricanes.csv")
head(testFile)

# Note that if you were reading a file on your computer, you would replace the web address of the file with your file path, as in the example below.
# We have provided several scenarios below. Use the one that is most appropriate for you


# Reading Data - Local Computer, and working directory --------------------


# If your file is in your working directory, execute the following code. If not, replace the directory path with the path to the file.
Tech_Sales_Reps <- read_csv("./Tech-Sales-Reps.csv") # make sure the file is in your WD
View(Tech_Sales_Reps) # view the file


# Reading Data - Local Computer, and RStudio Interface --------------------

# 1. Navigate using the Files Tab (bottom right pane) to where your data file is. Hopefully it is in your working directory
# 2. Click on the *Tech-Sales-Reps.csv* file.
# 3. Click on *Import Dataset*. It might prompt you to install a new package called *readr*. Say YES.
# 4. Pay attention to the dataset name (lower left corner). It will be something like *Tech-Sales-Reps*. This will be how we will use the data. Also, note the R code that is being used to read the file.
# 5. Click import.


# RStudio Cloud -----------------------------------------------------------

# If you are using RStudio online, then proceed as follows:
#
# 1. Log into [RStudio Cloud](https://rstudio.cloud/). Note that you can click on *Log in with Google*, and then choose your Kent account to log in
# 2. Create a new Workspace. Call is something like *Class*.
# 3. Next, create a new project in this workspace. This is where you will put all your files. Call it something like *BA1*
# 4. Upload both the *Producing_Data.RMD* file (if you haven't done it yet), and the Tech-Sales-Reps.csv files to your project.
# 5. Open the *Producing_Data.R* file.
# 6. When RStudio prompts with missing packages, choose *Install*. Wait until the installation is finished.
# 7. Run code
#

# Use the following code, or the RStudio interface to read in your file
# (make sure to uncomment the code before running)

#setwd("/cloud/project")
#Tech_Sales_Reps <- read.csv(file="Tech-Sales-Reps.csv")
#head(Tech_Sales_Reps)


# Working with R ----------------------------------------------------------

# R is a case-sensitive interpreted language. As we saw in class, we can have variables of different type. Similarly, R allows us to represent different data types, which we will see shortly. First, some definitions:
#
# * An _object_ in R is anything that can be assigned a value
# * Statements in R consist of functions and assignments. There are many in-built functions in R. R uses the symbol <- for assignments, rather than the more common = sign. For example, *x <- 5* assigns the value 5 to the variable x.
# * Anything after a **#** is treated as comments, and not executable code
#
# Why don't you try for yourself.
#
# Write the R code required to add two plus three and assign that to a variable called Y. Note, part of the required code is already given below. To print the value of the variable, just include the variable name in a separate line as shown below. Once you have written the code, click on the **Run Code** button.

y <- 2 + 1 # for example y <- 2 + 3
y # this will print out the value of y

# ### Creating a Dataset
# What if you wanted to create a variable that contains more than one value? For example, let's assume that you are going downtown, and wanted to know how much money each of you has in the group.
#
# The following code creates a variable called moneytoParty, and assigns the amount of money that five of you have.
moneytoParty = c(23, 45, 56, 10, 2)
moneytoParty

# Notice we use the function *c()* to combine the values into a single variable. Now that we have a new variable with values, we can capture some basic descriptive statistics
mean(moneytoParty) # output the average amount of money
sd(moneytoParty) # output the standard deviation of the amount of money

# Why don't you try it. Write a code to create two new variables, *weight* and *dist* that capture the weight in pounds, and the travel time in minutes to school for the 5 students sitting closest to you. Part of the code is shown to you.
#
# * What is the average weight of your group?
# * What is the average travel time for students in your group?
#
# Remember to press the **Run Code** button to run your code.

weight <- c(134,145,132) # replace and add values as appropriate


# ### Getting Help in R
# R provides extensive help facilities and learning to navigate them will help you significantly. The simplest way to get help is to to type *help.start()* and this will open up a browser window with access to the manuals. Or, if you want help on a specific function, say *mean*, you can type *help("mean")*.


# Descriptive Statistics using R ------------------------------------------

# This section assumes that you have read the Tech_Sales_Reps file as illustrated above.

# Calculate a summary measure of all variables in this file
summary(Tech_Sales_Reps)


# Descriptive Measures - Quantitative Variable ----------------------------


# Calculate the mean and standard deviation of a quantitative variable like Salary
mean(Tech_Sales_Reps$Salary)
sd(Tech_Sales_Reps$Salary)

# Plot a distribution of a quantitative variable
hist(Tech_Sales_Reps$Salary)


# Descriptive Measures - Qualitative Variable -----------------------------


# Now get statistics for a qualitative variable
PTable <- table(Tech_Sales_Reps$Personality)
PTable

# Plot the table
barplot(PTable)
