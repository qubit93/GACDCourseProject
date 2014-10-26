GACDCourseProject
=================

This is the course project for the Getting and Cleaning Data Course

The R script run_analysis.R cleans the Samsung smartphone dataset. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##Instructions for use:

Step 1: Create a working directory for this project say "my_project_folder".

Step 2: Download and extract the zip file mentioned above in this folder.

Step 3: Download the run_analysis.R file in my_project_folder.

The heirarchy at this point should be :
* my_project_folder/
 * UCI HAR Dataset/
 * run_analysis.R

The run_analysis.R script has a function named analyze which has the parameter path
* @path - The path of the current working directory i.e. "/home/.../my_project_folder/"

Step 4: Open R and set the current working directory using `setwd`

Step 5: Source the R script using `source("run_analysis.R")`

Step 6: Type `tData <- analyze("/home/.../my_project_folder/")`

You will get the resulting tidy data as "tData"


##Internal working of run_analysis.R

###Merge step
Once you have called `analyze(path)` in the manner shown above;

The script will pick up the training files and the test files in the .txt format into data frames using the `read.table` method as shown in the code.

First, it merges the training and test files corresponding to features

Then, it merges the training and test files corresponding to Subject

Then, it merges the training and test files corresponding to Activity(i.e. y_train and y_test)

Then, it merges the three data frames got as a result of the above 3 steps into one data frame called "data".

###Giving variable names to all columns

This step uses the "features.txt" file to make a mapping between feature number and variable name.

The column names extracted from the map and the new column names "Subject" and "Activity" are assigned to "data"

###Extracting only the measurements on the mean and standard deviation for each measurement
This step involves searching the column names assigned before, for mean() and std(), with the exceptions of Subject and Activity and selecting only these in the resulting frame.

###Using descriptive activity names to name the activities in the data set
As in the case of feature variable extraction, a map(a simple data frame in this case) is created between activity number and label from the file "activity_labels.txt"

Then, the "Activity" column of the "data" data frame is traversed and each Activity code is replaced by its corresponding label(not directly but by making a character vector "activityLabel" and replacing the entire column afterwards)

###creating an independent tidy data set with the average of each variable for each activity and each subject.
This step uses the `melt` function of the reshape2 package and later on `dcast` to find the averages using the code shown in the script.

The resulting tidy data set is returned from the `analyze` function.


