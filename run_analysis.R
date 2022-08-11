# Loading necessary packages.
library(tidyverse)
library(dplyr)
library(readr)

#Importing the text files into resective data frames.

features <- read.csv("features.txt", sep = "", header = FALSE)
activities <- read.csv("activity_labels.txt", sep = "", header = FALSE)
xtest <- read.csv("./test/X_test.txt", sep = "", header = FALSE)
xtrain <- read.csv("./train/X_train.txt", sep = "", header = FALSE)
ytest <- read.csv("./test/y_test.txt", sep = "", header = FALSE)
ytrain <- read.csv("./train/y_train.txt", sep = "", header = FALSE)
subtest <- read.csv("./test/subject_test.txt", sep = "", header = FALSE)
subtrain <- read.csv("./train/subject_train.txt", sep = "", header = FALSE)

# checking the dimensions of dataframes
dim(features)
dim(activities)
dim(xtest)
dim(xtrain)
dim(ytest)
dim(ytrain)
dim(subtest)
dim(subtrain)

# Merging the dataframes of test and training
mergedx <- rbind(xtest,xtrain)
mergedy  <- rbind(ytest,ytrain)
mergedsub <- rbind(subtest,subtrain)

#Renaming column names of merged test and train data using feature list.
names(mergedx) <- features[ ,2]

#selection of column names containing standard deviation or mean.
mergedx <- mergedx[ grepl("std|mean", names(mergedx), ignore.case = TRUE) ] 
dim(mergedx)

# Combining columns of activity code and its corresponding names.
mergedy<- full_join(mergedy,activities,by="V1")

#Merging of subject details,acitvity details and test data using column bind.
mergedx <- cbind(mergedsub, mergedy, mergedx)

#Changing important columns names for better comprehension.
names(mergedx)[1:3] <- c("PersonID", "ActivityCode","ActivityName")

#Tidying set according to personID and Activity Name via mean calculation.
group_by(mergedx, PersonID, ActivityName) %>%
  summarise_each(funs(mean))
