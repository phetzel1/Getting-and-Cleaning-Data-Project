Getting-and-Cleaning-Data-Project
=================================
##Overview
The following R script (run_analysis.R) follows the prompt given by the Getting and Cleaning Data course project.  Variable specifics and definitions can be found in the Codebook.  By running the script, the user will generate the mean values for every feature, grouped by both subject and activity.

##Technical Summary
The single script does all of the following: <br>
  1: Downloads the source data <br>
  2: Names the source data columns using the features.txt file<br>
  3: Merges the source data with the subject and activity columns<br>
  4: Combines the training and test datasets<br>
  5: Extracts the column indices of mean and std columns<br>
  6: Trims the dataset based on the column indices from step 5<br>
  7: Applies a factor to the Activity column<br>
  8: Lengthens the dataset using melt, grouping by Subject and Activity<br>
  9: Casts the mean function over the data frame from step 8<br>
  10: Lengthens the data frame from step 9 using melt<br>
  11: Writes the dataset to a txt file<br>
<br>
##Data Inputs:<br>
  a. X_test.txt<br>
  b. Y_test.txt<br>
  c. subject_test.txt<br>
  d. X_train.txt<br>
  e. Y_train.txt<br>
  f. subject_train.txt<br>
  g. features.txt<br>
##Data Ouputs:<br>
  a. Average by Subject and Activity.txt
