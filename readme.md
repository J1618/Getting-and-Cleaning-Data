#loading libraries #defining function to read and merge several pairs of files and to store them #in appropiate variables #reading file with activity labels #reading file with feature labels #get paths and names of all test files #get paths and names of all train files #calling custom function to read and merge every pair of files #and store them in separate variables #identifying variables that include "mean" or "std" in the name #selecting only the variables related to the mean or standard deviation #adding the corresponding label to each activity #renaming each variable with descriptive labels #adding the subject and activity for each window sample #grouping the data by subject and activity, taking the mean for each group