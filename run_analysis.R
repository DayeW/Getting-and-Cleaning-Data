##Open plyr and set working directory to unzipped file
library(plyr)
setwd("~/Desktop/Work/Coursera/Getting_CleaningData/UCIHARDataset")

###Merge the training and the test sets to create one data set.
#note: created three data sets to merge later
#Read Training files
xtrain <- read.table("./train/X_train.txt", header = F) #features
ytrain <- read.table("./train/y_train.txt", header = F) #activity 
subjecttrain <- read.table("./train/subject_train.txt", header = F) #subject 
#Read Test files
xtest <- read.table("./test/X_test.txt", header = F) #features
ytest <- read.table("./test/y_test.txt", header = F) #activity 
subjecttest <- read.table("./test/subject_test.txt", header = F) #subject 
#Create merged data: combine x and x, y and y, subject and subject
xfeatures <- rbind(xtrain, xtest)
yactivity <- rbind(ytrain, ytest)
subject <- rbind(subjecttrain, subjecttest)

###Extracts only the measurements on the mean and standard deviation for each measurement.
#Read features file
features <- read.table("./features.txt", header = F)
#Find word pattern mean and std 
meanstd <- grep("mean\\(\\)|std\\(\\)", features[,2])
xfeatures <- xfeatures[, meanstd]
#Clean up column names
colnames(xfeatures) <- gsub("\\(\\)", "", features[meanstd, 2]) 
colnames(xfeatures) <- gsub("mean", "Mean", names(xfeatures)) 
colnames(xfeatures) <- gsub("std", "Std", names(xfeatures)) 
colnames(xfeatures) <- gsub("-", "", names(xfeatures)) 

###Uses descriptive activity names to name the activities in the data set
#Read activity file
activitylabels <- read.table("./activity_labels.txt", header = F)
#Clean up data
activitylabels[, 2] <- tolower(gsub("_", "", activitylabels[, 2])) #lowercase, removed "_"
activityLabel <- activitylabels[yactivity[, 1], 2]
yactivity[, 1] <- activityLabel
colnames(yactivity) <- c("activity")

###Appropriately labels the data set with descriptive variable names.
#create first tidy data set
colnames(subject) <- c("subject")
tidydata <- cbind(subject, yactivity, xfeatures)
#add descriptive names
names(tidydata) <- gsub("^t", "time", names(tidydata))
names(tidydata) <- gsub("^f", "frequency", names(tidydata))
names(tidydata) <- gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata) <- gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata) <- gsub("Mag", "Magnitude", names(tidydata))
names(tidydata) <- gsub("BodyBody", "Body", names(tidydata))


###From the data set in step 4, creates a second, independent tidy data set 
###with the average of each variable for each activity and each subject.
#find the mean for the second dataset
tidydata2 <- aggregate(. ~subject + activity, tidydata, mean)
tidydata2 <- tidydata2[order(tidydata2$subject, tidydata2$activity),]
#create file for second dataset 
write.table(tidydata2, file = "tidydata2.txt",row.name=FALSE)


