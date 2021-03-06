# Introduction

The data file "data_tidy.txt" contains summarized information from UCI Human Activity Recognition Using Smartphones Data Set described in below link
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Fields
1. "subject" : Subject label
2. "activity_label": 
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING
3. 66 variables for the average of the estimated mean and standard deviation features for 17 signals taken for the subject and activity:
**'_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.**

## What are the 17 signals

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

1.tBodyAcc-XYZ
2.tGravityAcc-XYZ
3.tBodyAccJerk-XYZ
4.tBodyGyro-XYZ
5.tBodyGyroJerk-XYZ
6.tBodyAccMag
7.tGravityAccMag
8.tBodyAccJerkMag
9.tBodyGyroMag
10.tBodyGyroJerkMag
11.fBodyAcc-XYZ
12.fBodyAccJerk-XYZ
13.fBodyGyro-XYZ
14.fBodyAccMag
15.fBodyAccJerkMag
16.fBodyGyroMag
17.fBodyGyroJerkMag

## Naming of the 66 variables based on the signal
"avg_" + **signal** + ("_mean" OR "_stdDev") + optionally "_X", "_Y" or "_Z" to denote direction.

## The resultant 66 variable names
"avg_tBodyAcc_mean_X" "avg_tBodyAcc_mean_Y" "avg_tBodyAcc_mean_Z" "avg_tBodyAcc_stdDev_X" "avg_tBodyAcc_stdDev_Y" "avg_tBodyAcc_stdDev_Z" "avg_tGravityAcc_mean_X" "avg_tGravityAcc_mean_Y" "avg_tGravityAcc_mean_Z" "avg_tGravityAcc_stdDev_X" "avg_tGravityAcc_stdDev_Y" "avg_tGravityAcc_stdDev_Z" "avg_tBodyAccJerk_mean_X" "avg_tBodyAccJerk_mean_Y" "avg_tBodyAccJerk_mean_Z" "avg_tBodyAccJerk_stdDev_X" "avg_tBodyAccJerk_stdDev_Y" "avg_tBodyAccJerk_stdDev_Z" "avg_tBodyGyro_mean_X" "avg_tBodyGyro_mean_Y" "avg_tBodyGyro_mean_Z" "avg_tBodyGyro_stdDev_X" "avg_tBodyGyro_stdDev_Y" "avg_tBodyGyro_stdDev_Z" "avg_tBodyGyroJerk_mean_X" "avg_tBodyGyroJerk_mean_Y" "avg_tBodyGyroJerk_mean_Z" "avg_tBodyGyroJerk_stdDev_X" "avg_tBodyGyroJerk_stdDev_Y" "avg_tBodyGyroJerk_stdDev_Z" "avg_tBodyAccMag_mean" "avg_tBodyAccMag_stdDev" "avg_tGravityAccMag_mean" "avg_tGravityAccMag_stdDev" "avg_tBodyAccJerkMag_mean" "avg_tBodyAccJerkMag_stdDev" "avg_tBodyGyroMag_mean" "avg_tBodyGyroMag_stdDev" "avg_tBodyGyroJerkMag_mean" "avg_tBodyGyroJerkMag_stdDev" "avg_fBodyAcc_mean_X" "avg_fBodyAcc_mean_Y" "avg_fBodyAcc_mean_Z" "avg_fBodyAcc_stdDev_X" "avg_fBodyAcc_stdDev_Y" "avg_fBodyAcc_stdDev_Z" "avg_fBodyAccJerk_mean_X" "avg_fBodyAccJerk_mean_Y" "avg_fBodyAccJerk_mean_Z" "avg_fBodyAccJerk_stdDev_X" "avg_fBodyAccJerk_stdDev_Y" "avg_fBodyAccJerk_stdDev_Z" "avg_fBodyGyro_mean_X" "avg_fBodyGyro_mean_Y" "avg_fBodyGyro_mean_Z" "avg_fBodyGyro_stdDev_X" "avg_fBodyGyro_stdDev_Y" "avg_fBodyGyro_stdDev_Z" "avg_fBodyAccMag_mean" "avg_fBodyAccMag_stdDev" "avg_fBodyBodyAccJerkMag_mean" "avg_fBodyBodyAccJerkMag_stdDev" "avg_fBodyBodyGyroMag_mean" "avg_fBodyBodyGyroMag_stdDev" "avg_fBodyBodyGyroJerkMag_mean" "avg_fBodyBodyGyroJerkMag_stdDev"