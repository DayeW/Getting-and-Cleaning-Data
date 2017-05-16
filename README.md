Getting and Cleaning Data Course Project 
===========================================

Description
--------------------------------------------

This assignment requires the preparation of a raw data set into a tidy data set. Two data sets were generated: 

- A tidy data set with original observations (not included in repo)
- A tidy data set with the means of variables (found in repo as tidydata.txt)


Content of the data set was provided via the Coursera website from both the original site:
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

...and from the cloud storage: [.zip data file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


The process in creating the tidy data is stored in an R script called "run_analysis.R".


What's in "run_analysis.R"
--------------------------------------------------------

The following is a description of the project instructions.

```
You should create one R script called run_analysis.R that does the following.

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive activity names.
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
```


Running "run_analysis.R"
---------------------------------------------------------

The following provides the steps to run "run_analysis.R" locally.

-1) Unzip data from cloud storage and rename folder as UCIHARDataset (or a name of your choice) and set as working directory. You will need to manually replace line 3 with the path to the working directory. Note that both the dataset and run_analysis.R must be in the same working directory.
-2) Use the **source** command to run "run_analysis.R" in RStudio.
-3) You will find only one output file in the current working directory which contains cleaned data with only the merged means: "tidydata.txt"
-4) Use the **read.table** command to read the file. You should see a data set with 180 rows and 68 variables. 


**Additional Information**

See the CodeBook.md file for information regarding the text variables.


