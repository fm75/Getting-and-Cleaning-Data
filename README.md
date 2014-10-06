Activities Performed on this project
==


**Acquistion of data:** 

- Downloaded https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip using download_project_files.R
- unzipped the file using unzip.
- Renamed zip directory (using mv) to: **UCI_Dataset** (see it in repo)
- Examined the data to plan for cleaning and processing
- Created and ran run_analysis.R
- Committed UCI_Dataset/tidy_means.txt to github
- Except for the program to download the source data, all programs and text are in the UCI_Dataset directory



**Notes:**

> wc -l \*/\*.txt

>      2947 test/X_test.txt
>      2947 test/subject_test.txt
>      2947 test/y_test.txt
>      7352 train/X_train.txt
>      7352 train/subject_train.txt
>      7352 train/y_train.txt
>     30897 total

>     The text files in /train all have 7352 lines.
>     The text files in /test  all have 2947 lines

>     Let's confirm that they can be the test and train files can be joined 'row-wise'
      and that it would then be reasonable to merge the joined files.

>     source ('investigate.R')
>     test
>     dim   (test/X_test.txt) 2947 561
>     dim   (test/y_test.txt) 2947 1
>     table (test/y_test.txt)
>     dt
>       1   2   3   4   5   6 
>     496 471 420 491 532 537 

>     dim   (test/subject_test.txt) 2947 1
>     table (test/subject_test.txt)
>     dt
>       2   4   9  10  12  13  18  20  24 
>     302 317 288 294 320 327 364 354 381 


==============================
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/fm75/Getting-and-Cleaning-Data?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

>    train

>    dim   (train/X_train.txt) 7352 561

>    dim   (train/y_train.txt) 7352 1

>    table (train/y_train.txt)
>    dt
>       1    2    3    4    5    6 
>    1226 1073  986 1286 1374 1407 

>    dim   (train/subject_train.txt) 7352 1

>    table (train/subject_train.txt)

>    dt

>       1   3   5   6   7   8  11  14  15  16  17  19  21  22  23  25  26  27  28  29
>     347 341 302 325 308 281 316 323 328 366 368 360 408 321 372 409 392 376 382 344 
>      30 
>     383 




The two files have no intersection (by inspection) of the values, 
and they correspond to the values that the users are supposed to have.
They also agree with the reported 30/70 percent split of the subjects.
Each set has the same number of lines and the X_test.txt files each have the expected
row size.

Joining them on "row id" should be safe. Then merging should be as well.

> source ('mergeTextFiles.R')

>    [1] "Starting test"

>    [1] 2947  563

>    [1] "Starting train"

>    [1] 7352  563

Each has the expected number of rows and two more columns.

>    wc -l \*/\*.txt

>        2947 test/X_test.txt
>        2948 test/merged.txt
>        2947 test/subject_test.txt
>        2947 test/y_test.txt
>        7352 train/X_train.txt
>        7353 train/merged.txt
>        7352 train/subject_train.txt
>        7352 train/y_train.txt
>       41198 total


The merged files have a one extra line for the column headings. They should have
a row label as well.




