#Code Book
======================================

##Description
Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

##Source Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )

The source data for this project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

##Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Attribute Information
For each record in the dataset it is provided:

  *Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
  *Triaxial Angular velocity from the gyroscope.
  *A 561-feature vector with time and frequency domain variables.
  *Its activity label.
  *An identifier of the subject who carried out the experiment.
  
##Decription of variable replaced in the tidy data
The Activity column(sourced in "train/y_train.txt" and "test/y_train.txt") after merging was replaced by the entries(labels) in "activity_labels.txt"

##Variables Names introduced
*Subject  - Variable name given to the column containing the merged data of "subject_test.txt" and "subject_train.txt"
 *Data Type: int
 *Domain   : 1-30
*Activity - Variable name given to the column containing the merged data of "y_train.txt" and "y_test.txt"
 *Data Type: chr
 *Domain   : 
   *WALKING
   *WALKING_UPSTAIRS
   *WALKING_DOWNSTAIRS
   *SITTING
   *STANDING
   *LAYING
*Others   - All the other variable names are taken from the "features.txt" file
 *Full Description in "features_info.txt" in the source dataset zip file
**Note**: Not all the variable names in features.txt were present in the end. Only variables containing mean and standard deviation measures were preserved.
**Note**: The variables containg meanFreq measures and angle variables were not taken. Detailed reasons given [here](https://class.coursera.org/getdata-008/forum/thread?thread_id=239#post-1015).
  
  
  There are 66 such variables:
  
  1. tBodyAcc-mean()-X
  2. tBodyAcc-mean()-Y
  3.tBodyAcc-mean()-Z
  4.tBodyAcc-std()-X
  5.tBodyAcc-std()-Y
  6.tBodyAcc-std()-Z
  7.tGravityAcc-mean()-X
  8.tGravityAcc-mean()-Y
  9.tGravityAcc-mean()-Z
  10.tGravityAcc-std()-X
  11.tGravityAcc-std()-Y
  12.tGravityAcc-std()-Z
  13.tBodyAccJerk-mean()-X
  14.tBodyAccJerk-mean()-Y
  15.tBodyAccJerk-mean()-Z
  16.tBodyAccJerk-std()-X
  17.tBodyAccJerk-std()-Y
  18.tBodyAccJerk-std()-Z
  19.tBodyGyro-mean()-X
  20.tBodyGyro-mean()-Y
  21.tBodyGyro-mean()-Z
  22.tBodyGyro-std()-X
  23.tBodyGyro-std()-Y
  24.tBodyGyro-std()-Z
  25.tBodyGyroJerk-mean()-X
  26.tBodyGyroJerk-mean()-Y
  27.tBodyGyroJerk-mean()-Z
  28.tBodyGyroJerk-std()-X
  29.tBodyGyroJerk-std()-Y
  30.tBodyGyroJerk-std()-Z
  31.tBodyAccMag-mean()
  32.tBodyAccMag-std()
  33.tGravityAccMag-mean()
  34.tGravityAccMag-std()
  35.tBodyAccJerkMag-mean()
  36.tBodyAccJerkMag-std()
  37.tBodyGyroMag-mean()
  38.tBodyGyroMag-std()
  39.tBodyGyroJerkMag-mean()
  40.tBodyGyroJerkMag-std()
  41.fBodyAcc-mean()-X
  42.fBodyAcc-mean()-Y
  43.fBodyAcc-mean()-Z
  44.fBodyAcc-std()-X
  45.fBodyAcc-std()-Y
  46.fBodyAcc-std()-Z
  47.fBodyAccJerk-mean()-X
  48.fBodyAccJerk-mean()-Y
  49.fBodyAccJerk-mean()-Z
  50.fBodyAccJerk-std()-X
  51.fBodyAccJerk-std()-Y
  52.fBodyAccJerk-std()-Z
  53.fBodyGyro-mean()-X
  54.fBodyGyro-mean()-Y
  55.fBodyGyro-mean()-Z
  56.fBodyGyro-std()-X
  57.fBodyGyro-std()-Y
  58.fBodyGyro-std()-Z
  59.fBodyAccMag-mean()
  60.fBodyAccMag-std()
  61.fBodyBodyAccJerkMag-mean()
  62.fBodyBodyAccJerkMag-std()
  63.fBodyBodyGyroMag-mean()
  64.fBodyBodyGyroMag-std()
  65.fBodyBodyGyroJerkMag-mean()
  66.fBodyBodyGyroJerkMag-std()

##Internal Working of `analyze` function in run_analysis.R
A detailed version has been given in ReadMe.md


