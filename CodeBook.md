## Code book for the Getting and Cleaning Data Course Project


### Original data
The original data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
A description of how the data was collected can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.


### Steps taken to clean up/analyze the data
All steps taken to clean up and analyze/summarize the data and writing it to the two new data sets can be found in the run_analysis.R R script. To summarize, these are the steps:

* Read in the subject, x and y data in the training data set
* Read in the subject, x and y data in the test data set
* Merge the subject, x and y data for the training- and test data set
* Read in the feature names for the x data set
* Name the columns in the subject ("subject_id"), y ("activity_id"), and x (features) data set
* Extract the variables in the x data set that represent a mean or standard deviation of a measurement
* Read in the activity names (activity_label) that go with the activity_id's
* Make the first data set containing subject_id, activity_label and all mean and standard deviation variables from the x data set
* Write the first data set to "dataset1_mean_std_measurements.txt"
* Calculate the mean of each variable for each unique activity_label+subject_id pair, and combine the means of the variables with activity_label and subject_id into a second data set
* Write the second data set to "dataset2_average_activity_subject_pair.txt"


### Descriptions of variables in the two data sets

"dataset1_mean_std_measurements.txt"
* column 1 - subject_id: subject identification number
* column 2 - activity_label: label for the activity the subject performed
* column 3-68: mean and standard deviation for the different measurements done by the accelerometer

"dataset2_average_activity_subject_pair.txt"
* column 1 - activity_label: label for the activity the subject performed
* column 2 - subject_id: subject identification number
* column 3-68: average value for the mean and standard deviation for the different measurements done by the accelerometer, per unique activity-subject pair

The measurements done by the accelerometer are described in the "features_info.txt" text file that comes with the original data set.
