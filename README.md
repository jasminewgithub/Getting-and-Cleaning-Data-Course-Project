# Getting-and-Cleaning-Data-Course-Project

# Data Source:
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

# Input Data
+ data was downloaded and unzipped locally without using R command.
+ The R script reads unzipped data.

# Data Cleaning
+ `run_analysis.R` conducts all necessary operations including:
  - read test, train, subject, and feature data into R;
  - combined all data into one set;
  - created a new set by selecting features that represents mean and std by its feature name in addition to the subject id and activity;
  - created the final output of column means grouping by subject and activity.

# Output Data
+ A txt file named "Assignemnt1.txt".
