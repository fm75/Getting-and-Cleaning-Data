# investigate the test and training sets.

# We want to understand the data files (.txt) in the test and train folders.

## wc -l */*.txt
##     2947 test/X_test.txt
##     2947 test/subject_test.txt
##     2947 test/y_test.txt
##     7352 train/X_train.txt
##     7352 train/subject_train.txt
##     7352 train/y_train.txt
##    30897 total

# we will use these to loop through the datasets
folders = c ('test', 'train')
names   = c ('X_', 'y_', 'subject_')

for (f in folders)
  {
  cat (f); cat ('\n')
  for (n in names)
    {
    # construct the filename and read it as a table
    fname <- paste0 (f , '/', n, f, '.txt')
    dt <- read.table (fname)

    cat (paste0 ('dim   (', fname, ') '))
    cat (dim (dt))
    cat ('\n')
    
    # display the single column value tables
    if (n != 'X_')
      {
      cat (paste0 ('table (', fname, ')')); cat ('\n')
      print (table (dt))
      cat ('\n')
      }
    }
  cat ('\n=============================='); cat ('\n\n')
  }
