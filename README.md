==================================================================
This data analysis is based on the study mentioned below:**

=========================================
This analysis contains 2 datasets:

1. tidy_wearables.txt
A data set of 10.299 records. Each one describes the sensor data and the detected activity for 30 observation subject.

2. tidy_wearables_AVG.txt
A data set of 180 records. Each one describes the average of the sensor data for the detected activity per each of the 30 subjects. 

The activities are: 
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

Variables of both data sets. 
 [1] "subject"                                        
 [2] "activity"                                       
 [3] "TimeBodyAcceleration-Mean()-X-Axis"             
 [4] "TimeBodyAcceleration-Mean()-Y-Axis"             
 [5] "TimeBodyAcceleration-Mean()-Z-Axis"             
 [6] "TimeBodyAcceleration-StdDev()-X-Axis"           
 [7] "TimeBodyAcceleration-StdDev()-Y-Axis"           
 [8] "TimeBodyAcceleration-StdDev()-Z-Axis"           
 [9] "TimeGravityAcceleration-Mean()-X-Axis"          
[10] "TimeGravityAcceleration-Mean()-Y-Axis"          
[11] "TimeGravityAcceleration-Mean()-Z-Axis"          
[12] "TimeGravityAcceleration-StdDev()-X-Axis"        
[13] "TimeGravityAcceleration-StdDev()-Y-Axis"        
[14] "TimeGravityAcceleration-StdDev()-Z-Axis"        
[15] "TimeBodyAccelerationJerk-Mean()-X-Axis"         
[16] "TimeBodyAccelerationJerk-Mean()-Y-Axis"         
[17] "TimeBodyAccelerationJerk-Mean()-Z-Axis"         
[18] "TimeBodyAccelerationJerk-StdDev()-X-Axis"       
[19] "TimeBodyAccelerationJerk-StdDev()-Y-Axis"       
[20] "TimeBodyAccelerationJerk-StdDev()-Z-Axis"       
[21] "TimeBodyAngular-Mean()-X-Axis"                  
[22] "TimeBodyAngular-Mean()-Y-Axis"                  
[23] "TimeBodyAngular-Mean()-Z-Axis"                  
[24] "TimeBodyAngular-StdDev()-X-Axis"                
[25] "TimeBodyAngular-StdDev()-Y-Axis"                
[26] "TimeBodyAngular-StdDev()-Z-Axis"                
[27] "TimeBodyAngularJerk-Mean()-X-Axis"             

==================================================================
The data analysis mentioned above merges the train and test data of the study below with the following steps:
1. reading sensor data
2. reading activity data
3. chosing only the averages and standard deviation data

**
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

