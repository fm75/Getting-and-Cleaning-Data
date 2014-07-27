# Project for Getting and Cleaning Data

source ('mergeTextFiles.R')
source ('mergeTextFiles.R')


# Use this on features.txt to select the columns with
# "-std" and "-mean" in the name. There are some other things
# with mean, for example, as part of the name, but they appear
# to describe comparisons to a mean.

library ('car')
library ('reshape')

selectColumns <- function (filename)
  {
  # return a dataset with the column number and an ugly name
  features <- read.table (filename)
  meanColumns <- grep ('-mean', features$V2)
  stdColumns  <- grep ('-std',  features$V2)

  selectedColumns <- c (meanColumns, stdColumns)
  features [selectedColumns,]
  }

retitle <- function (colnames)
  {
  # construct the column names for the combined data set
  renames <- matrix (c (
                       'Body',   '_body',
                       'Grav',   '_grav',
                       'Gyro',   '_gyro',
                       'Acc',    '_accelerometer',
                       'Jerk',   '_jerk',
                       'Mag',    '_mag',
                       'Freq()', '_frequency',
                       'mean()', '_mean',
                       'std()',  '_stddev',
                       '-',      '_',
                       '__',     '_',
                       '[()]',   '',
                       ' axis',  '-axis',
                       '_',      ' '
                       ), 
                     byrow=TRUE,
                     ncol=2)



  colnames <- gsub ('^f', 'frequency_', colnames)
  colnames <- gsub ('^t', 'time_', colnames)
  colnames <- gsub ('([XYZ])$', "\\1 axis", colnames)
  for (i in 1:nrow (renames))
    {
    colnames <- gsub (renames[i,1], renames[i,2], colnames)
    }
  c ('activity', 'subject', colnames)
  }

getActivityNames <- function (filename)
  {
  # this was used interactively
  # TODO a nice refinement would be to construct and return the
  # code (string) used by renameActivity below
  x <- read.table (filename)
  x$V2 <- tolower (x$V2)
  x
  }

renameActivity <- function (x)
  {
  # TODO - see the notes in getActivityNames ...
  # Leaving this for now, due to time constraints
  code = "1='walking';2='walking_upstairs';3='walking_downstairs';4='sitting';5='standing';6='laying';else='unknown_measurement'"
  x$Activity<-recode(x$Activity,code)
  x
  }
  
aggregateMeasurements <- function (df)
  {
  df [, 3:81] <- sapply (df [, 3:81], as.numeric)
  aggregated <- aggregate (df, 
                           by = list(df$Subject, df$Activity), 
                           FUN = mean, 
                           na.action = na.omit)
  aggregated
  }

  
# combine subject, activity, and filtered measurement files and
# merge test and train data
merged <- mergeTextFiles  ()
merged <- renameActivity (merged)
print (head (merged))
merged <- aggregateMeasurements (merged)

tidy <- melt (merged, id = c ('Subject', 'Activity'))
print (dim(tidy))

write.table (tidy, 'tidy.txt')

