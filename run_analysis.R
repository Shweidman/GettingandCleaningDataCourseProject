##You should create one R script called run_analysis.R that does the following. 
##1.Merges the training and the test sets to create one data set. For both data sets:
##  a. Read in and format the x_train data.
##    i.  Read in the data itself
##    ii. Read in the column labels from the features 
##  b. Read in the y_train data as a separate column, merge to dataset.
##  c. Read in the subject_train column data as a separate column, merge to dataset.
##  d. Merge in the variables from the "Inertial Signals" folder
##    i.   Read in the data into a separate dataset.
##    ii.  Take the mean and standard deviation of each row, label it as the name of the dataset
##    iii. Add it as a column to the dataset
##  e. Merge the test and train datasets
##2.Extracts only the measurements on the mean and standard deviation for each measurement. 
##3.Uses descriptive activity names to name the activities in the data set
##4.Appropriately labels the data set with descriptive activity names. 
##5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##  a. Create a "subject-activity" variable
##  b. Average variables by subject and activity

setwd("C:/Users/weidse51/Documents/Coursera/Data Science/Getting and Cleaning Data/Week 3/Course Project/UCI HAR Dataset/")

###############TRAIN DATA##################

##1.a.i: Read in x_train data

x_train <- read.table("train/X_train.txt")
data_train <- x_train

##1.a.ii: Read in features data, add as column labels of x_train data

features <- read.table("features.txt")
colnames(data_train) <- features[,2]

##1.b. Read in the y_train data as a separate column, merge to dataset.

y_train <- read.table("train/y_train.txt")
data_train <- cbind(y_train,data_train)
colnames(data_train)[1] <- "activity"

##1.c. Read in the subject_train data as a separate column, merge to dataset.

subject_train <- read.table("train/subject_train.txt")
data_train <- cbind(subject_train,data_train)
colnames(data_train)[1] <- "subject"

##  1.d. Merge in the variables from the "Inertial Signals" folder

##  1.d.i-ii Read in data from each dataset, calculate the mean and standard deviation of each variable

totalAccZTrain <- read.table("train/Inertial Signals/total_acc_z_train.txt")
totalAccZTrainMean <- apply(totalAccZTrain,1,function(x) mean(x))
totalAccZTrainSD <- apply(totalAccZTrain,1,function(x) sd(x))

totalAccYTrain <- read.table("train/Inertial Signals/total_acc_y_train.txt")
totalAccYTrainMean <- apply(totalAccYTrain,1,function(x) mean(x))
totalAccYTrainSD <- apply(totalAccYTrain,1,function(x) sd(x))

totalAccXTrain <- read.table("train/Inertial Signals/total_acc_x_train.txt")
totalAccXTrainMean <- apply(totalAccXTrain,1,function(x) mean(x))
totalAccXTrainSD <- apply(totalAccXTrain,1,function(x) sd(x))

bodyGyroZTrain <- read.table("train/Inertial Signals/body_gyro_z_train.txt")
bodyGyroZTrainMean <- apply(bodyGyroZTrain,1,function(x) mean(x))
bodyGyroZTrainSD <- apply(bodyGyroZTrain,1,function(x) sd(x))

bodyGyroYTrain <- read.table("train/Inertial Signals/body_gyro_y_train.txt")
bodyGyroYTrainMean <- apply(bodyGyroYTrain,1,function(x) mean(x))
bodyGyroYTrainSD <- apply(bodyGyroYTrain,1,function(x) sd(x))

bodyGyroXTrain <- read.table("train/Inertial Signals/body_gyro_x_train.txt")
bodyGyroXTrainMean <- apply(bodyGyroXTrain,1,function(x) mean(x))
bodyGyroXTrainSD <- apply(bodyGyroXTrain,1,function(x) sd(x))

bodyAccZTrain <- read.table("train/Inertial Signals/body_acc_z_train.txt")
bodyAccZTrainMean <- apply(bodyAccZTrain,1,function(x) mean(x))
bodyAccZTrainSD <- apply(bodyAccZTrain,1,function(x) sd(x))

bodyAccYTrain <- read.table("train/Inertial Signals/body_acc_y_train.txt")
bodyAccYTrainMean <- apply(bodyAccYTrain,1,function(x) mean(x))
bodyAccYTrainSD <- apply(bodyAccYTrain,1,function(x) sd(x))

bodyAccXTrain <- read.table("train/Inertial Signals/body_acc_x_train.txt")
bodyAccXTrainMean <- apply(bodyAccXTrain,1,function(x) mean(x))
bodyAccXTrainSD <- apply(bodyAccXTrain,1,function(x) sd(x))

##  1.d.iii Add the variables to the dataset

data_train <- cbind(data_train,totalAccZTrainMean)
data_train <- cbind(data_train,totalAccZTrainSD)
data_train <- cbind(data_train,totalAccYTrainMean)
data_train <- cbind(data_train,totalAccYTrainSD)
data_train <- cbind(data_train,totalAccXTrainMean)
data_train <- cbind(data_train,totalAccXTrainSD)
data_train <- cbind(data_train,bodyGyroZTrainMean)
data_train <- cbind(data_train,bodyGyroZTrainSD)
data_train <- cbind(data_train,bodyGyroYTrainMean)
data_train <- cbind(data_train,bodyGyroYTrainSD)
data_train <- cbind(data_train,bodyGyroXTrainMean)
data_train <- cbind(data_train,bodyGyroXTrainSD)
data_train <- cbind(data_train,bodyAccZTrainMean)
data_train <- cbind(data_train,bodyAccZTrainSD)
data_train <- cbind(data_train,bodyAccYTrainMean)
data_train <- cbind(data_train,bodyAccYTrainSD)
data_train <- cbind(data_train,bodyAccXTrainMean)
data_train <- cbind(data_train,bodyAccXTrainSD)

colnames(data_train)[564] <- "totalAccZMean"
colnames(data_train)[565] <- "totalAccZSD"
colnames(data_train)[566] <- "totalAccYMean"
colnames(data_train)[567] <- "totalAccYSD"
colnames(data_train)[568] <- "totalAccXMean"
colnames(data_train)[569] <- "totalAccXSD"
colnames(data_train)[570] <- "bodyGyroZMean"
colnames(data_train)[571] <- "bodyGyroZSD"
colnames(data_train)[572] <- "bodyGyroYMean"
colnames(data_train)[573] <- "bodyGyroYSD"
colnames(data_train)[574] <- "bodyGyroXMean"
colnames(data_train)[575] <- "bodyGyroXSD"
colnames(data_train)[576] <- "bodyAccZMean"
colnames(data_train)[577] <- "bodyAccZSD"
colnames(data_train)[578] <- "bodyAccYMean"
colnames(data_train)[579] <- "bodyAccYSD"
colnames(data_train)[580] <- "bodyAccXMean"
colnames(data_train)[581] <- "bodyAccXSD"

###############TEST DATA##################

##1.a.i: Read in x_test data

x_test <- read.table("test/X_test.txt")
data_test <- x_test

##1.a.ii: Read in features data, add as column labels of x_test data

features <- read.table("features.txt")
colnames(data_test) <- features[,2]

##1.b. Read in the y_test data as a separate column, merge to dataset.

y_test <- read.table("test/y_test.txt")
data_test <- cbind(y_test,data_test)
colnames(data_test)[1] <- "activity"

##1.c. Read in the subject_test data as a separate column, merge to dataset.

subject_test <- read.table("test/subject_test.txt")
data_test <- cbind(subject_test,data_test)
colnames(data_test)[1] <- "subject"

##  1.d. Merge in the variables from the "Inertial Signals" folder

##  1.d.i-ii Read in data from each dataset, calculate the mean and standard deviation of each variable

totalAccZTest <- read.table("test/Inertial Signals/total_acc_z_test.txt")
totalAccZTestMean <- apply(totalAccZTest,1,function(x) mean(x))
totalAccZTestSD <- apply(totalAccZTest,1,function(x) sd(x))

totalAccYTest <- read.table("test/Inertial Signals/total_acc_y_test.txt")
totalAccYTestMean <- apply(totalAccYTest,1,function(x) mean(x))
totalAccYTestSD <- apply(totalAccYTest,1,function(x) sd(x))

totalAccXTest <- read.table("test/Inertial Signals/total_acc_x_test.txt")
totalAccXTestMean <- apply(totalAccXTest,1,function(x) mean(x))
totalAccXTestSD <- apply(totalAccXTest,1,function(x) sd(x))

bodyGyroZTest <- read.table("test/Inertial Signals/body_gyro_z_test.txt")
bodyGyroZTestMean <- apply(bodyGyroZTest,1,function(x) mean(x))
bodyGyroZTestSD <- apply(bodyGyroZTest,1,function(x) sd(x))

bodyGyroYTest <- read.table("test/Inertial Signals/body_gyro_y_test.txt")
bodyGyroYTestMean <- apply(bodyGyroYTest,1,function(x) mean(x))
bodyGyroYTestSD <- apply(bodyGyroYTest,1,function(x) sd(x))

bodyGyroXTest <- read.table("test/Inertial Signals/body_gyro_x_test.txt")
bodyGyroXTestMean <- apply(bodyGyroXTest,1,function(x) mean(x))
bodyGyroXTestSD <- apply(bodyGyroXTest,1,function(x) sd(x))

bodyAccZTest <- read.table("test/Inertial Signals/body_acc_z_test.txt")
bodyAccZTestMean <- apply(bodyAccZTest,1,function(x) mean(x))
bodyAccZTestSD <- apply(bodyAccZTest,1,function(x) sd(x))

bodyAccYTest <- read.table("test/Inertial Signals/body_acc_y_test.txt")
bodyAccYTestMean <- apply(bodyAccYTest,1,function(x) mean(x))
bodyAccYTestSD <- apply(bodyAccYTest,1,function(x) sd(x))

bodyAccXTest <- read.table("test/Inertial Signals/body_acc_x_test.txt")
bodyAccXTestMean <- apply(bodyAccXTest,1,function(x) mean(x))
bodyAccXTestSD <- apply(bodyAccXTest,1,function(x) sd(x))

##  1.d.iii Add the variables to the dataset

data_test <- cbind(data_test,totalAccZTestMean)
data_test <- cbind(data_test,totalAccZTestSD)
data_test <- cbind(data_test,totalAccYTestMean)
data_test <- cbind(data_test,totalAccYTestSD)
data_test <- cbind(data_test,totalAccXTestMean)
data_test <- cbind(data_test,totalAccXTestSD)
data_test <- cbind(data_test,bodyGyroZTestMean)
data_test <- cbind(data_test,bodyGyroZTestSD)
data_test <- cbind(data_test,bodyGyroYTestMean)
data_test <- cbind(data_test,bodyGyroYTestSD)
data_test <- cbind(data_test,bodyGyroXTestMean)
data_test <- cbind(data_test,bodyGyroXTestSD)
data_test <- cbind(data_test,bodyAccZTestMean)
data_test <- cbind(data_test,bodyAccZTestSD)
data_test <- cbind(data_test,bodyAccYTestMean)
data_test <- cbind(data_test,bodyAccYTestSD)
data_test <- cbind(data_test,bodyAccXTestMean)
data_test <- cbind(data_test,bodyAccXTestSD)

colnames(data_test)[564] <- "totalAccZMean"
colnames(data_test)[565] <- "totalAccZSD"
colnames(data_test)[566] <- "totalAccYMean"
colnames(data_test)[567] <- "totalAccYSD"
colnames(data_test)[568] <- "totalAccXMean"
colnames(data_test)[569] <- "totalAccXSD"
colnames(data_test)[570] <- "bodyGyroZMean"
colnames(data_test)[571] <- "bodyGyroZSD"
colnames(data_test)[572] <- "bodyGyroYMean"
colnames(data_test)[573] <- "bodyGyroYSD"
colnames(data_test)[574] <- "bodyGyroXMean"
colnames(data_test)[575] <- "bodyGyroXSD"
colnames(data_test)[576] <- "bodyAccZMean"
colnames(data_test)[577] <- "bodyAccZSD"
colnames(data_test)[578] <- "bodyAccYMean"
colnames(data_test)[579] <- "bodyAccYSD"
colnames(data_test)[580] <- "bodyAccXMean"
colnames(data_test)[581] <- "bodyAccXSD"

##1.e. Merge the two datasets together

data_total <- rbind(data_train,data_test)

##2. Subset only the means and SDs of the "features" variables, as well as the means and SDs of the "Inertial Data" variables.

data_total <- data_total[,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545,564:581)]

##3. Add activity_label variable that describes each activity 

activity_label <- character(nrow(data_total))
activity_label[data_total$activity == 1] <- "WALKING"
activity_label[data_total$activity == 2] <- "WALKING_UPSTAIRS"
activity_label[data_total$activity == 3] <- "WALKING_DOWNSTAIRS"
activity_label[data_total$activity == 4] <- "SITTING"
activity_label[data_total$activity == 5] <- "STANDING"
activity_label[data_total$activity == 6] <- "LAYING"
data_total <- cbind(data_total[,1:2],activity_label,data_total[,3:86])

##5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##  a. Create a "subject-activity" variable
##  b. Average all "features" variables by subject and activity

dataSubjectActivityMeans <- data_total[,c(1:3,4:6,10:12,16:18,22:24,28:30,34,36,38,40,42,44:46,50:52,56:58,62,64,66,68,70,72,74,76,78,80,82,84,86)]
subjectActivity <- paste(dataSubjectActivityMeans$subject,dataSubjectActivityMeans$activity_label,sep="")
dataSubjectActivityMeans <- cbind(dataSubjectActivityMeans,subjectActivity)

dataSplit = split(dataSubjectActivityMeans,dataSubjectActivityMeans$subjectActivity)
dataSubjectActivity <- sapply(dataSplit, function(x) colMeans(x[,4:45]))

write.table(data_total, "dataTotal1.txt")
write.table(data_total, "dataSubjectActivityMeans2.txt")