#loading libraries
require(dplyr)
require(tidyr)

#defining function to read and merge several pairs of files and to store them
#in appropiate variables
f <- function(X, Y) {
  dataX = read.delim(
    X,
    header = FALSE,
    sep = "",
    strip.white = TRUE,
    colClasses = "numeric"
  )
  dataY = read.delim(
    X,
    header = FALSE,
    sep = "",
    strip.white = TRUE,
    colClasses = "numeric"
  )
  varname = sub('(?:.+/)(.+)(?:_test.+)', "\\1", X)
  assign(varname, rbind(dataX, dataY), envir = .GlobalEnv)
}

#reading file with activity labels
activity_labels <-
  read.delim("UCI HAR Dataset\\activity_labels.txt",
             header = FALSE,
             sep = " ")
#reading file with feature labels
features <-
  read.delim("UCI HAR Dataset\\features.txt",
             header = FALSE,
             sep = " ")
#get paths and names of all test files
testfiles <-
  list.files("UCI HAR Dataset/test",
             pattern = "*.txt",
             full.names = TRUE)
#get paths and names of all train files
trainfiles <-
  list.files("UCI HAR Dataset/train",
             pattern = "*.txt",
             full.names = TRUE)

#calling custom function to read and merge every pair of files
#and store them in separate variables
invisible(mapply(f, X = testfiles, Y = trainfiles))

#identifying variables that include "mean" or "std" in the name
selection <-
  features %>%
  filter(grepl("mean\\(|std\\(", V2))
#selecting only the variables related to the mean or standard deviation
data <- X %>%
  select(pull(selection, V1))

#adding the corresponding label to each activity
activity <-
  left_join(y, activity_labels, by = 'V1') %>%
  pull(V2)

#renaming each variable with descriptive labels
colnames(data) <- pull(selection, V2)
#adding the subject and activity for each window sample
data <- cbind(subject, activity, data) %>% rename("subject" = V1)

#grouping the data by subject and activity, taking the mean for each group
tidydata <-
  data %>%
  group_by(subject, activity) %>%
  summarise_all(mean, na.rm = TRUE)

write.table(tidydata, "tidydata.txt", row.name = FALSE)
