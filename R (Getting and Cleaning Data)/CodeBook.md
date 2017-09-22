------ The Codebook is about the new tidy data "new_tidy_data.txt" --------------------------------|

Description: The new_tidy_data.txt is created based on the data in UCI HAR dataset.
The link for the UCI HAR dataset 
is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the UCI HAR dataset is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The new tidy data is created based on the following datasets from UCI HAR dataset.

- 'features.txt'	: List of all features.
- 'activity_labels.txt'	: Links the class labels with their activity name.
- 'subject_test.txt'	: Links the test data with the subject.
- 'subject_train.txt'	: Links the training data with the subject.
- 'X_train.txt'		: Training set.
- 'y_train.txt'		: Training labels.
- 'X_test.txt'		: Test set.
- 'y_test.txt'		: Test labels.

There are total 561 measurements (features) in UCI HAR dataset. Measurements are inside the 'X_train.txt', 'X_test.txt' files for 10299 observations. Links to subjects or persons are provided
in the 'subject_test.txt' and 'subject_train.txt' files, as well as links to activity labels are
provided in the 'y_train.txt' and 'y_test.txt' files. First, I merge all training and testing measurements (561 dimentions), subjects numbers (1 dimention), and activity labels (1 dimention).
The merge data is about 10299 x 563.

Then I extracts only the measurements on the mean and standard deviation for each measurement (79 measurements out of 561). The extarcted data is about 10299 x 81. Moreover, I assign descriptive 
column header by replacing small keyword combination into full word combination. My replacements
are as follows:

	"f" > "frequency"
	"t" > "time"
	"Acc" >"Accelerometer"
	"Gyro" >"Gyroscope"
	"Mag" > "Magnitude"
	"Jerk" > "Jerking"
	"BodyBody" > "Body"

Also there are six activity labels: WALKING
2, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING
, 
STANDING, and LAYING. In the original data, they were prepresented as 1,2,3,4,5 and 6. In the 
new tidy data, these values are maps back to the descriptive labels: WALKING
2, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING
, STANDING, and LAYING.

The new tidy data contains average of each variable (extracted 79 features) for each activity 
and each subject. There are total 30 subjects provided data on 6 different activities. So the 
new tidy data contains 180 observations. The dimention of the new tidy data is 180 x 81. This 
data is tidy because each column represent a single variable, and each row is a particular 
observation. There is no redundancy in the dataset.

--------------------------------------------------------------------------------------------------|

The complete description of variables are as follows:

Column 01: 
- Name 		: subject_No
- Description	: The participated subject's identity
- Value range	: 1 to 30 (as because 30 participants)
- Type		: Numeric
    

Column 02: 
- Name 		: activity
- Description	: Types of activity
- Values	: WALKING
2, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING
, STANDING, LAYING 
- Type		: Character

Column 03 - 81: 
- Names		:                                                                                                                   
	timeBodyAccelerometer-mean()-X                        
	timeBodyAccelerometer-mean()-Y                       
	timeBodyAccelerometer-mean()-Z                        
	timeBodyAccelerometer-std()-X                                               
	timeBodyAccelerometer-std()-Y                       
	timeBodyAccelerometer-std()-Z                       
	timeGravityAccelerometer-mean()-X                       
	timeGravityAccelerometer-mean()-Y                       
	timeGravityAccelerometer-mean()-Z                       
	timeGravityAccelerometer-std()-X                                          
	timeGravityAccelerometer-std()-Y                                            
	timeGravityAccelerometer-std()-Z                                            
	timeBodyAccelerometerJerking-mean()-X                 
	timeBodyAccelerometerJerking-mean()-Y                
	timeBodyAccelerometerJerking-mean()-Z                 
	timeBodyAccelerometerJerking-std()-X                 
	timeBodyAccelerometerJerking-std()-Y                  
	timeBodyAccelerometerJerking-std()-Z                 
	timeBodyGyroscope-mean()-X                           
	timeBodyGyroscope-mean()-Y                           
	timeBodyGyroscope-mean()-Z                            
	timeBodyGyroscope-std()-X                           
	timeBodyGyroscope-std()-Y                             
	timeBodyGyroscope-std()-Z                            
	timeBodyGyroscopeJerking-mean()-X                     
	timeBodyGyroscopeJerking-mean()-Y                    
	timeBodyGyroscopeJerking-mean()-Z                     
	timeBodyGyroscopeJerking-std()-X                     
	timeBodyGyroscopeJerking-std()-Y                      
	timeBodyGyroscopeJerking-std()-Z                     
	timeBodyAccelerometerMagnitude-mean()                 
	timeBodyAccelerometerMagnitude-std()                 
	timeGravityAccelerometerMagnitude-mean()              
	timeGravityAccelerometerMagnitude-std()              
	timeBodyAccelerometerJerkingMagnitude-mean()          
	timeBodyAccelerometerJerkingMagnitude-std()         
	timeBodyGyroscopeMagnitude-mean()                     
	timeBodyGyroscopeMagnitude-std()                     
	timeBodyGyroscopeJerkingMagnitude-mean()             
	timeBodyGyroscopeJerkingMagnitude-std()             
	frequencyBodyAccelerometer-mean()-X                  
	frequencyBodyAccelerometer-mean()-Y                  
	frequencyBodyAccelerometer-mean()-Z                 
	frequencyBodyAccelerometer-std()-X                  
	frequencyBodyAccelerometer-std()-Y                    
	frequencyBodyAccelerometer-std()-Z                   
	frequencyBodyAccelerometer-meanFreq()-X               
	frequencyBodyAccelerometer-meanFreq()-Y              
	frequencyBodyAccelerometer-meanFreq()-Z               
	frequencyBodyAccelerometerJerking-mean()-X           
	frequencyBodyAccelerometerJerking-mean()-Y            
	frequencyBodyAccelerometerJerking-mean()-Z           
	frequencyBodyAccelerometerJerking-std()-X             
	frequencyBodyAccelerometerJerking-std()-Y            
	frequencyBodyAccelerometerJerking-std()-Z             
	frequencyBodyAccelerometerJerking-meanFreq()-X       
	frequencyBodyAccelerometerJerking-meanFreq()-Y        
	frequencyBodyAccelerometerJerking-meanFreq()-Z      
	frequencyBodyGyroscope-mean()-X                       
	frequencyBodyGyroscope-mean()-Y                      
	frequencyBodyGyroscope-mean()-Z                       
	frequencyBodyGyroscope-std()-X                       
	frequencyBodyGyroscope-std()-Y                        
	frequencyBodyGyroscope-std()-Z                       
	frequencyBodyGyroscope-meanFreq()-X                   
	frequencyBodyGyroscope-meanFreq()-Y                  
	frequencyBodyGyroscope-meanFreq()-Z                  
	frequencyBodyAccelerometerMagnitude-mean()           
	frequencyBodyAccelerometerMagnitude-std()             
	frequencyBodyAccelerometerMagnitude-meanFreq()                              
	frequencyBodyAccelerometerJerkingMagnitude-mean()                       
	frequencyBodyAccelerometerJerkingMagnitude-std()                            
	frequencyBodyAccelerometerJerkingMagnitude-meanFreq()                        
	frequencyBodyGyroscopeMagnitude-mean()                                      
	frequencyBodyGyroscopeMagnitude-std()                                        
	frequencyBodyGyroscopeMagnitude-meanFreq()                                  
	frequencyBodyGyroscopeJerkingMagnitude-mean()                                
	frequencyBodyGyroscopeJerkingMagnitude-std()                               
	frequencyBodyGyroscopeJerkingMagnitude-meanFreq()                        
- Description	: Average value of each measurements for each subject- activity pair.
- Value Range	: -1 to 1 
- Type		: Numeric

--------------------------------------------------------------------------------------------------|
