---
title: "UCI HAR DataSet Codebook"
author: "Ashwin"
date: "November, 2014"
output:
  html_document:
    keep_md: yes
---

## Project Description
As per the requirements of the course project of the coursera course Getting and Cleaning Data, this project involved the sourcing and cleaning of data related to measurements from wearable tech from UCI

##Study design and data processing
The project did not involve study design, but only the creation of a tidy data set per instructions from the available UCI date

###Collection of the raw data
Raw Data was provided through a downloadable ZIP file containing the required raw data and legend files.

###Notes on the original (raw) data 
The original raw data is as available on UCI and as provided in the course project description. Broadly, the original dataset consisting of 10299 observations of data across 30 subjects, 6 different activity types and 561 different observations. 
Broadly, the data consisted of the following signals:
 - tBodyAcc-XYZ
 - tGravityAcc-XYZ
 - tBodyAccJerk-XYZ
 - tBodyGyro-XYZ
 - tBodyGyroJerk-XYZ
 - tBodyAccMag
 - tGravityAccMag
 - tBodyAccJerkMag
 - tBodyGyroMag
 - tBodyGyroJerkMag
 - fBodyAcc-XYZ
 - fBodyAccJerk-XYZ
 - fBodyGyro-XYZ
 - fBodyAccMag
 - fBodyAccJerkMag
 - fBodyGyroMag
 - fBodyGyroJerkMag

The measures available on the above signals were: 

 - mean(): Mean value
 - std(): Standard deviation
 - mad(): Median absolute deviation 
 - max(): Largest value in array
 - min(): Smallest value in array
 - sma(): Signal magnitude area
 - energy(): Energy measure. Sum of the squares divided by the number of values. 
 - iqr(): Interquartile range 
 - entropy(): Signal entropy
 - arCoeff(): Autorregresion coefficients with Burg order equal to 4
 - correlation(): correlation coefficient between two signals
 - maxInds(): index of the frequency component with largest magnitude
 - meanFreq(): Weighted average of the frequency components to obtain a mean frequency
 - skewness(): skewness of the frequency domain signal 
 - kurtosis(): kurtosis of the frequency domain signal 
 - bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
 - angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

 - gravityMean
 - tBodyAccMean
 - tBodyAccJerkMean
- tBodyGyroMean
 - tBodyGyroJerkMean
 
##Creating the tidy datafile
As per the instructions of the project, the final variables picked were those where measures on mean and standard deviation were available. 
(meanFreq and anlgle measures were eliminated)

###Guide to create the tidy data file
Broadly, the steps to creating the tidy data file include: 
 - creating a list of features from the features file to understand and label the 561 measures
 - separately load the test and training data available in the UCI HAR Dataset
 - convert the activity type into a factor variable and insert the factor labels as per the key provided in the dataset
 - merge the two files (training and test) together to generat a combined master file.
 - as per the instructions of the project select only variables containing measurements of the mean and standard deviations. 
 - recast the variable names in a flexible manner to more meaningful names
 - rearrange the data by subject ID and activity type to create final data set of 180 observations (30 subjects * 6 activities)
 - these 180 observations consist of the mean of the means and standard deviations across multiple observations of the corresponding parameters in the raw data
 - write tidy data set into a new table "uci_har_tidy_dataset.txt" using standard separator of " "
  

###Cleaning of the data
see above and Readme.md

##List of  variables in the uci_har_tidy_dataset.txt file
[1] "subject_ID"                      "activity_type"                  
 [3] "mean_BodyAcc_X_time"             "mean_BodyAcc_Y_time"            
 [5] "mean_BodyAcc_Z_time"             "stddev_BodyAcc_X_time"          
 [7] "stddev_BodyAcc_Y_time"           "stddev_BodyAcc_Z_time"          
 [9] "mean_GravityAcc_X_time"          "mean_GravityAcc_Y_time"         
[11] "mean_GravityAcc_Z_time"          "stddev_GravityAcc_X_time"       
[13] "stddev_GravityAcc_Y_time"        "stddev_GravityAcc_Z_time"       
[15] "mean_BodyAccJerk_X_time"         "mean_BodyAccJerk_Y_time"        
[17] "mean_BodyAccJerk_Z_time"         "stddev_BodyAccJerk_X_time"      
[19] "stddev_BodyAccJerk_Y_time"       "stddev_BodyAccJerk_Z_time"      
[21] "mean_BodyGyro_X_time"            "mean_BodyGyro_Y_time"           
[23] "mean_BodyGyro_Z_time"            "stddev_BodyGyro_X_time"         
[25] "stddev_BodyGyro_Y_time"          "stddev_BodyGyro_Z_time"         
[27] "mean_BodyGyroJerk_X_time"        "mean_BodyGyroJerk_Y_time"       
[29] "mean_BodyGyroJerk_Z_time"        "stddev_BodyGyroJerk_X_time"     
[31] "stddev_BodyGyroJerk_Y_time"      "stddev_BodyGyroJerk_Z_time"     
[33] "mean_BodyAccMag_time"            "stddev_BodyAccMag_time"         
[35] "mean_GravityAccMag_time"         "stddev_GravityAccMag_time"      
[37] "mean_BodyAccJerkMag_time"        "stddev_BodyAccJerkMag_time"     
[39] "mean_BodyGyroMag_time"           "stddev_BodyGyroMag_time"        
[41] "mean_BodyGyroJerkMag_time"       "stddev_BodyGyroJerkMag_time"    
[43] "mean_BodyAcc_X_freq"             "mean_BodyAcc_Y_freq"            
[45] "mean_BodyAcc_Z_freq"             "stddev_BodyAcc_X_freq"          
[47] "stddev_BodyAcc_Y_freq"           "stddev_BodyAcc_Z_freq"          
[49] "mean_BodyAccJerk_X_freq"         "mean_BodyAccJerk_Y_freq"        
[51] "mean_BodyAccJerk_Z_freq"         "stddev_BodyAccJerk_X_freq"      
[53] "stddev_BodyAccJerk_Y_freq"       "stddev_BodyAccJerk_Z_freq"      
[55] "mean_BodyGyro_X_freq"            "mean_BodyGyro_Y_freq"           
[57] "mean_BodyGyro_Z_freq"            "stddev_BodyGyro_X_freq"         
[59] "stddev_BodyGyro_Y_freq"          "stddev_BodyGyro_Z_freq"         
[61] "mean_BodyAccMag_freq"            "stddev_BodyAccMag_freq"         
[63] "mean_BodyBodyAccJerkMag_freq"    "stddev_BodyBodyAccJerkMag_freq" 
[65] "mean_BodyBodyGyroMag_freq"       "stddev_BodyBodyGyroMag_freq"    
[67] "mean_BodyBodyGyroJerkMag_freq"   "stddev_BodyBodyGyroJerkMag_freq"

Brief Explanation of the variable renaming logic: 
- the first factor of the recast name mentions the kind of measurement - mean (mean) or standard deviations (stddev)
- the second factor of the recase name defines the measures - Body Accelaration (BodyAcc)/ Gravity Acceleration (Gravity_Acc), etc
- the third factor mentions the axis of measurement - X/Y/Z (where applicable)
- the fourth factor provides an indication of whether the measure is the time domain variable or a frequency domain variable (as determined by the application of a FFT as described in the raw data)




