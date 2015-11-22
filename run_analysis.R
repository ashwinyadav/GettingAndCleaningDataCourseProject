## Tidy Data Set Course Project
## Script assumes that the zip file has been downloaded and unpacked into a directory called UCI HAR Dataset that is in your working directory and the default structure of this unpacked directory has not been altered

library(dplyr)
library(data.table)


## Load and prepare Features - Variable Names
features <- unlist(select(fread("./UCI HAR Dataset/features.txt"), 2), use.names = FALSE)

## Load and prepare test data
## load test values across 561 features
test.values <- fread("./UCI HAR Dataset/test/X_test.txt", col.names = features)

## load test subjects
test.subjects <- fread("./UCI HAR Dataset/test/subject_test.txt", col.names = c("Subject"))

## Load training labels and convert to descriptive factor
Activity <- factor(unlist(fread("./UCI HAR Dataset/test/y_test.txt", col.names = c("Activity"))), 1:6, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

## create test dataset by binding
test.data <- cbind(test.subjects, Activity, test.values)

## Load and prepare training data
## load training values across 561 features
train.values <- fread("./UCI HAR Dataset/train/X_train.txt", col.names = features)

## load training subjects
train.subjects <- fread("./UCI HAR Dataset/train/subject_train.txt", col.names = c("Subject"))

## Load training labels and convert to descriptive factor
Activity <- factor(unlist(fread("./UCI HAR Dataset/train/y_train.txt", col.names = c("Activity"))), 1:6, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

## create training dataset by binding
train.data <- cbind(train.subjects, Activity, train.values)

## merge datasets
merged.data <- rbind(test.data, train.data)

## extract only mean and sd measurements

meanstd.data <- merged.data %>%
	select(Subject, Activity, matches('mean|std')) %>%
	select(-matches('meanFreq|angle'))

## Clean up variable names
## Haven't split up the truncated form of words like Acc and Gyro to strike a balance between being descriptive and not having really long variable names. Can be modified here if needed.

relevant.features <- names(meanstd.data)
names.split <- strsplit(relevant.features, "-")
relevant.features.renamed <- vector(mode = "character", length = length(names.split))

for (i in 3:length(names.split)) {
	if (substr(names.split[[i]][1], 1, 1) == "t") {
		str1 <- "time"
	} else {
		str1 <- "freq"
	}
	str2 <- substr(names.split[[i]][1], 2, nchar(names.split[[i]][1]))
	if (names.split[[i]][2] == "mean()") {
		type <- "mean"
	} else {
		type <- "stddev"
	}
	if (!is.na(names.split[[i]][3])) {
		relevant.features.renamed[i] <- paste(type,str2,names.split[[i]][3],str1, sep = "_")
	} else {
		relevant.features.renamed[i] <- paste(type,str2,str1, sep = "_")
	}
}
relevant.features.renamed[1] <- "subject_ID"
relevant.features.renamed[2] <- "activity_type"

setnames(meanstd.data, old = relevant.features, new = relevant.features.renamed)

## arrange by subject_ID and activity type
meanstd.data <- arrange(meanstd.data, subject_ID, activity_type)

## Group by Subject and Activity

grouped.meanstd.data <- meanstd.data %>%
	group_by(subject_ID, activity_type)
	
final.data <- summarize_each(grouped.meanstd.data, funs(mean))


## write tidy data set

write.table(final.data, file = "uci_har_tidy_dataset.txt", row.names = FALSE)
