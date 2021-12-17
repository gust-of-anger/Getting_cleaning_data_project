merge_files <- function () {
    # Function that merges the train and set data, together with
    # the respective labels for the subject and activity
    features <- read.table("features.txt", header=FALSE)
    ### Reading the TEST data
    x_test <- fread("test/X_test.txt", col.names=features[,2])
    y_test <- fread("test/y_test.txt", col.names=c('activity'))
    subject_test <- fread("test/subject_test.txt", col.names=c("subject"))
    test_set <- cbind(subject_test,y_test, x_test) # Creates the test set with activity and subject columns
    
    ### Reading the TRAIN data
    x_train <- fread("train/X_train.txt", col.names=features[,2])
    y_train <- fread("train/y_train.txt", col.names=c('activity'))
    subject_train <- fread("train/subject_train.txt", col.names=c("subject"))
    train_set <- cbind(subject_train, y_train, x_train) # Creates the train set with activity and subject columns

    ### Creating the final dataset by binding the train and test sets
    data_set <- rbind(train_set, test_set)
    data_set <- data.frame(data_set)
    data_set
}

extract_mean_std <- function (data_set) {
    # This function extracts only the columns related to mean and standard deviation (std) of the dataset
    
    # grep the mean and std columns. I also included the "subject" and "activity" fields
    # so that the final data frame also includes these columns.
    mean_std_idx <- grep("mean|std|subject|activity", names(data_set)) 
    data_mean_std <- data_set[mean_std_idx]
    data_mean_std
}

rename_activity <- function (data_set) {
    # This function renames the activity columns using the descriptive labels defined in the file activity_labels.txt
    activity_names <- fread("activity_labels.txt", col.names=c("idx", "act_name"))
    data_set[["activity"]] <- sapply(data_set[["activity"]], function (x) {activity_names[['act_name']][x]})
    data_set
}

summarize_data <- function (data_set) {
    # This function summarizes the final data by the mean of each activity for each subject
    df_group <- group_by(data_set, subject, activity) # First, group by subject and activity
    df_summary <- summarise_all(df_group, mean) # Second, summarize by the mean of the groups, expanded for all columns (function summarize_all)
    df_summary
}
