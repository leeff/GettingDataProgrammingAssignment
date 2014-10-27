# How to run "run_analysis.R""
Simply type 
*source('./run_analysis.R', echo=TRUE)*

# How the program works

## Step 1: Merges the training and the test sets to create one data set.
Imports the feature labels to be used as column names for the data
Imports the training data
Imports the test data
Merges both training and test data

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

Computes a vector for column indices to extract by 
1. Add indices for columns subject and activity: 1, 2
2. Retrieving the indices of the column names that contain the string "mean()" or "std()"
Extracts the columns

## Step 3: Uses descriptive activity names to name the activities in the data set

Imports the descriptive activity names
Replaces the levels in the activity label with the correct descriptive activity name

## Step 4: Appropriately labels the data set with descriptive variable names. 
The data set names are already meaningful as values in features.txt had been used as column names when importing the data.
Here there is just some touch ups to the column names to make them more palatable:
1. replace any occurences of "." with "_" e.g. e.g. "tBodyAcc.mean...X" will become "tBodyAcc_mean_X"
2. replace "std" with "stdDev"

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Gets a vector of variable column names
Creates a function to calculate a vector consisting the mean of each variable
Gets the combination of applying the above function in ddply for each subject and activity
Writes the data out
Note: to read the data back, use read.table("data_tidy.txt", header = TRUE)