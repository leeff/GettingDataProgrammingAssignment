# Introduction
The R script, run_analysis.R, runs a series of analysis on the UCI Human Activity Recognition Using Smartphones Data Set described in below link
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project can the downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Synopsis of the analysis:
* Step 1: Merges the training and the test sets to create one data set.
* Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
* Step 3: Uses descriptive activity names to name the activities in the data set
* Step 4: Appropriately labels the data set with descriptive variable names. 
* Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Setup
* Unzip the above dataset in the working directory, creating the directory "getdata_projectfiles_UCI HAR Dataset" in the working directory.
* Place run_analysis.R in the working directory.
* Type R command **source('./run_analysis.R', echo=TRUE)**

## Output
Dataset "data_tidy.txt" in the working directory


# Details of Script

## Step 1: Merges the training and the test sets to create one data set.

* Imports the feature labels to be used as column names for the data
* Imports the training data
* Imports the test data
* Merges both training and test data

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

Computes a vector for column indices to extract by 
* Adding indices for columns subject and activity: 1, 2
* Retrieving the indices of the column names that contain the string "mean()" or "std()"
* Extracting the columns

## Step 3: Uses descriptive activity names to name the activities in the data set

* Imports the descriptive activity names
* Replaces the levels in the activity label with the correct descriptive activity name

## Step 4: Appropriately labels the data set with descriptive variable names. 
* The data set names are already meaningful as values in features.txt had been used as column names when importing the data. Here we do some touch up to the column names:
  * 1. replace any occurences of "." with "_" e.g. e.g. "tBodyAcc.mean...X" will become "tBodyAcc_mean_X"
  * 2. replace "std" with "stdDev"

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* Gets a vector of variable column names
* Creates a function to calculate a vector consisting the mean of each variable
* Gets the combination of applying the above function in ddply for each subject and activity
* Writes the data out. Note: to read the data back, use **read.table("data_tidy.txt", header = TRUE)**