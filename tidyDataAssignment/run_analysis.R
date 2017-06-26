# ----------------------------------------------------------------------------------------------------
# Course:   Coursera Data Science - R Programming
# Date:     6/24/2017
# Data:     
#   The data used represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
#   A joined description is available at the site where the data was obtained:
#   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
#   The data for the project is at:
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# Purpose:  
#   Write an R script called run_analysis.R that does the following.
#
#   1. Merges the training and the test sets to create one data set.
#   2. Extracts only the measurements on the mean and standard deviation for each measurement.
#   3. Uses descriptive activity names to name the activities in the data set
#   4. Appropriately labels the data set with descriptive variable names.
#   5. From the data set in step 4, create a second, independent tidy data set with the average of
#      each variable for each activity and each subject.
# ------------------------------------------------------------------------------------------------------

# Read our Data
# -----------------------------------
dataDir<- "data/UCI HAR Dataset"
trainingSetDir<- paste0(dataDir,"/train")
testSetDir<- paste0(dataDir,"/test")

# Read features and activity_label files
features <- read.table(paste0(dataDir, "/features.txt"), header = FALSE, stringsAsFactors = FALSE, col.names = c('id','feature'))
activities <- read.table(paste0(dataDir, "/activity_labels.txt"), header = FALSE, col.names = c('id','activity'))

# Reduce the set of features to measurements on the mean and standard deviation.
subsetFeatures <- c(grep("mean\\(\\)|std\\(\\)", features$feature))

# Read training files
trainingX <- read.table(paste0(trainingSetDir,"/X_train.txt"), header = FALSE, col.names=c(features$feature))
trainingY <- read.table(paste0(trainingSetDir, "/y_train.txt"), header = FALSE, col.names=c("activity"))
trainingSubjects <- read.table(paste0(trainingSetDir,"/subject_train.txt"), header = FALSE, col.names=c("subject"))

# Read test files
testX <- read.table(paste0(testSetDir,"/X_test.txt"), header = FALSE, col.names=c(features$feature))
testY <- read.table(paste0(testSetDir,"/y_test.txt"), header = FALSE, col.names=c("activity"))
testSubjects <- read.table(paste0(testSetDir,"/subject_test.txt"), header = FALSE, col.names=c("subject"))

# Merge our data sets
# -----------------------------------
# Before we merge, reduce the training set to only the measurements on the mean and standard deviation for each measurement.
trainingX <- subset(trainingX, select= subsetFeatures)
testX <- subset(testX, select= subsetFeatures)

# Join the training and the test sets in order to create one data set.
joinedX <- rbind(trainingX, testX)
joinedY <- rbind(trainingY, testY)
joinedSubjects <- rbind(trainingSubjects, testSubjects)

# Clean-up
rm(trainingX)
rm(trainingY)
rm(trainingSubjects)
rm(testX)
rm(testY)
rm(testSubjects)
gc()

# Make one dataset with the specified columns
rData <- cbind(joinedX, cbind(joinedSubjects, joinedY))

# Clean-up
rm(joinedX)
rm(joinedY)
rm(joinedSubjects)
gc()

# Tidy up the data set variables
# -----------------------------------
# Uses the activity labels to name the activities in the data set
rData$activity <- activities$activity[rData$activity]

# Lowercase all names
names(rData) <- tolower(names(rData))

# Rename the column names according to the features_info file: the prefix "t" means "time" and "f" means "frequency"
names(rData) <- sub("^t", "time-", names(rData))
names(rData) <- sub("^f", "freq-", names(rData))
names(rData) <- sub("[()]", "", names(rData))
names(rData) <- gsub("[.]{1,}", "-", names(rData))
names(rData) <- sub("[-]$", "", names(rData))

# TechNote: some column names have Acc and Mag so expanding the name would create too large of a column name
#names(rData) <- sub("Acc", "-acceleration", names(rData))
#names(rData) <- sub("Mag", "-magnitude", names(rData))

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject
rTidyData <- aggregate(. ~ subject + activity, data = rData, FUN = mean) # 180 obs. of 68 variables
write.table(rTidyData, "uci_har_tidy_data.txt", row.name = FALSE) 
