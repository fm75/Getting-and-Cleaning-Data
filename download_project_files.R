downloadProjectFiles <- function (path)
  {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
  download.file (url, path, "curl")
  }

path <- "project_files.zip"

# download the data
downloadProjectFiles (path)
