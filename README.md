The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 

1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or 
   work that you    performed to clean up the data called CodeBook.md.
4) You should also include a README.md in the repo with your scripts. 

This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
Good luck!

Let's look at the test and training directories using *nix (Mac in my case) shell commands.
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
wc -l */*.txt
    2947 test/X_test.txt
    2947 test/subject_test.txt
    2947 test/y_test.txt
    7352 train/X_train.txt
    7352 train/subject_train.txt
    7352 train/y_train.txt
   30897 total

The text files in /train all have 7352 lines.
The text files in /test  all have 2947 lines

Let's confirm that they can be the test and train files can be joined 'row-wise'
and that it would then be reasonable to merge the joined files.

> source ('investigate.R')
test
dim   (test/X_test.txt) 2947 561
dim   (test/y_test.txt) 2947 1
table (test/y_test.txt)
dt
  1   2   3   4   5   6 
496 471 420 491 532 537 

dim   (test/subject_test.txt) 2947 1
table (test/subject_test.txt)
dt
  2   4   9  10  12  13  18  20  24 
302 317 288 294 320 327 364 354 381 


==============================

train
dim   (train/X_train.txt) 7352 561
dim   (train/y_train.txt) 7352 1
table (train/y_train.txt)
dt
   1    2    3    4    5    6 
1226 1073  986 1286 1374 1407 

dim   (train/subject_train.txt) 7352 1
table (train/subject_train.txt)
dt
  1   3   5   6   7   8  11  14  15  16  17  19  21  22  23  25  26  27  28  29 
347 341 302 325 308 281 316 323 328 366 368 360 408 321 372 409 392 376 382 344 
 30 
383 


==============================

>

The two files have no intersection (by inspection) of the values, 
and they correspond to the values that the users are supposed to have.
They also agree with the reported 30/70 percent split of the subjects.
Each set has the same number of lines and the X_test.txt files each have the expected
row size.

Joining them on "row id" should be safe. Then merging should be as well.

> source ('mergeTextFiles.R')
[1] "Starting test"
[1] 2947  563
[1] "Starting train"
[1] 7352  563

Each has the expected number of rows and two more columns.

wc -l */*.txt
    2947 test/X_test.txt
    2948 test/merged.txt
    2947 test/subject_test.txt
    2947 test/y_test.txt
    7352 train/X_train.txt
    7353 train/merged.txt
    7352 train/subject_train.txt
    7352 train/y_train.txt
   41198 total

The merged files have a one extra line for the column headings. They should have
a row label as well.

new-host-4:UCI_Dataset fred$ head -10 train/merged.txt |tail -9 | cut -c1-18
"1" 5 1 0.28858451
"2" 5 1 0.27841883
"3" 5 1 0.27965306
"4" 5 1 0.27917394
"5" 5 1 0.27662877
"6" 5 1 0.27719877
"7" 5 1 0.27945388
"8" 5 1 0.27743247
"9" 5 1 0.27729342
new-host-4:UCI_Dataset fred$ head -10 test/merged.txt |tail -9 | cut -c1-18
"1" 5 2 0.25717778
"2" 5 2 0.28602671
"3" 5 2 0.27548482
"4" 5 2 0.27029822
"5" 5 2 0.27483295
"6" 5 2 0.27921995
"7" 5 2 0.27974586
"8" 5 2 0.27460055
"9" 5 2 0.27252874

Now we just need to create a file from test, with the train file, less the first line
appended to it.

cat test/merged.txt > allmerged.txt
tail -n +2 train/merged.txt >> allmerged.txt

wc -l allmerged.txt
   10300 allmerged.txt

10300 = 2948 + 7353 - 1

We could have added an additional column to source the test and train data sets,
so that post appending we can tell which was which. It does not appear that we
have any requirement to do that here. We can modify the mergeTextFile.R program
simply enough by just adding a column with the "folder" name if we wanted to do that.


