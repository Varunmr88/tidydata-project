# CODE BOOK
## Data set code book: Tidy data - Samsung sensor data for coursera project.
Date:12-08-2022
Code book prepared by Varun M R based data provided by coursera getting and cleaning data course.
## Data Source
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Universit? degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  

## Study Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
## Contents of Raw Data Set.
The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.   

## R Code for creation of Code Book Table  

```
df1<-read.csv("tidy data.csv")
library(tidyverse)
make.codeBook <- function(set) {
  df <- data.frame(
    row.names = NULL,
    column.names = names(set),
    class = sapply(set, class),
    range = sapply(set, function(x)
      if (class(x) == "factor")
        paste(levels(x), collapse = " / ")
      else if (class(x) == "numeric" ||
               class(x) == "integer")
        paste(min(x), max(x), sep = "  /  ")
      else
        class(x)),
    mean = sapply(set, function(x)
      if (class(x) == "numeric")
        mean(x)
      else
        "Not available")
  )
  write.table(df, "codeBook.md", sep = " | ")
}
make.codeBook(df1)
```
### Code Book Table

|"Sl.No"|"column.names" | "class" | "range" | "mean"|
|-------|----------------|---------|---------|--------|
|"1" | "PersonID" | "integer" | "1  /  30" | "Not available"
|"2" | "ActivityCode" | "integer" | "1  /  6" | "Not available"
"3" | "ActivityName" | "character" | "LAYING / SITTING / STANDING / WALKING / WALKING_DOWNSTAIRS / WALKING_UPSTAIRS" | "Not available"
"4" | "tBodyAcc.mean...X" | "numeric" | "-1  /  1" | "0.274347260646063"
"5" | "tBodyAcc.mean...Y" | "numeric" | "-1  /  1" | "-0.0177434918458972"
"6" | "tBodyAcc.mean...Z" | "numeric" | "-1  /  1" | "-0.108925032737064"
"7" | "tBodyAcc.std...X" | "numeric" | "-1  /  1" | "-0.607783818968688"
"8" | "tBodyAcc.std...Y" | "numeric" | "-1  /  1" | "-0.510191378479501"
"9" | "tBodyAcc.std...Z" | "numeric" | "-1  /  1" | "-0.61306429934125"
"10" | "tGravityAcc.mean...X" | "numeric" | "-1  /  1" | "0.669226222373046"
"11" | "tGravityAcc.mean...Y" | "numeric" | "-1  /  1" | "0.00403879092060517"
"12" | "tGravityAcc.mean...Z" | "numeric" | "-1  /  1" | "0.0921508600211059"
"13" | "tGravityAcc.std...X" | "numeric" | "-1  /  1" | "-0.965207115039421"
"14" | "tGravityAcc.std...Y" | "numeric" | "-1  /  1" | "-0.95440802665318"
"15" | "tGravityAcc.std...Z" | "numeric" | "-1  /  1" | "-0.938900969424022"
"16" | "tBodyAccJerk.mean...X" | "numeric" | "-1  /  1" | "0.0789381220355816"
"17" | "tBodyAccJerk.mean...Y" | "numeric" | "-1  /  1" | "0.0079481069090025"
"18" | "tBodyAccJerk.mean...Z" | "numeric" | "-1  /  1" | "-0.00467469823628666"
"19" | "tBodyAccJerk.std...X" | "numeric" | "-1  /  1" | "-0.63978102073413"
"20" | "tBodyAccJerk.std...Y" | "numeric" | "-1  /  1" | "-0.607971599340832"
"21" | "tBodyAccJerk.std...Z" | "numeric" | "-1  /  1" | "-0.762820240449202"
"22" | "tBodyGyro.mean...X" | "numeric" | "-1  /  1" | "-0.0309824871713436"
"23" | "tBodyGyro.mean...Y" | "numeric" | "-1  /  1" | "-0.0747194855994359"
"24" | "tBodyGyro.mean...Z" | "numeric" | "-1  /  1" | "0.088357304227173"
"25" | "tBodyGyro.std...X" | "numeric" | "-1  /  1" | "-0.721192598029789"
"26" | "tBodyGyro.std...Y" | "numeric" | "-1  /  1" | "-0.682653506899942"
"27" | "tBodyGyro.std...Z" | "numeric" | "-1  /  1" | "-0.653665674372188"
"28" | "tBodyGyroJerk.mean...X" | "numeric" | "-1  /  1" | "-0.0967092754729682"
"29" | "tBodyGyroJerk.mean...Y" | "numeric" | "-1  /  1" | "-0.0423181079782632"
"30" | "tBodyGyroJerk.mean...Z" | "numeric" | "-1  /  1" | "-0.0548303497968374"
"31" | "tBodyGyroJerk.std...X" | "numeric" | "-1  /  1" | "-0.731348533131935"
"32" | "tBodyGyroJerk.std...Y" | "numeric" | "-1  /  1" | "-0.786062320321895"
"33" | "tBodyGyroJerk.std...Z" | "numeric" | "-1  /  1" | "-0.739932395222129"
"34" | "tBodyAccMag.mean.." | "numeric" | "-1  /  1" | "-0.54822165976717"
"35" | "tBodyAccMag.std.." | "numeric" | "-1  /  1" | "-0.591225327146546"
"36" | "tGravityAccMag.mean.." | "numeric" | "-1  /  1" | "-0.54822165976717"
"37" | "tGravityAccMag.std.." | "numeric" | "-1  /  1" | "-0.591225327146546"
"38" | "tBodyAccJerkMag.mean.." | "numeric" | "-1  /  1" | "-0.649417950650692"
"39" | "tBodyAccJerkMag.std.." | "numeric" | "-1  /  1" | "-0.627762945785391"
"40" | "tBodyGyroMag.mean.." | "numeric" | "-1  /  1" | "-0.60524856977632"
"41" | "tBodyGyroMag.std.." | "numeric" | "-1  /  1" | "-0.662533062898382"
"42" | "tBodyGyroJerkMag.mean.." | "numeric" | "-1  /  1" | "-0.762137610987416"
"43" | "tBodyGyroJerkMag.std.." | "numeric" | "-1  /  1" | "-0.77799317279698"
"44" | "fBodyAcc.mean...X" | "numeric" | "-1  /  1" | "-0.622761658493734"
"45" | "fBodyAcc.mean...Y" | "numeric" | "-1  /  1" | "-0.53749328145871"
"46" | "fBodyAcc.mean...Z" | "numeric" | "-1  /  1" | "-0.665033506271952"
"47" | "fBodyAcc.std...X" | "numeric" | "-1  /  1" | "-0.603356276555826"
"48" | "fBodyAcc.std...Y" | "numeric" | "-1  /  1" | "-0.528420009576204"
"49" | "fBodyAcc.std...Z" | "numeric" | "-1  /  1" | "-0.617874813333395"
"50" | "fBodyAcc.meanFreq...X" | "numeric" | "-1  /  1" | "-0.2214691368263"
"51" | "fBodyAcc.meanFreq...Y" | "numeric" | "-1  /  1" | "0.015400588735675"
"52" | "fBodyAcc.meanFreq...Z" | "numeric" | "-1  /  1" | "0.0473098698476722"
"53" | "fBodyAccJerk.mean...X" | "numeric" | "-1  /  1" | "-0.656713524546605"
"54" | "fBodyAccJerk.mean...Y" | "numeric" | "-1  /  1" | "-0.628961179980356"
"55" | "fBodyAccJerk.mean...Z" | "numeric" | "-1  /  1" | "-0.743608246170053"
"56" | "fBodyAccJerk.std...X" | "numeric" | "-1  /  1" | "-0.654979816705833"
"57" | "fBodyAccJerk.std...Y" | "numeric" | "-1  /  1" | "-0.612243590244114"
"58" | "fBodyAccJerk.std...Z" | "numeric" | "-1  /  1" | "-0.780928428167213"
"59" | "fBodyAccJerk.meanFreq...X" | "numeric" | "-1  /  1" | "-0.0477062917542325"
"60" | "fBodyAccJerk.meanFreq...Y" | "numeric" | "-1  /  1" | "-0.213392904926883"
"61" | "fBodyAccJerk.meanFreq...Z" | "numeric" | "-1  /  1" | "-0.123828014584147"
"62" | "fBodyGyro.mean...X" | "numeric" | "-1  /  1" | "-0.672094306818974"
"63" | "fBodyGyro.mean...Y" | "numeric" | "-1  /  1" | "-0.70621663959074"
"64" | "fBodyGyro.mean...Z" | "numeric" | "-1  /  1" | "-0.644192752866115"
"65" | "fBodyGyro.std...X" | "numeric" | "-1  /  1" | "-0.738594816501343"
"66" | "fBodyGyro.std...Y" | "numeric" | "-1  /  1" | "-0.674226934551517"
"67" | "fBodyGyro.std...Z" | "numeric" | "-1  /  1" | "-0.690446312501126"
"68" | "fBodyGyro.meanFreq...X" | "numeric" | "-1  /  1" | "-0.101042702224631"
"69" | "fBodyGyro.meanFreq...Y" | "numeric" | "-1  /  1" | "-0.174277577553958"
"70" | "fBodyGyro.meanFreq...Z" | "numeric" | "-1  /  1" | "-0.0513928953203266"
"71" | "fBodyAccMag.mean.." | "numeric" | "-1  /  1" | "-0.585962696268539"
"72" | "fBodyAccMag.std.." | "numeric" | "-1  /  1" | "-0.659531216655476"
"73" | "fBodyAccMag.meanFreq.." | "numeric" | "-1  /  1" | "0.0768760112631957"
"74" | "fBodyBodyAccJerkMag.mean.." | "numeric" | "-1  /  1" | "-0.620789916331592"
"75" | "fBodyBodyAccJerkMag.std.." | "numeric" | "-1  /  1" | "-0.640076803144351"
"76" | "fBodyBodyAccJerkMag.meanFreq.." | "numeric" | "-1  /  1" | "0.173219742700723"
"77" | "fBodyBodyGyroMag.mean.." | "numeric" | "-1  /  1" | "-0.697411069729937"
"78" | "fBodyBodyGyroMag.std.." | "numeric" | "-1  /  1" | "-0.699976372277643"
"79" | "fBodyBodyGyroMag.meanFreq.." | "numeric" | "-1  /  1" | "-0.0415636227771787"
"80" | "fBodyBodyGyroJerkMag.mean.." | "numeric" | "-1  /  1" | "-0.779767633083527"
"81" | "fBodyBodyGyroJerkMag.std.." | "numeric" | "-1  /  1" | "-0.792190209274884"
"82" | "fBodyBodyGyroJerkMag.meanFreq.." | "numeric" | "-1  /  1" | "0.126707820497791"
"83" | "angle.tBodyAccMean.gravity." | "numeric" | "-1  /  1" | "0.00770513730366637"
"84" | "angle.tBodyAccJerkMean..gravityMean." | "numeric" | "-1  /  1" | "0.00264770963963395"
"85" | "angle.tBodyGyroMean.gravityMean." | "numeric" | "-1  /  1" | "0.0176831301958708"
"86" | "angle.tBodyGyroJerkMean.gravityMean." | "numeric" | "-1  /  1" | "-0.00921912899702262"
"87" | "angle.X.gravityMean." | "numeric" | "-1  /  1" | "-0.496522166185746"
"88" | "angle.Y.gravityMean." | "numeric" | "-1  /  1" | "0.0632551738495058"
"89" | "angle.Z.gravityMean." | "numeric" | "-1  /  1" | "-0.0542842821505305"
