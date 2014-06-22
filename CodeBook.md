Code Book - run_analysis.R
========================================================

Introduction
____________________________________________________________
The following is the Code Book that describes the variables contained
in the tidy data set created by the run_analysis.R script.

The output of run_analysis.R script will be found in the file
"tidydatadf.txt"

This file an be successfully consumed back into R with the following command  
`tidydf <- read.table("tidydatadf.txt", header = TRUE, sep=",", row.names = 1)`

For a complete description of the run_analysis.R configuration, installation,
and operation please consult the file ReadMe.md accompanying the file on the Github
repository https://github.com/vjwray/GettingandCleaningData

June 21, 2014  
Van Wray

Variable Description
------------------------------------------------------------
### subject variable
The "subject" variable is an integer between 1 and 30 that represents one of the 30 subjects
who carried out the experiment

### activity variable
The "activity" is a factor variable with one of 6 levels. The levels coorespond to
a numeric representation of the factor described below.  
1            WALKING  
2   WALKING_UPSTAIRS  
3 WALKING_DOWNSTAIRS  
4            SITTING  
5           STANDING  
6             LAYING  

### remaining 66 variables
The remaining 66 variables hold a numeric value for each observation. The numeric
value is a calculated value and it is the average of all observations for a 
particular subject for a particular activity found in the 10299 original observations from the "UCI HAR Data set".

Because there are 30 subjects with each having signal calculations for 6 seperate
activities the tidy data set is a total of 180 observations.

The names of each variables is provided below
 
"tBodyAcc_mean_X"          
"tBodyAcc_mean_Y"  
"tBodyAcc_mean_Z"  
"tBodyAcc_std_X"  
"tBodyAcc_std_Y"  
"tBodyAcc_std_Z"  
"tGravityAcc_mean_X"         
"tGravityAcc_mean_Y"  
"tGravityAcc_mean_Z"  
"tGravityAcc_std_X"        
"tGravityAcc_std_Y"   
"tGravityAcc_std_Z"      
"tBodyAccJerk_mean_X"      
"tBodyAccJerk_mean_Y"   
"tBodyAccJerk_mean_Z"    
"tBodyAccJerk_std_X"       
"tBodyAccJerk_std_Y"    
"tBodyAccJerk_std_Z"   
"tBodyGyro_mean_X"         
"tBodyGyro_mean_Y"     
"tBodyGyro_mean_Z"     
"tBodyGyro_std_X"          
"tBodyGyro_std_Y"   
"tBodyGyro_std_Z"      
"tBodyGyroJerk_mean_X"     
"tBodyGyroJerk_mean_Y"    
"tBodyGyroJerk_mean_Z"    
"tBodyGyroJerk_std_X"      
"tBodyGyroJerk_std_Y"   
"tBodyGyroJerk_std_Z"     
"tBodyAccMag_mean"         
"tBodyAccMag_std"      
"tGravityAccMag_mean"   
"tGravityAccMag_std"       
"tBodyAccJerkMag_mean"   
"tBodyAccJerkMag_std"   
"tBodyGyroMag_mean"        
"tBodyGyroMag_std"    
"tBodyGyroJerkMag_mean"   
"tBodyGyroJerkMag_std"     
"fBodyAcc_mean_X"       
"fBodyAcc_mean_Y"      
"fBodyAcc_mean_Z"          
"fBodyAcc_std_X"     
"fBodyAcc_std_Y"     
"fBodyAcc_std_Z"           
"fBodyAccJerk_mean_X"    
"fBodyAccJerk_mean_Y"   
"fBodyAccJerk_mean_Z"      
"fBodyAccJerk_std_X"   
"fBodyAccJerk_std_Y"    
"fBodyAccJerk_std_Z"       
"fBodyGyro_mean_X"     
"fBodyGyro_mean_Y"     
"fBodyGyro_mean_Z"         
"fBodyGyro_std_X"      
"fBodyGyro_std_Y"      
"fBodyGyro_std_Z"          
"fBodyAccMag_mean"    
"fBodyAccMag_std"       
"fBodyBodyAccJerkMag_mean"  
"fBodyBodyAccJerkMag_std"  
"fBodyBodyGyroMag_mean"   
"fBodyBodyGyroMag_std"     
"fBodyBodyGyroJerkMag_mean"  
"fBodyBodyGyroJerkMag_std" 