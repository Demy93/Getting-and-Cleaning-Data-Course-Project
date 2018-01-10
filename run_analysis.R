library(reshape2)

### Read in the subjects, X and Y training- and test datasets
subject_train <- read.table("UCI Har Dataset/train/subject_train.txt")
x_train <- read.table("UCI Har Dataset/train/X_train.txt")
y_train <- read.table("UCI Har Dataset/train/y_train.txt")

subject_test <- read.table("UCI Har Dataset/test/subject_test.txt")
x_test <- read.table("UCI Har Dataset/test/X_test.txt")
y_test <- read.table("UCI Har Dataset/test/y_test.txt")

### Merge the training- and test datasets
subject_merged <- rbind(subject_train, subject_test)
x_merged <- rbind(x_train, x_test)
y_merged <- rbind(y_train, y_test)

### Read in the feature names for the X dataset
features <- read.table("UCI Har Dataset/features.txt")[,"V2"]

### Name all the columns in the subject, X and Y dataset
colnames(subject_merged) <- "subject_id"
colnames(y_merged) <- "activity_id"
colnames(x_merged) <- features

### Extract measurements in the X dataset on the mean and sd for each measurement
mean_features <- grep("-mean\\(\\)", features, value=TRUE)
std_features <- grep("-std\\(\\)", features, value=TRUE)
selected_features <- c(mean_features,std_features)
x_merged_selected <- x_merged[, selected_features]

### Read in activity names for each activity id and merge the names with the y_merged dataset
activities <- read.table("UCI Har Dataset/activity_labels.txt")
colnames(activities) <- c("activity_id", "activity_label")
y_merged_descriptive <- merge(y_merged, activities)

### Join the subjects, activity and measurements data sets and write csv
data1 <- cbind(subject_merged, y_merged_descriptive["activity_label"], x_merged_selected)
write.csv(data1, "dataset1_mean_std_measurements.csv")

### Average of each variable for each subject-activity pair and write csv
data2 <- melt(data1, id=c("subject_id", "activity_label"))
data3 <- dcast(data2, activity_label + subject_id ~ variable, mean)
write.csv(data3, "dataset2_average_activity_subject_pair.csv")