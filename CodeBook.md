CodeBook for Getting and Cleaning Data Course Project
=======================================================

Source data can be found via this link: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

...or downloaded here: [.zip data file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


**"run_analysis.R" Script Transformations**
-------------------------------------------

**Variables used in script file**
-1) *xtrain, ytrain, subjecttrain*: read respectively from text files "X_train", "y_train", "subject_train"

-2) *xtest, ytest, subjecttest*: read respectively from text files "X_test", "y_test", "subject_test"

-3) *xfeatures, yactivity, subject*: read respectively from combining *xtrain and xtest*, *ytrain and ytest*, *subjecttrain and subjecttest*
  
-4) *features*: read from text file "features"

-5) *meanstd*: extracted mean and standard deviation names from above

-6) *xfeatures*: transformed previous xfeatures variable with meanstd
  +Removed all "()" and "-"
  +Capitalized M, S
  
-7) *activitylabels*: read text file "activity_labels"

-8) *activityLabel*: combined above with *yactivty* and reduced to all lower case:
  +1. walking
  +2. walkingupstairs
  +3. walkingdownstairs
  +4. sitting
  +5. standing
  +6. laying
  
-9) *tidydata*: combined *subject, yactivity, xfeatures* into one dataset. 
  +Reformatted column names to more descriptive names. i.e. ^f changed to frequency

-10) *tidydata2*: aggregated means of *subject* and *yactivity* variables into second dataset.

**The following lists the general variable names in "tidydata.txt"**

Identifiers
``
-subject
-activity
``


Measurements
```
-timeBodyAccelerometer
-timeGravityAccelerometer
-timeBodyAccelerometerJerk
-timeBodyGyroscope
-timeBodyGyroscopeJerk
-timeBodyAccelerometerMagnitude
-timeBodyAccelerometerJerkMagnitude
-timeBodyGyroscopeMagnitude
-timeBodyGyroscopeJerkMagnitude
-frequencyBodyAccelerometer
-frequencyBodyAccelerometerJerk
-frequencyBodyGyroscope
-frequencyBodyAccelerometerMagnitude
-frequencyBodyAccelerometerJerkMagnitude
-frequencyBodyGyroscopeMagnitude
-frequencyBodyGyroscopeJerkMagnitude
```

**The following lists all 68 variables (column names) in "tidydata.txt"**

```{r}
[1] "subject"                                    
 [2] "activity"                                   
 [3] "timeBodyAccelerometerMeanX"                 
 [4] "timeBodyAccelerometerMeanY"                 
 [5] "timeBodyAccelerometerMeanZ"                 
 [6] "timeBodyAccelerometerStdX"                  
 [7] "timeBodyAccelerometerStdY"                  
 [8] "timeBodyAccelerometerStdZ"                  
 [9] "timeGravityAccelerometerMeanX"              
[10] "timeGravityAccelerometerMeanY"              
[11] "timeGravityAccelerometerMeanZ"              
[12] "timeGravityAccelerometerStdX"               
[13] "timeGravityAccelerometerStdY"               
[14] "timeGravityAccelerometerStdZ"               
[15] "timeBodyAccelerometerJerkMeanX"             
[16] "timeBodyAccelerometerJerkMeanY"             
[17] "timeBodyAccelerometerJerkMeanZ"             
[18] "timeBodyAccelerometerJerkStdX"              
[19] "timeBodyAccelerometerJerkStdY"              
[20] "timeBodyAccelerometerJerkStdZ"              
[21] "timeBodyGyroscopeMeanX"                     
[22] "timeBodyGyroscopeMeanY"                     
[23] "timeBodyGyroscopeMeanZ"                     
[24] "timeBodyGyroscopeStdX"                      
[25] "timeBodyGyroscopeStdY"                      
[26] "timeBodyGyroscopeStdZ"                      
[27] "timeBodyGyroscopeJerkMeanX"                 
[28] "timeBodyGyroscopeJerkMeanY"                 
[29] "timeBodyGyroscopeJerkMeanZ"                 
[30] "timeBodyGyroscopeJerkStdX"                  
[31] "timeBodyGyroscopeJerkStdY"                  
[32] "timeBodyGyroscopeJerkStdZ"                  
[33] "timeBodyAccelerometerMagnitudeMean"         
[34] "timeBodyAccelerometerMagnitudeStd"          
[35] "timeGravityAccelerometerMagnitudeMean"      
[36] "timeGravityAccelerometerMagnitudeStd"       
[37] "timeBodyAccelerometerJerkMagnitudeMean"     
[38] "timeBodyAccelerometerJerkMagnitudeStd"      
[39] "timeBodyGyroscopeMagnitudeMean"             
[40] "timeBodyGyroscopeMagnitudeStd"              
[41] "timeBodyGyroscopeJerkMagnitudeMean"         
[42] "timeBodyGyroscopeJerkMagnitudeStd"          
[43] "frequencyBodyAccelerometerMeanX"            
[44] "frequencyBodyAccelerometerMeanY"            
[45] "frequencyBodyAccelerometerMeanZ"            
[46] "frequencyBodyAccelerometerStdX"             
[47] "frequencyBodyAccelerometerStdY"             
[48] "frequencyBodyAccelerometerStdZ"             
[49] "frequencyBodyAccelerometerJerkMeanX"        
[50] "frequencyBodyAccelerometerJerkMeanY"        
[51] "frequencyBodyAccelerometerJerkMeanZ"        
[52] "frequencyBodyAccelerometerJerkStdX"         
[53] "frequencyBodyAccelerometerJerkStdY"         
[54] "frequencyBodyAccelerometerJerkStdZ"         
[55] "frequencyBodyGyroscopeMeanX"                
[56] "frequencyBodyGyroscopeMeanY"                
[57] "frequencyBodyGyroscopeMeanZ"                
[58] "frequencyBodyGyroscopeStdX"                 
[59] "frequencyBodyGyroscopeStdY"                 
[60] "frequencyBodyGyroscopeStdZ"                 
[61] "frequencyBodyAccelerometerMagnitudeMean"    
[62] "frequencyBodyAccelerometerMagnitudeStd"     
[63] "frequencyBodyAccelerometerJerkMagnitudeMean"
[64] "frequencyBodyAccelerometerJerkMagnitudeStd" 
[65] "frequencyBodyGyroscopeMagnitudeMean"        
[66] "frequencyBodyGyroscopeMagnitudeStd"         
[67] "frequencyBodyGyroscopeJerkMagnitudeMean"    
[68] "frequencyBodyGyroscopeJerkMagnitudeStd"
```


**Raw Dataset Summary**
------------------------------------------

**Description** 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.


**Provided Variables**

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


**Provided Files**

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.


**File Descriptions**

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


**Text Source**
Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws*
