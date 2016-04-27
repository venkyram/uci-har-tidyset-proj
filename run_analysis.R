##------------------------------------------------------------------------------
## Getting and Cleaning Data Course Project Work
## run_analysis.R
## Author: Venky Ramasubramani
## 2016-04-27
##
## As outlined in the project requirement, this script does the following
## Data Source: 
##    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
##  1. Merges the training and the test sets to create one data set
##  2. Extracts only the measurements on the mean and standard deviation for each
##     measurement.
##  3. Uses descriptive activity names to name the activities in the data set
##  4. Appropriately labels the data set with descriptive variable names.
##  5. From the data set in step 4, creates a second, independent tidy data set 
##     with the average of each variable for each activity and each subject.
##------------------------------------------------------------------------------

# Setup the environment
rm(list = ls())
library(assertthat)
library(dplyr)
library(tidyr)

# Setup working directory
readwd <- function()
{ 
        wd <- readline(prompt="Enter Working Dir with Data to test: ")
        wd <- as.character(wd)
        if(!see_if(is.dir(wd))){
                print("Invalid Dir..")
                wd <- readwd()
        }
        return(wd)
}

wd <- readwd()
print(paste0("Setting Working Dir to : ", wd))
setwd(wd)

# Read and load the data sets - setup file names
fileNameX <- "test/X_test.txt"
fileNameTX <- "train/X_train.txt"

fileNameY <- "test/Y_test.txt"
fileNameTY <- "train/Y_train.txt"

fileNameST <- "test/subject_test.txt"
fileNameTST <- "train/subject_train.txt"

fileNameFeatures <- "features.txt"
fileNameActivity <- "activity_labels.txt"

# load test data set
features <- read.table(fileNameFeatures, header = FALSE)
testX <- read.table(fileNameX, header = FALSE)
colnames(testX) <- features$V2

testY <- read.table(fileNameY, header = FALSE)
colnames(testY) <- c("Activity")

testST <- read.table(fileNameST, header = FALSE)
colnames(testST) <- c("Subject")

dataSource <- "Test"
testCombined <- cbind(testST, testY, dataSource, testX)

# load train data set
trainX <- read.table(fileNameTX, header = FALSE)
colnames(trainX) <- features$V2

trainY <- read.table(fileNameTY, header = FALSE)
colnames(trainY) <- c("Activity")

trainST <- read.table(fileNameTST, header = FALSE)
colnames(trainST) <- c("Subject")

dataSource <- "Train"
trainCombined <- cbind(trainST, trainY, dataSource, trainX)

# 1. Merges the training and the test sets to create one data set
combined <- rbind(testCombined, trainCombined)
Combined <- tbl_df(combined)
rm(combined)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement

names(Combined) <- make.names(names=names(Combined), unique=TRUE)
CombinedSubset <- 
        Combined %>%
        select(Subject, Activity, contains(".mean.."), contains(".std.."))

#  3. Uses descriptive activity names to name the activities in the data set
actLabels <- read.table(fileNameActivity, header = FALSE)
colnames(actLabels) <- c("Activity", "ActivityNames")

CombinedSubset <- 
        inner_join(CombinedSubset, actLabels) %>% 
        select(Subject, Activity, ActivityNames, 3:68)

# 4. Appropriately labels the data set with descriptive variable names
# Note that some of the variable names already make sense. We are just trying
# fix certain shortened elements and make it consistent to read

currColNames <- colnames(CombinedSubset)
currColNames <- gsub(".mean..", "Mean", currColNames)
currColNames <- gsub(".std..", "StdDev", currColNames)
currColNames <- gsub("^t", "time", currColNames)
currColNames <- gsub("^f", "freq", currColNames)
currColNames <- gsub("Mag", "Magnitude", currColNames)

colnames(CombinedSubset) <- currColNames

# 5. From the data set in step 4, creates a second, independent tidy data set 
#     with the average of each variable for each activity and each subject.

tidySet <- CombinedSubset %>%
        select(-(Activity)) %>%
        group_by(ActivityNames, Subject) %>%
        summarize_each(funs(mean))

# Write out the tidy data set into a flat file
write.table(tidySet, file = "UCI-HAR-Tidyset-venkyram-proj-output.csv", row.names = FALSE)