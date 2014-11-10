Feature Selection 
=================
##Data Description
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
###Variables
tBodyAcc-XYZ<br>
tGravityAcc-XYZ<br>
tBodyAccJerk-XYZ<br>
tBodyGyro-XYZ<br>
tBodyGyroJerk-XYZ<br>
tBodyAccMag<br>
tGravityAccMag<br>
tBodyAccJerkMag<br>
tBodyGyroMag<br>
tBodyGyroJerkMag<br>
fBodyAcc-XYZ<br>
fBodyAccJerk-XYZ<br>
fBodyGyro-XYZ<br>
fBodyAccMag<br>
fBodyAccJerkMag<br>
fBodyGyroMag<br>
fBodyGyroJerkMag<br>
<br>
The relevant measures for the features are the two following figures:<br>

mean(): Mean value<br>
std(): Standard deviation<br>

###Data Transformation
Both the train and test data sets were tranformed in the same fashion.  The files were downloaded, along with the features.txt file, which acted as the column names.
Both datasets were independently merged with the relevent subject and activity information, then combined using rbind.
Mean and std columsn were separated out by applying a combination of the grepl and which functions, which generated the relevent indices
The script adds back in the indices for subject and activity, and applies those indices to subset the combined dataset
The subsetted data frame was melted using Subject and Activity as the grouping variables, then dcast was used to apply the mean function
The resulting dataset was melted again by Subject and Activity and written to the output file.

###Ouput
The output file is named Average by Subject and Activity.txt.  It shows the mean value of the mean and std measures for each features, grouped by Activity and Subject
