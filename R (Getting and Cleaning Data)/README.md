------------------------------------------------------------------------------------------------|

Project Name : Getting and Cleaning Data Course Project

Short description: Creating a new tidy data of UCI HAR dataset. The link for the UCI HAR dataset 
is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the UCI HAR dataset is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

------------------------------------------------------------------------------------------------|

Created by SAMIUL AZAM,
Email	: samiul.azam@ucalgary.ca
Date	: 13th August 2016

------------------------------------------------------------------------------------------------|

------------------------------------------------------------------------------------------------|


------------------- How to RUN the program in Rstudio ------------------------------------------|

Download the UCI HAR dataset from the following link: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
After unzipping it, you will get a folder named "UCI HAR Dataset". Copy this folder to the 
project directory.

Run Rstudio, and open the project folder. You need to set the project directory 
as a working directory first. 

You may need to install the "reshape2" package.
> install.packages("reshape2")

There is only one R file ("run_analysis.R") to Source. Click the Source button.

After executing the "run_analysis.R" it generates a new tidy data ("new_tidy_data.txt").
Moreover, you will also view the extract_data (only the extracted mean and std columns) 
and the new_tidy_data in the Rstudio IDE.

------------------------------------------------------------------------------------------------|

------------------------------------------------------------------------------------------------|


-------------------- About other files and datasets --------------------------------------------|

The 'codeBook.md' contains the details of the new_tidy_data.
 
After executing the "run_analysis.R", it will generate following file.
- 'new_tidy_data.txt'	: The target tidy dataset (project requirement)

------------------------------------------------------------------------------------------------|

------------------------------------------------------------------------------------------------|


-------------------------- About the run_analysis.R --------------------------------------------|

Analysis steps:

Step 01 >>>>>>>>>>>>>>>>>
Merging test and traning datasets (measurements, subject-numbers and activity labels) 
into a single data frame (merge_data). Also assign header to the merged data frame.

Step 02 >>>>>>>>>>>>>>>>>
Extracts only the measurements on the mean and standard deviation for each measurement.
To do this, I select those columns/variables that have the word "mean" and "std" in their name.
I also assign header to the extracted data (added "subject_No" and "activity" column header).

Step 03 >>>>>>>>>>>>>>>>>
Assigning descriptive activity names to name the activities in the extracted data set.
R factor function easily solve this problem.

Step 04 >>>>>>>>>>>>>>>>>
Appropriately labels the data set with descriptive variable names. To make them descriptive, 
I replaces most of the short keywords with the full words. For example, f is replaced with 
frequency, t is replaced with time.

Step 05 >>>>>>>>>>>>>>>>>
Creates a second, independent tidy data set with the average of each variable for each activity 
and each subject. First I melt the extract_data where "subject_No" and "activity" are the 
identities, and others are the variables. Then I apply dcast with mean function, that calculates 
the mean of the measurements for all combination of subject-activity. The generated data is tidy, 
because each column represent a distinct variable, and each row is a distinct observation. There 
is no redundancy in the dataset. finally, I write the new tidy data in the project directory.

------------------------------------------------------------------------------------------------|

------------------------------------------------------------------------------------------------|

Thank you so much...... 
