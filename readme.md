# Getting and Cleaning Data Course Project

### Jonathan Poblete

In this project we prepare tidy data from raw data related to wearable gadgets recorded with a Samsung Galaxy S II smartphone.  

The data was obtained from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>, a full description of it is available at <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 

The original data was separated in two sets for training and testing a machine learning model, in this project the training and test sets are merged, the variables related to the mean and standard deviation for each measure are extracted, the activity and variable codes are replaced with descriptive names, a tidy data set with the average of each variable for each activity for each subject is created and saved as a text file.

## Files included:

-   UCI HAR Dataset\
    Folder containing the original data split in training and testing sets.
-   run_analysis.R\
    R script that processes the data.
-   tidydata.txt\
    Text file with the output of the script, which can be read into R with the command 'read.table("tidydata.txt", header=TRUE)'.
-   readme.md
-   codebook.md\
    File with descriptions for every variable included in the tidy data set.
