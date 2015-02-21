This file contains two main topic: Script Description and Codebook.

# Script Description

## Pre-Requisites

In order to run the R script "run_analysis.R". The data needs to be extracted in your Working Directory, in the default folder "UCI HAR Dataset".

## Script

The script is divided in multiple steps:

### Establish filePath

#### Description

Obtains the Working Directory and adds establish the filePath

#### Variables:

* wd - string. Working Directory
* directory - string. folder in which the data is located
* filePath - string. wd + directory

### Load Generic Data

#### Description

Loads the Activity IDs and Names and the Column Ids and Names

#### Variables:

* actNamesPath - string. filePath + Activity Names FileName
* colNamesPath - string. filePath + Data Column (features) index and Names FileName

* actNames - Data frame. Actvity Id and Names
* colNames - Data frame. Data Column Index and Name

### Load Test Data

#### Description

Loads the Subject, Activities and Data from test and creates a data frame wit them

#### Variables:

* testPath - string. filePath + Test Folder
* SubjectTestPath - string. testPath + Subject FileName
* activityTestPath - string. testPath + Activity FileName
* testDataPath - string. testPath + Test data FileName

* SubjectTest - Data frame. Subject data from test
* activityTest - Data frame. Activity data from test
* sub.act.test -  Data frame. SubjectTest + activityTest
* TestData - Data frame. Test data from test
* test - Data frame. sub.act.test + testData

### Load Train Data

#### Description

Loads the Subject, Activities and Data from train and creates a data frame wit them

#### Variables:

* trainPath - string. filePath + Train Folder
* SubjectTrainPath - string. trainPath + Subject FileName
* activityTrainPath - string. trainPath + Activity FileName
* trainDataPath - string. trainPath + Train data FileName

* SubjectTrain - Data frame. Subject data from train
* activityTrain - Data frame. Activity data from train
* sub.act.train -  Data frame. SubjectTrain + activityTrain
* TrainData - Data frame. Train data from train
* train - Data frame. sub.act.train + trainData

### Merge and Subset

#### Description

1. Creates a unique data fame with test and train data from previous section
2. Adds the Activity Name to the data frame. 
3. subset taking only the data related to the mean and standard deviation.
4. Fix the Names of the Columns

#### Variables:

* all - Data frame. test + train
* subset - string vector. Vector with all the columns needed for the subset

* ds - Data frame. subset from "all" data frame, based in the columns from "subset"

### Result

#### Description

1. Calculates the average per Subject and Activity
2. Sort data frame by Subject and Activity
3. Creates file with Result

#### Variables:

* ds.average - Data frame. Contains an average from "ds" dataframe for each variable per Subject and Activity

# Codebook

The result.txt file created by the script contains the following Variables:

**NOTE**: All the variables except the "Subject" and "Activity Name" are an **average** of the source data per subject and Activity.
The type of these variables is numeric contained in the range [-1,1].

if the variable contains:
- 't': denotes time. The original variables "were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise."
- 'f': denotes that the Fast Fourier Transform was applied.

* Subject - integer. Identifies a person of the study
* Activity Name - string. Name of the activity measured. The possible values are:
..* WALKING
..* WALKING_UPSTAIRS
..* WALKING_DOWNSTAIRS
..* SITTING
..* STANDING
..* LAYING
* tBodyAcc mean-X - numeric. Average of the mean of the body acceleration signal in dimension X.
* tBodyAcc mean-Y - numeric. Average of the mean of the body acceleration signal in dimension Y.
* tBodyAcc mean-Z - numeric. Average of the mean of the body acceleration signal in dimension Z.
* tBodyAcc std-X - numeric. Average of the standard deviation of the body acceleration signal in dimension X.
* tBodyAcc std-Y - numeric. Average of the standard deviation of the body acceleration signal in dimension Y.
* tBodyAcc std-Z - numeric. Average of the standard deviation of the body acceleration signal in dimension Z.
* tGravityAcc mean-X - numeric. Average of the mean of the Gravity acceleration in dimension X.
* tGravityAcc mean-Y - numeric. Average of the mean of the Gravity acceleration in dimension Y.
* tGravityAcc mean-Z - numeric. Average of the mean of the Gravity acceleration in dimension Z.
* tGravityAcc std-X - numeric. Average of the standard deviation of the Gravity acceleration in dimension X.
* tGravityAcc std-Y - numeric. Average of the standard deviation of the Gravity acceleration in dimension Y.
* tGravityAcc std-Z - numeric. Average of the standard deviation of the Gravity acceleration in dimension Z.
* tBodyAccJerk mean-X - numeric. Average of the mean of the body acceleration Jerk signal in dimension X.
* tBodyAccJerk mean-Y - numeric. Average of the mean of the body acceleration Jerk signal in dimension Y.
* tBodyAccJerk mean-Z - numeric. Average of the mean of the body acceleration Jerk signal in dimension Z.
* tBodyAccJerk std-X - numeric. Average of the standard deviation of the body acceleration Jerk signal in dimension X.
* tBodyAccJerk std-Y - numeric. Average of the standard deviation of the body acceleration Jerk signal in dimension Y.
* tBodyAccJerk std-Z - numeric. Average of the standard deviation of the body acceleration Jerk signal in dimension Z.
* tBodyGyro mean-X - numeric. Average of the mean of the body gyroscope Jerk signal in dimension X.
* tBodyGyro mean-Y - numeric. Average of the mean of the body gyroscope Jerk signal in dimension Y.
* tBodyGyro mean-Z - numeric. Average of the mean of the body gyroscope Jerk signal in dimension Z.
* tBodyGyro std-X - numeric. Average of the standard deviation of the body gyroscope Jerk signal in dimension X.
* tBodyGyro std-Y - numeric. Average of the standard deviation of the body gyroscope Jerk signal in dimension Y.
* tBodyGyro std-Z - numeric. Average of the standard deviation of the body gyroscope Jerk signal in dimension Z.
* tBodyGyroJerk mean-X - numeric. Average of the mean of the body gyroscope Jerk signal in dimension X.
* tBodyGyroJerk mean-Y - numeric. Average of the mean of the body gyroscope Jerk signal in dimension Y.
* tBodyGyroJerk mean-Z - numeric. Average of the mean of the body gyroscope Jerk signal in dimension Z.
* tBodyGyroJerk std-X - numeric. Average of the standard deviation of the body gyroscope Jerk signal in dimension X.
* tBodyGyroJerk std-Y - numeric. Average of the standard deviation of the body gyroscope Jerk signal in dimension Y.
* tBodyGyroJerk std-Z - numeric. Average of the standard deviation of the body gyroscope Jerk signal in dimension Z.
* tBodyAccMag mean - numeric. Average of the mean of Magnitude of the three-dimensional variables the body acceleration signal.
* tBodyAccMag std - numeric. Average of the standard deviation of Magnitude of the three-dimensional variables the body acceleration signal.
* tBodyAccJerkMag mean - numeric. Average of the mean of Magnitude of the three-dimensional variables the body acceleration Jerk signal.
* tBodyAccJerkMag std - numeric. Average of the standard deviation of Magnitude of the three-dimensional variables the body acceleration Jerk signal.
* tGravityAccMag mean - numeric. Average of the mean of Magnitude of the three-dimensional variables the gravity acceleration signal.
* tGravityAccMag std - numeric. Average of the standard deviation of Magnitude of the three-dimensional variables the gravitx acceleration signal.
* tBodyGyroMag mean - numeric. Average of the mean of Magnitude of the three-dimensional variables the body gyroscope signal.
* tBodyGyroMag std - numeric. Average of the standard deviation of Magnitude of the three-dimensional variables the body gyroscope signal.
* tBodyGyroJerkMag mean - numeric. Average of the mean of Magnitude of the three-dimensional variables the body gyroscope Jerk signal.
* tBodyGyroJerkMag std - numeric. Average of the standard deviation of Magnitude of the three-dimensional variables the body gyroscope Jerk signal.
* fBodyAcc mean-X - numeric. Average of the mean of the FFT for the body acceleration signal in dimension X.
* fBodyAcc mean-Y - numeric. Average of the mean of the FFT for the body acceleration signal in dimension Y.
* fBodyAcc mean-Z - numeric. Average of the mean of the FFT for the body acceleration signal in dimension Z.
* fBodyAcc std-X - numeric. Average of the standard deviation of the FFT for the body acceleration signal in dimension X.
* fBodyAcc std-Y - numeric. Average of the standard deviation of the FFT for the body acceleration signal in dimension Y.
* fBodyAcc std-Z - numeric. Average of the standard deviation of the FFT for the body acceleration signal in dimension Z.
* fBodyAccJerk mean-X - numeric. Average of the mean of the FFT for the body acceleration Jerk signal in dimension X.
* fBodyAccJerk mean-Y - numeric. Average of the mean of the FFT for the body acceleration Jerk signal in dimension Y.
* fBodyAccJerk mean-Z - numeric. Average of the mean of the FFT for the body acceleration Jerk signal in dimension Z.
* fBodyAccJerk std-X - numeric. Average of the standard deviation of the FFT for the body acceleration Jerk signal in dimension X.
* fBodyAccJerk std-Y - numeric. Average of the standard deviation of the FFT for the body acceleration Jerk signal in dimension Y.
* fBodyAccJerk std-Z - numeric. Average of the standard deviation of the FFT for the body acceleration Jerk signal in dimension Z.
* fBodyGyro mean-X - numeric. Average of the mean of the FFT for the body gyroscope signal in dimension X.
* fBodyGyro mean-Y - numeric. Average of the mean of the FFT for the body gyroscope signal in dimension Y.
* fBodyGyro mean-Z - numeric. Average of the mean of the FFT for the body gyroscope signal in dimension Z.
* fBodyGyro std-X - numeric. Average of the standard deviation of the FFT for the body gyroscope signal in dimension X.
* fBodyGyro std-Y - numeric. Average of the standard deviation of the FFT for the body gyroscope signal in dimension Y.
* fBodyGyro std-Z - numeric. Average of the standard deviation of the FFT for the body gyroscope signal in dimension Z.
* fBodyAccMag mean - numeric. Average of the mean of the FFT for the Magnitude of the three-dimensional variables of the body acceleration signal.
* fBodyAccMag std - numeric. Average of the standard deviation of the FFT for the Magnitude of the three-dimensional variables of the body acceleration signal.
* fBodyAccJerkMag mean - numeric. Average of the mean of the FFT for the Magnitude of the three-dimensional variables of the body acceleration Jerk signal.
* fBodyAccJerkMag std - numeric. Average of the standard deviation of the FFT for the Magnitude of the three-dimensional variables of the body acceleration Jerk signal.
* fBodyGyroMag mean - numeric. Average of the mean of the FFT for the Magnitude of the three-dimensional variables of the body gyroscope signal.
* fBodyGyroMag std - numeric. Average of the standard deviation of the FFT for the Magnitude of the three-dimensional variables of the body gyroscope signal.
* fBodyGyroJerkMag mean - numeric. Average of the mean of the FFT for the Magnitude of the three-dimensional variables of the body gyroscope Jerk signal.
* fBodyGyroJerkMag std - numeric. Average of the standard deviation of the FFT for the Magnitude of the three-dimensional variables of the body gyroscope Jerk signal.

