# CodeBook

## Original Data
    - Original data: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
    - Original description of the dataset: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## Variables in run_analysis.R
    1. merged_data: data frame that rappresents result for point 1
    2. std_mean_data: data frame that rappresents result for point 4
    3. mean_data: data frame that rappresents result for point 5

## Transformations
    1. merge files: x_train.txt, y_train.txt, x_test.txt, y_test.txt, subject_train.txt
    and subject_test.txt into one dataset named merged_data.
    2. creating logical vector to select columns with mean() and std()
    3. introduces factor for activity column
    4. add column names to std_mean_data  (the column names are subject, activity and then column
    names derived from original data set)
    5. creating tidy dataset(mean_data) from std_mean_data grouped by subject, activity