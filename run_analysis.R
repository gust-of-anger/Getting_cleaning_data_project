# The run analysis script uses functions defined in the "project_functions.R"
# script to generate a tidy data set, and then write the final data frame to the
# "tidy_data.txt" file, submitted to Coursera.

# For explanations of how each function works, please check the comments in the
# "project_functions.R" file.

# This script is designed to be used in the folder that contains the train and test folders
# of the data set, togehter with the "project_functions.R" file.
# Just open a R window, make sure the working directory is correct, and type:
# source("run_analysis.R")
# The script will generate the file "tidy_data.txt".

library(data.table)
library(dplyr)

source("project_functions.R")

df_dataset <- merge_files()

df_mean_std <- extract_mean_std(df_dataset)

df_renamed <- rename_activity(df_mean_std)

df_summary <- summarize_data(df_renamed)

write.table(df_summary, file="tidy_data.txt", row.name=FALSE)