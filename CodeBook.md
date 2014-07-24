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

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

