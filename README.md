Function receives one optional parameter - name of the directory that contains data. i.e name of the directory where files activity_labels.txt, features.txt, features_info.txt, 
README.txt and subdirectories test and train reside. If the parameter is omitted then current directory is assumed. 

while execution function performs the following steps

- saves current working directory and sets new working directory specified as function parameter

   1 reads file activity_labels.txt into names.activities data frame. it will be used to assign descriptive name for activity variables
   2 reads file features.txt into names.variables data frame. It will be used to assign descriptive names for measurement variables.
   3 from test subdirectory reads 
		1 file ./test/X_test.txt into ds.variables.test data frame. Data frame that contains measurements
		2 file ./test/y_test.txt into ds.activities.test data frame. Data frame that contains activity id for each record in ds.variables.test.
		3 file ./test/subject_test.txt into ds.subject.test data frame. Data frame that contains id of the person for each in ds.variables.test.
   4 performs quick sanity check : all three data frames should contain exactly the same number of records(number of rows)
   5 sets names for the ds.variables.test data frame. names were read earlier from features.txt file
   6 drops all columns that do not have 'std' or 'mean'
   7 creates data frame as a combination of all three datasets 1st column is ds.subject.test values, 2nd column is ds.activities.test, 3rd is extra column that will be populated with descriptive names of activities and content of the ds.variables.test data.frame as 4+ columns
   8 assigns names for the first 3  columns in the result data frame.
   9 from test subdirectory reads 
		1 file ./train/X_train.txt into ds.variables.train data frame. Data frame that contains measurements 
		2 file ./train/y_train.txt into ds.activities.train data frame. Data frame that contains activity id for each record in ds.variables.train.
		3 file ./train/subject_train.txt into ds.subject.train data frame. Data frame that contains id of the person for each in ds.variables.train. 
  10 performs quick sanity check : all three data frames should contain exactly the same number of records(number of rows)
  11 sets names for the ds.variables.train data frame. names were read earlier from features.txt file
  12 drops all columns that do not have 'std' or 'mean'
  13 creates data frame as a combination of all three datasets 1st column is ds.subject.train values, 2nd column is ds.activities.train, 3rd extra column that will be populated with descriptive names of activities and content of the ds.variables.test data.frame
  14 assigns names for the first 3  columns in the result data frame.
  15 merges 2 data frames which were created on steps 7 and 13 into on data frame using rbind function
  16 updates extra column in result data frame with activity names from activity_labels.txt file. 
  17 drops column with activity code that is not needed any more.
  18 creates second data frame that contains the average of each variable for each activity and each subject using aggregate function.
  19 assigns descriptive names to newly created columns 


