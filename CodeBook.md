Each record of tidy dataset resulted from original dataset contains
- unique identifier of the subject who performed the activity
- descriptive name of the activity (value from 'activity_labels.txt')
- An 86-features vector with average values for all measurements for domain value for specified user and activity

Tidy dataset was a result of processing the following dataset created by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and 
gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by 
calculating variables from the time and frequency domain.

Each record of original dataset is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Training subjects.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Test subjects.

Steps performed to create resulted tidy dataset are :
  1. read test features data into data frame
  2. assuming that file 'features.txt' contains names for each column, drop all columns which names do not have words 'mean' or 'std' in it
  3. read subjects data 'subject_test.txt' into one column data frame 
  4. read activities data 'y_test.txt' into one column data frame 
  5. combine all three data frames into one by columns
  7. read train features data into data frame
  8. assuming that file 'features.txt' contains names for each column, drop all columns which names do not have words 'mean' or 'std' in it
  9. read subjects data 'subject_train.txt' into one column data frame 
 10. read activities data 'y_train.txt' into one column data frame 
 11. combine all three data frames into one by columns
 12. merge two data frames into one appending one to the and of another
 13. replace identifiers of activities with its descriptive values from activity_labels.txt
 14. aggregate resulted dataset by subject and activity name using mean function to get average of each variable for each activity and each subject.

For more detailed information about dataset transformation see README.md and run_analysis.R files.








