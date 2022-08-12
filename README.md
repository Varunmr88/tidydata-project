# tidydata-project
## Course Project for Getting and Cleaning Data Coursera.
### Summary
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
   #### 1. a tidy data set as described below, 
   #### 2. a link to a Github repository with your script for performing the analysis, and 
   #### 3. a code book that describes the variables, 
      
the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

### You should create one R script called run_analysis.R that does the following. 

      1. Merges the training and the test sets to create one data set.

      2. Extracts only the measurements on the mean and standard deviation for each measurement. 

      3. Uses descriptive activity names to name the activities in the data set

      4. Appropriately labels the data set with descriptive variable names. 

      5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      
 # Details of the code.
 
 ### Loading necessary packages.
```
library(tidyverse)  
library(dplyr)  
library(readr)
```
### Importing the text files into resective data frames.

```
features <- read.csv("features.txt", sep = "", header = FALSE)
activities <- read.csv("activity_labels.txt", sep = "", header = FALSE)
xtest <- read.csv("./test/X_test.txt", sep = "", header = FALSE)
xtrain <- read.csv("./train/X_train.txt", sep = "", header = FALSE)
ytest <- read.csv("./test/y_test.txt", sep = "", header = FALSE)
ytrain <- read.csv("./train/y_train.txt", sep = "", header = FALSE)
subtest <- read.csv("./test/subject_test.txt", sep = "", header = FALSE)
subtrain <- read.csv("./train/subject_train.txt", sep = "", header = FALSE)
```
### checking the dimensions of dataframes
```
dim(features)
dim(activities)
dim(xtest)
dim(xtrain)
dim(ytest)
dim(ytrain)
dim(subtest)
dim(subtrain)
```

### Merging the dataframes of test and training
```
mergedx <- rbind(xtest,xtrain)
mergedy  <- rbind(ytest,ytrain)
mergedsub <- rbind(subtest,subtrain)
```
### enaming column names of merged test and train data using feature list.
```
names(mergedx) <- features[ ,2]
```
### selection of column names containing standard deviation or mean.
```
mergedx <- mergedx[ grepl("std|mean", names(mergedx), ignore.case = TRUE) ] 
dim(mergedx)
```
### Combining columns of activity code and its corresponding names.
```
mergedy<- full_join(mergedy,activities,by="V1")
```
### Merging of subject details,activity details and test data using column bind.
```
mergedx <- cbind(mergedsub, mergedy, mergedx)
```
### Changing important columns names for better comprehension.
```
names(mergedx)[1:3] <- c("PersonID", "ActivityCode","ActivityName")
```

### Tidying set according to personID and Activity Name via mean calculation.
```
group_by(mergedx, PersonID, ActivityName) %>%
  summarise_each(funs(mean))
write_csv(mergedx, "./tidy data.csv") 
```
      
