setwd("/Users/soniasingh/Desktop/Coursera/Data Science Specialization")
unzip("getdata_projectfiles_UCI HAR Dataset.zip", exdir = "HAR_Dataset")
list.files("HAR_Dataset")
path_rf <- file.path("/Users/soniasingh/Desktop/Coursera/Data Science Specialization/HAR_Dataset/" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files
#You should create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.

##TRAIN
FeatTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)
dim(FeatTrain)      ##[1] 7352  561
ActivTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
table(ActivTrain)  ##1    2    3    4    5    6 
                   ##1226 1073  986 1286 1374 1407
SubjTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)

##TEST
FeatTest <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
dim(FeatTest)       ##[1] 2947  561
ActivTest <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
table(ActivTest)   ## 1   2   3   4   5   6 
                   ## 496 471 420 491 532 537
SubjTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

##concatenate by row
dataSubj <- rbind(SubjTrain, SubjTest)
dataActiv<- rbind(ActivTrain, ActivTest)
dataFeat<- rbind(FeatTrain, FeatTest)
#name variables, for question#2
names(dataSubj)<-c("subject")
names(dataActiv)<- c("activity")
dataFeatNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)#read feature file
names(dataFeat)<- dataFeatNames$V2
#combine columns to attain required dataframe
data_merge <- cbind(dataSubj, dataActiv)
new_data <- cbind(dataFeat, data_merge)
dim(new_data) ## [1] 10299   563

##2.Extracts only the measurements on the mean and standard deviation for each measurement.
#[use 'grep'to search for matches to argument pattern within each element of a character vector.]
#Name of Features by measurements from mean&sd 
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
#Further select names from subset: subj&activ
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
new_data<-subset(new_data,select=selectedNames)
#Check what the data frame reflects
str(new_data) # 'data.frame': 10299 obs. of  68 variables

# 3.Uses descriptive activity names to name the activities in the data set
activ_Labels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE) #load labels from file

##4.Appropriately labels the data set with descriptive variable names.
    #['gsub' performs replacement of the first and all matches respectively.]
names(new_data)<-gsub("mean", "Mean", names(new_data))#capitalize M
names(new_data)<-gsub("std", "Std", names(new_data))#capitalize S
names(new_data)<-gsub("^t", "time", names(new_data))# change to time
names(new_data)<-gsub("^f", "frequency", names(new_data))#change to frequency
names(new_data)<-gsub("Acc", "Accelerometer", names(new_data))
names(new_data)<-gsub("Gyro", "Gyroscope", names(new_data))
names(new_data)<-gsub("Mag", "Magnitude", names(new_data))
names(new_data)<-gsub("BodyBody", "Body", names(new_data))#remove extra 'body'
names(new_data)<-gsub("\\(\\)","", names(new_data))#remove unnecessary parantheses
names(new_data)

#5.From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
library(plyr);
#['aggregate'-Splits the data into subsets, computes summary statistics for each, 
#and returns the result in a convenient form]
new_data2<-aggregate(. ~subject + activity, new_data, mean)
#order returns a permutation which rearranges its first argument into ascending or descending order, 
#breaking ties by further arguments; better than 'sort.list' for data frames.
new_data2<-new_data2[order(new_data2$subject,new_data2$activity),]
write.table(new_data, file = "tidydata.txt",row.name=FALSE)#write to text file
