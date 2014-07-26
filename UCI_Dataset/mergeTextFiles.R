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

folders = c ('test', 'train')

for (f in folders)
  {
  print (paste0 ('Starting ', f))
  subject <- read.table (paste0 (f, '/subject_', f, '.txt'))
  x       <- read.table (paste0 (f, '/X_',       f, '.txt'))
  y       <- read.table (paste0 (f, '/y_',       f, '.txt'))
  merged  <- data.frame (y, subject, x)
  print (dim (merged))
  write.table (merged, paste0 (f, '/merged.txt'))
  }
