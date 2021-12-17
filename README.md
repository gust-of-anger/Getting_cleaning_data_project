# Getting and cleaning data project
Final project for the course Getting and Cleaning Data on coursera.

## Data analysis

The project contains two scripts: run_analysis.R and project_functions.R
The run_analysis is the main script, and when called on a folder with the test and train data sets, performs all data analysis, calling the functions in the project_functions.R file (note that this file should also be included in the same folder and the run_analysis script).

## Script description

### run_analysis.R
This script performs the actions connected to the steps for the project. First, it calls the merge_files function, responsible for merging the files of test and train sets. Note that the function include the column names as required by step 4.
The next function called is extract_mean_std that extract only the columns with means and standard deviations, as required in step 2. The third function, rename_activity, performs the step 3, by renaming the activity labels with descriptive names, provided in the file "activity_names.txt" of the data set. 
Finally the last function called is summarize_data, responsible for calculating the mean for each subject and each activity. The data set contains 30 individuals and six activities, thus the resulting data has 130 rows.

To run this script, open a R window and set the working directory to point at the folder for the course project data. Then, type source("run_analysis.R"). All functions will run and the script will generate the file "tidy_data.txt", also submitted in this repository.

To see load the tidy_data.txt file in R, type:
td <- read.table("tidy_data.txt", header=TRUE)

Then, the file can be checked with:
View(td)

### project_function.R

This file contains the required functions for the project.

merge_files: merges the train and set data, together with the respective labels for the subject and activity. The function also labels the columns, as required by step 4. The function requires no input parameter, but the data should be organized as in the zip file for the course project.

extract_mean_std: extract only the columns with the mean and standard deviations, as required in step 2. The input parameter for this functions is the data frame returned by the merge_files functions.

rename_activity: renames the activity column with descriptive labels (step 3). The input data is the data frame returned by the extract_mean_std function.

summarize_data: summarizes the data frame by the subject id and the activity, as asked in step 5.
 

