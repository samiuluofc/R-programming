#############################################################################################
# Solution code for the Getting and Cleaning Data Course Project created.
# Coded by  : SAMIUL AZAM
# Date      : 13th Aug 2016.
# Please read the README.md and CodeBook.md first.
#############################################################################################


# Load the reshape library

library(reshape2)

# Loading necessary datasets from my project folder.

features <- read.table("UCI HAR Dataset/features.txt", quote="\"", comment.char="")
activity <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")


# Step 01 >>>>>>>>>>>>>>>>>
# Merging test and traning datasets (measurements, subject-numbers and activity labels) 
# into a single data frame. Also assign header to the merge_data frame.

X <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
s <- rbind(subject_train, subject_test)
merge_data <- cbind(X,s,y)
names(merge_data) <- c(as.character(features[,2]),"subject_No","activity")  

      
# Step 02 >>>>>>>>>>>>>>>>>
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Select those variables that have the word "mean" and "std" in their name. I also assign 
# header to the extract_data (added "subject_No" and "activity" column header).

variable_names <- features[,2]
selection <- grepl("mean",variable_names) | grepl("std",variable_names)
variable_names <- c(as.character(variable_names[selection]),"subject_No","activity")
extract_data <- merge_data[,c(selection,TRUE,TRUE)]

names(extract_data) <- variable_names # assigning variable names to the extract_data.


# Step 03 >>>>>>>>>>>>>>>>>
# Assigning descriptive activity names to name the activities in the extract_data set.

extract_data$activity <- factor(merge_data$activity, labels = activity[,2])


# Step 04 >>>>>>>>>>>>>>>>>
# Appropriately labels the data set with descriptive variable names. To make them descriptive, 
# I replaces most of the short keywords with the full words. For example, f is replaced with 
# the word frequency, t is replaced with the word time.

header <- names(extract_data)
header <- gsub("^f", "frequency", header)
header <- gsub("^t", "time", header)
header <- gsub("Acc", "Accelerometer", header)
header <- gsub("Gyro", "Gyroscope", header)
header <- gsub("Mag", "Magnitude", header)
header <- gsub("Jerk", "Jerking", header)
header <- gsub("BodyBody", "Body", header)
names(extract_data) <- header
View(extract_data)


# Step 05 >>>>>>>>>>>>>>>>>
# Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject. First I melt the extract_data where "subject_No" and
# "activity" are the identities, and others are the variables. Then I apply dcast with mean
# function, that calculates the mean of the measurements for all combination of 
# subject-activity. The generated data is tidy, because each column represent a single 
# variable, and each row is a single observation. There is no redundancy in the dataset.  

melt_tb <- melt(extract_data, id = c("subject_No","activity"), measure.vars = header[1:79])
new_tidy_data <- dcast(melt_tb, subject_No + activity ~ variable, mean)

View(new_tidy_data)
write.table(new_tidy_data, "new_tidy_data.txt",row.name=FALSE)

