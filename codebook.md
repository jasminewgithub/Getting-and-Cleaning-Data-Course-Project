The `run_analysis.R` script will run as follows:

### Step 1: Merges the training and the test sets to create one data set

+ `xtest`, `ytest`, `subtest` are read from `/test` folder
  - `xtest` is read from `/test/X_test.txt`, it consists of 2947 rows, 561 columns;
  - `ytest` is read from `/test/y_test.txt`, it consists of 2947 rows, 1 columns;
  - `subtest` is read from `/test/subject_test.txt`, it consists of 2947 rows, 1 columns;

+ combine `xtest`, `ytest`, `subtest` into dataset `test` using column bind `cbind()`;
+ assign column names to columns of `test` represent "subject" and "activity";

+ `xtrain`, `ytrain`, `subtrain` are read from `/train` folder;
  - `xtrain` is read from `/train/X_train.txt`, it consists of 7352 rows, 561 columns;
  - `ytest` is read from `/test/y_test.txt`, it consists of 7352 rows, 1 columns;
  - `subtest` is read from `/test/subject_test.txt`, it consists of 7352 rows, 1 columns;

+ combine `ytrain`, `ytrain`, `subtrain` into dataset `train` using column bind `cbind()`;
+ assign column names to columns of `train` represent "subject" and "activity";

+ combine `test` and `train` into one dataset `all` using row binding `rbind();

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement

+ read all features names from `/features.txt` and stored in `features`, it has 561 feature names.
+ identify the logical index of features that represent mean and std using `grepl` function, and assigned to `mean_std_col_index`, it has ;
+ extract columns from `all` using the logical index created by previous step and assigned to variable `all_mean_std`, and also keep the column that represent 'subject' and 'activity'; `all_mean_std` has 10299 rows and 81 columns.


### Step 3: Uses descriptive activity names to name the activities in the data set

+ create `ylabels` by reading from `/activity_labels.txt`, it consists of 6 activity names.
+ remap the numeric representation of activity by its name stored in `ylabels` using function `factor` and assigned the labels to `ylabels`.


### Step 4: Appropriately labels the data set with descriptive variable names

+ assigned the selected feature names `features[mean_std_col_index]` to column names of `all_mean_std`;

### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

> Package `tidyverse:dplyr` was used in this step.
+ create a data set named `tidy_data` by
  - group by `subject` and `activity`;
  - summarize all other columns to their means;
  - assigned the output to `tidy_data`.

+ `tidy_data` has 180 rows and 81 columns.

+ save the `tidy_data` to `Assignment1.txt` 

