# Getting and Cleaning Data Course Project
Author: Venky Ramasubramani
UCI HAR Tidy Set Project

## Summary
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Data Source
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Attached Script and how to run it?
1. Download the above data zip file and unzip it into a folder and note the folder name full path.
2. Download the attached script named run_analysis.R
3. You should bring it into an R Studio window
4. Execute the script in R Studio
5. It will ask you the folder name for the data files from step #1. Provide that and enter
6. It will generate the output file in the same folder

## Script information
Please refer to the Codebook.md for detailed information about the script. But it does the following things.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. And the output is generated into a flat file.
