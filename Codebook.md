# Data Cookbook
Author: Venky Ramasubramani

## Data Source
Full description of the data can be found at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data files downloaded from here
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Script information
###0.a. Sets working directory, environment and filenames
It asks for a working directory which contains the data files. This step is provided to facilitate the tester.

###0.b. Loads the test and training data files
Files used in this section are below.

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

###1. Merges the training and the test sets to create one data set

###2. Extracts only the measurements on the mean and standard deviation for each measurement
Data set contains about 561 measurements. This step removes all measurements except mean and standard deviations.

###3. Uses descriptive activity names to name the activities in the data set.
Activity description name is on a different file. It is joined with the data from step 2 to result in a include the descriptive activity names.

###4. Appropriately labels the data set with descriptive variable names.
All the variable names in the resulting data set are sanitized to make them more readeable and descriptive, while removing special characters.

###5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
Tidy data set summarized over activity and subject are created out of the previous step.

###6. And the output is generated into a flat file.
Output file will be named as UCI-HAR-Tidyset-venkyram-proj-output.csv and generated in the same working directory.
