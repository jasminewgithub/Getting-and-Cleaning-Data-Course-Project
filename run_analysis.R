setwd("C:/Users/Shuai/Desktop/UCI HAR Dataset")

# 1. Merges the training and the test sets to create one data set

# read from test set and combine into one test set
xtest <- read.table("./test/X_test.txt", sep = "")
ytest <- read.table("./test/y_test.txt", sep = "")
subtest <- read.table("./test/subject_test.txt", sep = "")

test <- cbind(subtest, ytest, xtest)
names(test)[1:2] <- c("subject","activity")

# read from training set and combine into one test set
xtrain <- read.table("./train/X_train.txt", sep = "")
ytrain <- read.table("./train/y_train.txt", sep = "")
subtrain <- read.table("./train/subject_train.txt", sep = "")

train <- cbind(subtrain, ytrain, xtrain)
names(train)[1:2] <- c("subject","activity")


# combine test and set into one dataset
all <- rbind(test, train)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement

# read all feature names
features <- read.table("./features.txt",sep = "")[,2]

# extract the index of columns that are mean and std
mean_std_col_index <- grepl("mean", features) | grepl("std", features)

# extract the columns with mean and std as well as activity id and subject id
all_mean_std <- all[,c(TRUE, TRUE, mean_std_col_index)]



# 3. Uses descriptive activity names to name the activities in the data set

ylabels <- read.table("./activity_labels.txt", sep = "")[, 2]

all_mean_std$activity <- factor(all_mean_std$activity, labels = ylabels)

# 4.Appropriately labels the data set with descriptive variable names

colnames(all_mean_std) <- c('subject', 'activity', features[mean_std_col_index])


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

library(tidyverse)

tidy_data <- all_mean_std %>% group_by(subject, activity) %>% summarise(across(, ~mean(.)))

write.table(tidy_data, file = "Assignment1.txt", row.names = FALSE)









