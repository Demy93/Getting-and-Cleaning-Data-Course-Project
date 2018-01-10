### Getting and Cleaning Data Course Project

This repository contains the R script, the code book, and the two tidy data sets for the course project for the "Getting and Cleaning Data" course on Coursera.

The data that is analyzed comes from accelerometers from the Samsung Galaxy S smartphone, and can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

When the folder "UCI Har Dataset" is placed into the working directory, the script "run_analysis.R" can be run to analyze the data based on the assignment in the course project. During analysis, two (csv) datasets will be written:

* dataset1_mean_std_measurements.csv -- that only contains subject_id, activity_label and the mean and standard deviation for each measurement
* dataset2_average_activity_subject_pair.csv -- that contains the average value for each variable (except activity_label and subject_id) in the first dataset for each activity-subject pair

The code book describes the exact steps taken during data cleaning and analysis and also contains a description of the variables in each of the two tidy data sets.
