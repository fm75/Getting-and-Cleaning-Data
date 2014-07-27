Code Book for Getting and Cleaning Data Course
==============================================
- This book is in **two sections**. 
- The first section repeats the description provided by the source.
- The second section describes the data after processing the source. 
- *Nothing was done with any of the inertial data.*


Section 1 - Original Code Book
------------------------------
**For each record it is provided:**

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

**The dataset includes the following files:**
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

**Notes:** 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.



Section 2 - Code Book for Getting and Cleaning Data
---------------------------------------------------
**Organization** 

/ (repo root directory)
- Codebook.md - this file
- README.md - description of work
- download_project_files.R - used to download the source data


/UCI_Dataset
- investigate.R - Initial check to confirm the content matches the description of the source data.
- mergeTextFiles.R - Used to merge the /test, /train files into one file
- **run_analysis.R - merge, name activities, relable measurements, aggregate, and reshape into a tidy data set.**

- /test - unzipped test files from the source 
- /train - unzipped train files from the source
- allmerged.txt - merged data table with activity, subject, variables
- smallmerged.txt - a very small subset of allmerged.txt (first four rows)

- **tidy_means.txt - The target independent data set for the project.**