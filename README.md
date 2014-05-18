Getting and Cleaning Data Course Project
===================================
##Creation of two datasets

###The script rn_analysis.R first combines all the data in the UCI HAR Dataset folder into a dataset "dataTotal1.txt" with the means and standard deviations of both the variables in the "features" dataset and the variables in the "Inertial Data" folder, The steps to do this are as follows:
* 1. Read in and format the "x_train" data.
* 2. Read in the y_train data as a separate column, merge to dataset.
* 3. Read in the subject_train column data as a separate column, merge to dataset.
* 4. Merge in the variables from the "Inertial Signals" folder
* 5. Then, of the 561 features variables, the ones that represent means or standard deviations are subsetted out from the rest.

###Then the average of each variable representing the means are rolled up by subject and activity, giving a second dataset called dataSubjectActivityMean2.txt in which each column is a subject-activity combination and each row is a variable:
* 1. A "subject_activity" variable with (30 subjects) * (6 activities) = 180 levels was created
* 2. Each variable representing a mean was averaged across these subject-activity combinations.
