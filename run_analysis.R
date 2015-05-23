run_analysis <- function(directory=".") {

	#  1. save current working directory and set a new one.
	dir.save<-getwd();
	setwd(directory);

	#  2. Load activities names
	names.activities<-read.table("./activity_labels.txt");

	#  3. Load variable names. We will need those names as vector and we do not need column indexes
	names.variables<-read.table("./features.txt")[,2];

	#  4. read test data subject, activities and features dataframes, massage data
	#     and make data frame ready for further processing. 

	ds.variables.test <-read.table("./test/X_test.txt");
	ds.activities.test<-read.table("./test/y_test.txt");
	ds.subject.test   <-read.table("./test/subject_test.txt");

	# -- basic sanity check
	stopifnot(nrow(ds.variables.test) == nrow(ds.activities.test));
	stopifnot(nrow(ds.activities.test) == nrow(ds.subject.test));

	# -- set names for the frame
	names(ds.variables.test)<-names.variables;

	# -- drop columns that do not contain "mean" or "std" as part of the column name
	ds.variables.test <- ds.variables.test[, grep("mean|std", names.variables, ignore.case = T)]
	
	# -- create test data frame
	dfs.1 <- cbind(ds.subject.test, rep("", nrow(ds.activities.test)), ds.activities.test, ds.variables.test);
	colnames(dfs.1)[1]<-"subjectid";
	colnames(dfs.1)[2]<-"activity";
	colnames(dfs.1)[3]<-"activityN";


	#  5. read train data subject, activities and features dataframes, massage data
	#     and make dataframe ready for further processing. 

	ds.variables.train <-read.table("./train/X_train.txt");
	ds.activities.train<-read.table("./train/y_train.txt");
	ds.subject.train   <-read.table("./train/subject_train.txt");

	# -- basic sanity check
	stopifnot(nrow(ds.variables.train) == nrow(ds.activities.train));
	stopifnot(nrow(ds.activities.train) == nrow(ds.subject.train));

	# -- set names for the frame
	names(ds.variables.train)<-names.variables;

	# -- drop columns that do not contain "mean" or "std" as part of the column name
	ds.variables.train <- ds.variables.train[, grep("mean|std", names.variables, ignore.case = T)]

	# -- create train data frame
	dfs.2 <- cbind(ds.subject.train, rep("", nrow(ds.activities.train)), ds.activities.train,  ds.variables.train);
	colnames(dfs.2)[1]<-"subjectid";
	colnames(dfs.2)[2]<-"activity";
	colnames(dfs.2)[3]<-"activityN";

	#  6. merge two dataframes into one
	df.intermediate<-rbind(dfs.1, dfs.2);	
	
	#  7. update activity name name and drop temporary column
	df.intermediate$activity<-names.activities[df.intermediate$activityN, 2]
	df.intermediate$activityN<-NULL;

	#  8. create second data frame that contains the average of each variable for each activity and each subject	
	df.out<-aggregate(df.intermediate, by=list(df.intermediate$subjectid, df.intermediate$activity), FUN=mean)

	# 9. update columns
	df.out$subjectid<-NULL;
	df.out$activity<-NULL;
	colnames(df.out)[1]<-"subjectid";
	colnames(df.out)[2]<-"activity";

	# 10 do not forget to cleanup
	setwd(dir.save);

	# Yahoo!...
	df.out;
}