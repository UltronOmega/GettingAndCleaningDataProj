# 1. Merges the training and the test sets to create one data set.

# 1.a read train data set
X_train <- read.table("SamsungData/train/X_train.txt")
y_train <- read.table("SamsungData/train/y_train.txt")
subject_train <- read.table("SamsungData/train/subject_train.txt")

# 1.b read test data set
X_test <- read.table("SamsungData/test/X_test.txt")
y_test <- read.table("SamsungData/test/y_test.txt")
subject_test <- read.table("SamsungData/test/subject_test.txt")

#  1.c merged data set = train data set + test data set
X_merged <- rbind(X_train, X_test)
y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)

# 1.d unique data set that contains  subject, activity and 561 features
merged_data <- cbind(subject_merged, y_merged, X_merged)


# 2. Extracts only the measurements on the mean and standard deviation
# for each measurement.
# 2.a read features names
features <- read.table("SamsungData/features.txt")

# 2.b logical vector that defines columns to select
# the first two columns are subject + activity
logical_std_mean_cols <- c(TRUE, TRUE,
     grepl('(std|mean)\\(\\)', features$V2, ignore.case = FALSE))

# 2.c create data set with required columns
std_mean_data <- merged_data[logical_std_mean_cols]

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("SamsungData/activity_labels.txt")
std_mean_data[,2] <- factor(std_mean_data[,2], labels = activity_labels$V2)

# 4. Appropriately labels the data set with descriptive variable names.
column_names <- c("subject", "activity", as.character(features$V2))
colnames(std_mean_data) <- column_names[logical_std_mean_cols]

# 5. From the data set in step 4, creates a second, independent tidy data
# set with the average of each variable for each activity and each subject.

library(dplyr)
mean_data <- std_mean_data %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# save dataset in txt file
write.table(mean_data, "tidy_dataset.txt", row.name=FALSE)