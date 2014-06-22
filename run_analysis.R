## File:    run_analysis.R
## Name:    Van Wray
## Project: Getting and Cleaning Data Course Project

## packages required
require(plyr)
require(reshape2)

## Load two files describing activity values and feature names from root folder
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
featuresdata <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
## Getting all of the "./UCI HAR Dataset/test/" files
ytestlabels <- read.table("./UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE)
xtestset <- read.table("./UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE)
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)
## Getting all of the "./UCI HAR Dataset/train/" files 
ytrainlabels <- read.table("./UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE)
xtrainset <- read.table("./UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE)
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)

## per the CRAN documentation specifications for valid names are here
## http://cran.r-project.org/doc/FAQ/R-FAQ.html#What-are-valid-names_003f
## " It consists of letters, numbers, and the dot and (for versions of R at least 1.9.0) 
## underscore characters, and starts with either a letter or a dot not followed by a number."

## function fixlabel to make valid R names

fixlabel <- function(string) {                 ## this is one approach
  string <- gsub("\\(\\)","",string)          ## remove ()
  string <- gsub("-","_",string)              ## replace - with _
  string <- gsub("\\,","_",string)            ## replace , with _
  string <- gsub("angle\\(","angle_",string)  ## replace angle( with angel_
  string <- gsub("\\(","",string)             ## remove (
  string <- gsub("\\)","",string)             ## remove )
  string
}

## Building up the entire data set
traindf <- data.frame()
traindf <- xtrainset

testdf <- data.frame()
testdf <- xtestset

## convert ytrainlabels and ytestlables to factors
ytrainlabels$V1 <- as.factor(ytrainlabels$V1)
ytestlabels$V1 <- as.factor(ytestlabels$V1)
## change factor labels with activity names
levels(ytrainlabels$V1) <- activitylabels$V2
levels(ytestlabels$V1) <- activitylabels$V2

## combine the activities for the test and train data sets
activitydf <- data.frame()
activitydf <- rbind(ytrainlabels,ytestlabels)
## combine the subjects for the test and train data sets
subjectdf <- data.frame()
subjectdf <- rbind(subjecttrain,subjecttest)

## combine the two data frames together
traintestdf <- data.frame()
traintestdf <- rbind(testdf,traindf)

## select all columns with mean() and std() - total 66
## create a TRUE and FALSE vector for all 561 values
selectmeanstd <- grepl("mean\\(\\)|std\\(\\)",featuresdata$V2)

## remove columns not related to mean() and std()
traintestdf <- traintestdf[,selectmeanstd]
## add column for activity
traintestdf <- cbind(traintestdf,activitydf)
## add column for subject
traintestdf <- cbind(traintestdf,subjectdf)

## create labels set of selected columns
labels <- featuresdata$V2[selectmeanstd]
## make valid R column names with custom function
labels <- fixlabel(labels)
## add on column names for activity and subject
labels <- c(labels,"activity","subject")

## replace column variable names of traintestdf with fixed labels
colnames(traintestdf) <- labels

# melt combined train and test data set
meltdf <- melt(traintestdf, id=c("subject","activity"))
## use decast to get tidy data set 
tidydatadf <- tidied <- dcast(meltdf, subject + activity ~ variable, mean, value.var="value")

## write tidy data set to a file
write.table(tidydatadf,"tidydatadf.txt", sep=",",col.names=NA)

