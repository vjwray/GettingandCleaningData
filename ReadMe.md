ReadMe - run_analysis.R
========================================================
Introduction
--------------------------------------------------------
The following will provide configuration, installation, and operating
instructions for using the script run_analysis.R to create a tidy data
set from the Human Activity Recognition Using Smartphones Dataset
Version 1.0

The resulting tidy data is an average values for each 
of 66 variables for each of six
activities for 30 volunteers captured while carrying a waist-mounted
smartphone with embedded inertial sensors.
For further details on the original data set see README.txt provided
within the zip file outlined below.

This application was completed as part of the Coursera course Getting
and Cleaning Data course project.

June 21, 2014  
Van Wray

Configuration Instructions
--------------------------------------------------------------------
### Presumptions on R
The file run_analysis.R was successfully tested using R Studio
Version 0.98.507 running on a Mac OS X 10.6.8.

The R Version is 3.1.0 (2014-04-10) and this version or later is
anticipated to be necessary to successfully run the script.

### R Packages
Beyond the base install the following packages are commonly installed and listed
for reference. Note these are required for run_analysis.R
* package:pylr
* package:reshape2

Installation Instructions
--------------------------------------------------------------------
### Smartphone Dataset & R Script
A description of the data set is available at the site of the UCI Machine
Learning Repository, the site where the data is available. Located here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

A zipfile containing the required folder "UCI HAR Dataset" is located here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The run_analysis.R file is located on a public github directory, along with this ReadMe.md file, is located here:

https://github.com/vjwray/GettingandCleaningData

### File installation
**Download the "UCI HAR Dataset.zip" file and uncompress the zip file.**

A folder named "UCI HAR Dataset" will be created with the following structure
* UCI HAR Dataset
  * activity_labels.txt
  * features_info.txt
  * features.txt
  * README.txt
  * test
     * Inertial Signals (note folder not used)
     * subject_text.txt
     * X_test.txt
     * y_test.txt
  * train
     * Inertial Signals (note folder not used)
     * subject_train.txt
     * X_train.txt
     * y_train.txt
     
**Download the R script "run_analysis.R" from github repository**

The "run_analysis.R" script should be located in the same directory as the 
uncompressed folder completed in step 1. of the installation. 

A directory should contain the following after steps 1 & 2.
* UCI HAR Dataset
* run_analysis.R

Operating Instructions
-----------------------------------------------------------------
### Set working work directory
**Set the working directory to the directory containing the
"run_analysis.R"" file and the "UCI HAR Dataset" folder.**

*setting the correct working directory is required for the script to work*
  
### Open and Run Script
**Open the "run_analysis.R"" and execute the script**  
The script will open and load
data files from within the "UCI HAR Dataset" folder.

### Output
The file *tidydatadf.txt* will be created as a result of executing the script in
the current working directory.

The file size is estimated to be roughly 225Kb. For further explanation of the 
contents of the file please read the CodeBook.md file.

Processing Description
------------------------------------------------------------------
The following describes the major activites of the "run_analysis.R" script.

### Major processing activity

* Load two files describing activity values and feature names from root folder
* Load all of the "./UCI HAR Dataset/test/" files
* Load all of the "./UCI HAR Dataset/train/" files 
* Create data frames to hold train and test data
* Convert `ytrainlabels` and `ytestlables` to factors loaded from the test and train files
* Change factor levels for `ytrainlabels` and `ytestlables` to activity names
* Combine the activities for the test and train data sets
* Combine the subjects for the test and train data sets
* Combine the train and test data frames together into `traintestdf`
* Select all columns with mean() and std() - total 66
* Remove columns not related to mean() and std() from `traintestdf`
* Add column for activity to `traintestdf`
* Add column for subject to `traintestdf`
* Create a `labels` vector to hold original column names of `traintestdf`
* Update `labels` with valid column names using custom function `fixlabel()`
* Replace the column names of `traintestdf` with fixed lables `labels`
* Melt combined train and test data set `traintestdf` to `meltdf`
* Use dcast to create a tidy data `tidydatadf` from `meltdf`
* Write `tidydatadf` to the file `tidydatadf.txt`

### Further explanation

#### Select all columns with mean() and std() - total 66
Please review the file "features_info.txt" for more detailed description of the 
values captured in the original data set. The following description applies to both
the train and test data. The signal values and variables estimated from signal
values were identical for both test and train sets.

The data was composed of signal values and "a set of variables that were 
estimated from these signals". The set of variables that were estimated is provided
in a list in "features_info.txt". The first two estimated variables were  
mean(): Mean value  
std(): Standard Deviation  
It is these two estimated variables for each signal that is being gathered into
the `traintestdf` data frame. This is accomplished by evaluating original
column names for strings in the name that coorespond to these two forms of
estimated variables. Specifically the strings "mean()" and "std()".  
This approach knowingly does not include some other columns with the text "mean"
because they are determined to *not* be mean and standard deviation values
estimated from the *original* signal values but other types of calcuations.  
The total number variables cooresponding to this approach is 66 from a total of 561.

#### Update `labels` with valid column names using custom function `fixlabel()`
The variable names for the original data values where corrected to make them 
more *readable*.

Readable was determined to be achieved by striving to accomplish two goals
* Make the variable names readable by R
* Make the variable names readable by people.

To accomplish making the names readable by R the CRAN documentation specifications
for valid names was consulted at http://cran.r-project.org/doc/FAQ/R-FAQ.html#What-are-valid-names_003f and clearly states:
> It consists of letters, numbers, and the dot and (for versions of R 
> at least 1.9.0) underscore characters, and starts with either a letter or a 
> dot not followed by a number.

A special function `fixlabel()` was created to achieve the specification
described above.

To accomplish making the variables readable by people it was determined that to
be readable is to be understandable. To be understood the variable names needed
to be easily referenceable to the "UCI HAR Dataset" documentation provided in
the "README.txt" and "features_info.txt" as examples. So the changes only 
changes performed were to make the variable names readable by R.

To change variables in such a form to make them challenging to reference to
the original documentation was considered to make them "less descriptive".

#### Use dcast to create a tidy data `tidydatadf` from `meltdf`

The final tidy data `tidydatadf` is 180 observations of 68 variables. This
tidy data is considered a "wide" data set. The first two columns are the
subject and activity. There were a total of 30 subjects doing 6 activities.
So each subject has 6 observations, one for each activity, a total then of 180.
The remaining 66 columns hold the calculated average of the selected mean() and
std() measures. See above for a description of this selection.

Please see the pinned forum topic "Long Data, Wide Data, and Tidy Data for
assignment" written by community TA David Hood for further explanation of
why this approach to the "wide" final data set is consider *tidy*. The article
is located here: https://class.coursera.org/getdata-004/forum/thread?thread_id=262

Credits and Acknowledgements
--------------------------------------------------------------------------
I'd like to personally thank Coursera community TA David Hood for multiple
articles in the Coursera forum to explain the requirements for this assignment
in much more understandable terms. I'd also like to thank my fellow classmates
who provided extremely valuable discussion points in the forum.