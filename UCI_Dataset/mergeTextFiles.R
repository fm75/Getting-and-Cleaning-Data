# investigate the test and training sets.

# Merge the data files (.txt) in the test and train folders.

## wc -l */*.txt
##     2947 test/X_test.txt
##     2947 test/subject_test.txt
##     2947 test/y_test.txt
##     7352 train/X_train.txt
##     7352 train/subject_train.txt
##     7352 train/y_train.txt
##    30897 total

selectColumns <- function (filename)
  {
  # return a dataset with the column number and an ugly name
  features <- read.table (filename)
  meanColumns <- grep ('-mean', features$V2)
  stdColumns  <- grep ('-std',  features$V2)

  selectedColumns <- c (meanColumns, stdColumns)
  features [selectedColumns,]
  }

mergeTextFiles <- function ()
  {
  selection <- selectColumns ('features.txt')

  df <- data.frame ()
  folders = c ('test', 'train')
  
  for (f in folders)
    {
    print (paste0 ('Starting ', f))
    subject <- read.table (paste0 (f, '/subject_', f, '.txt'))
    x       <- read.table (paste0 (f, '/X_',       f, '.txt'))
    y       <- read.table (paste0 (f, '/y_',       f, '.txt'))

    # filter x (measurements) to what we want.
    x       <- x [, selection$V1]
   
    # Title the dataframes
    colnames (subject) <- 'Subject'
    colnames (y)       <- 'Activity'
    colnames (x)       <- selection$V2


    merged  <- data.frame (subject, y, x)
    write.table (merged, paste0 (f, '/merged.txt'))
    df <- rbind (df, merged)
    }
  #print (class(df))
  #print (dim(df))
  df
  }

#mergeTextFiles ()
