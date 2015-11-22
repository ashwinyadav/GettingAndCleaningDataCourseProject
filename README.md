# GettingAndCleaningDataCourseProject
The repo contains three files - the Codebook, the R Script and the final tidy data set (uci_har_tidy_dataset.txt)

## The Codebook
The Codebook describes the original raw dataset and the final tidy data set and specifically the variables selected and transformations applied to the readings

## The R Script
### run_analysis.R

The script is self explanatory and works through the process of generating the tidy data set as required by the project briefing:
STEP 1: Load the entire feature set from features.txt - 561 features
STEP 2: Load and Transform the Test Data Set
	- load the test values across the 561 features from the ./test/X_test.txt file 
	- load the subject IDs from the corresponding subject_test.txt file
	- load the activity IDs from ./test/y_test.txt and convert the same to a factor variable with the following factors ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
	- create the final test data set by cbind-ing th above three
STEP 3: Repeat above steps for the Training Data Set
STEP 4: Merge the two data sets
STEP 5: Retain only those measurements which correspond to mean and standard deviation measurements
STEP 6: Rename variable names per methodology explained in the Codebook in a flexible and easily modifiable manner
STEP 7: Arrange and group the final data arrived at so far by Subject ID and Activity
STEP 8: Use the summarize_each function to summarize the 10299 observations to 180 observations comprising the average value across all selected variables for 30 subjects across 6 activities

