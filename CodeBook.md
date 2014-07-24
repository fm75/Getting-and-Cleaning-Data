This is a record of activities for the Getting and Cleaning Data project.

Acquistion of data:
 
  1) Downloaded  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
  2) using download_project_files.R

  3) unzipped the file using unzip.

  4) Renamed directory (using mv) to: UCI_Dataset

  5) See README.txt in UCI_Dataset for a description of the data collected.

You should create one R script called run_analysis.R that does the following.
 
  1) Merges the training and the test sets to create one data set.

    a) Use mergeSets function.

  2) Extracts only the measurements on the mean and standard deviation for each measurement. 

    a) Use summarizeStats function.

  3) Uses descriptive activity names to name the activities in the data set

    a) Uses renameActivities function.

  4) Appropriately labels the data set with descriptive variable names.
 
    a) Uses labelData function.

  5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

    a) Uses createTidyDataset function.


Notes:

