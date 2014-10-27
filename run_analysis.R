## ***********
## Step 1: Merges the training and the test sets to create one data set.

## Imports the feature labels to be used as column names for the data
feature_labels <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", header = FALSE, col.names = c("num","label"), stringsAsFactors = FALSE)

## Imports the training data
subject_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = c("subject"))
X_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",header = FALSE, stringsAsFactors = FALSE, col.names = feature_labels[,"label"] )
y_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt",header = FALSE, colClasses=c("factor"), col.names = c("activity_label"))
data_train <- cbind(subject_train,y_train,X_train)

## Imports the test data
subject_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = c("subject"))
X_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",header = FALSE, stringsAsFactors = FALSE, col.names = feature_labels[,"label"] )
y_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt",header = FALSE, colClasses=c("factor"), col.names = c("activity_label"))
data_test <- cbind(subject_test,y_test,X_test)

## Merges both training and test data
data_all <- rbind(data_train,data_test)


## ***********
## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

# Computes a vector for column indices to extract by 
# 1. Add indices for columns subject and activity: 1, 2
# 2. Retrieving the indices of the column names that contain the string "mean()" or "std()"
colIndicesToExtract = c(1,2,grep('mean\\.|std',colnames(data_all)))

# Extracts the columns

data_extract <- data_all[,colIndicesToExtract]                     


## ***********
## Step 3: Uses descriptive activity names to name the activities in the data set

## Imports the descriptive activity names
activity_labels <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("num","label"), stringsAsFactors = FALSE)

## Replaces the levels in the activity label with the correct descriptive actvity name
levels(data_extract$activity_label) <- activity_labels[,"label"]


## ***********
## Step 4: Appropriately labels the data set with descriptive variable names. 
##
## The data set names are already meaningful as values in features.txt had been used as column names
## when importing the data.
## Here there is just some touch ups to the column names to make them more palatable:
## 1. replace any occurences of "." with "_" e.g. e.g. "tBodyAcc.mean...X" will become "tBodyAcc_mean_X"
## 2. replace "std" with "stdDev"

## extract all column names into a temporary vector
dataExtractColnames <- colnames(data_extract)

## replace any occurences of "." with "_" e.g. "tBodyAcc.mean...X" will become "tBodyAcc_mean_X"
dataExtractColnames <- gsub("\\.\\.\\.","_",dataExtractColnames)
dataExtractColnames <- gsub("\\.\\.$","",dataExtractColnames)
dataExtractColnames <- gsub("\\.","_",dataExtractColnames)

## replace "std" with "stdDev"
dataExtractColnames <- gsub("std","stdDev",dataExtractColnames)

## replace the column names of the dataset
colnames(data_extract) <- dataExtractColnames

## ***********
## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Gets a vector of variable column names
variableNames <- dataExtractColnames[-1:-2]

# Creates a function to calulate a vector consisting the mean of each variable
calMean <- function (x)
{
  meanDF <- vector()
  for (i in variableNames)
    meanDF <- c(meanDF,mean(x[,i]))
  meanDF
}

# Gets the combination of applying the above function in ddply for each subject and activity
data_tidy <- ddply(data_extract,.(subject,activity_label),calMean)

for (i in 1:length(variableNames))
  colnames(data_tidy)[i+2] <- paste("avg_",variableNames[i],sep="")

# Writes the data out
# Note: to read the data back, use read.table("data_tidy.txt", header = TRUE)
write.table(data_tidy,file="data_tidy.txt",row.names=FALSE)