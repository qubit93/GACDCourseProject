##assuming that the zip file is extracted within a folder containing run_analysis.R directly
##will be clear from the setwd commands below

analyze <- function(path) ##path is a string containing the path of the folder containing run_analysis.R
{
  ##loading all files into memory: small dataset, so should fit in memory
  trainPath <- paste(path,"/UCI HAR Dataset/train",sep="")
  setwd(trainPath)
  featureTrainData <- read.table("X_train.txt",header = FALSE)
  subjectTrainData <- read.table("subject_train.txt",header = FALSE)
  activityTrainData <- read.table("y_train.txt",header = FALSE)
  
  testPath <- paste(path,"/UCI HAR Dataset/test",sep="")
  setwd(testPath)
  featureTestData <- read.table("X_test.txt",header = FALSE)
  subjectTestData <- read.table("subject_test.txt", header = FALSE)
  activityTestData <- read.table("y_test.txt",header = FALSE)
  
  ##merging the feature train and test set
  #merging the two row wise analogous to rbind 
  featureData <- merge(featureTrainData, featureTestData, all=T, sort=F)
  
  ##similarly merging the subject train and test set
  subjectData <- merge(subjectTrainData, subjectTestData, all=T, sort=F)
  
  ##similarly merging the activity train and test set
  activityData <- rbind(activityTrainData, activityTestData) #just a change of flavour :)
  
  ##MERGING ALL of them column wise
  data <- cbind(featureData,subjectData,activityData)
  
  ##GIVING VARIABLE NAMES to all
  pathLabels <- paste(path,"/UCI HAR Dataset",sep="")
  setwd(pathLabels)
  ##making a map of variable names using features.txt
  mapFeatureNames <- read.table("features.txt",sep=" ",header = FALSE,stringsAsFactors = FALSE)
  activity <- "Activity";subject <- "Subject"
  colnames(data) <- c(mapFeatureNames[,2],subject,activity)
  colNames <- colnames(data)
  
  
  ##filtering the MEAN and SD measurements from feature data
  colNames <- (colNames[(grepl("mean()",colNames) != grepl("meanFreq()", colNames) | grepl("std()",colNames)| grepl(subject,colNames) | grepl(activity,colNames)) == TRUE])
  data <- data[,colNames]

  colsData <- ncol(data) ##rather than hard coding ahead, we'll use these variables
  rowsData <- nrow(data)
  
  ##creating a df of ACTIVITY LABELS for appropriate mapping
  setwd(pathLabels)
  mapDf <- read.table("./activity_labels.txt",sep=" ",header = FALSE,stringsAsFactors = FALSE)
  
  ##using descriptive activity names
  ##going through each row of activities column, and replacing by label using "mapDf"
  activityLabel <- character() ## creating a character vector, which will be added to "data" in place of activity
  for(i in seq_along(data[,activity]))
  {
    activityCode <- data[i,colsData]
    activityLabel <- c(activityLabel,mapDf[activityCode,2])
  }
  ##replacement
  data[,activity] <- activityLabel
  
  ##FINDING AVERAGES of features for each activity and subject
  library(reshape2)
  tidyData <- melt(data,id=c(subject,activity),measure.vars=setdiff(colnames(data),c(subject,activity)))
  tidyData <- dcast(tidyData,Subject + Activity ~ variable,mean,na.rm=TRUE)
  
  
}