# Reading the data


X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 1. Merges the training and the test sets to create one data set.
X_TestTrain <- rbind(X_train, X_test)
Y_TestTrain <- rbind(Y_train, Y_test)
Subject_TestTrain <- rbind(Subject_train, Subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
selected_var <- features[grep("mean\\(\\)|std\\(\\)", features[,2]),]
X_TestTrain <- X_TestTrain[,selected_var[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
colnames(Y_TestTrain) <- "activity"
Y_TestTrain$activity_labels <- factor(Y_TestTrain$activity, labels = as.character(activity_labels[,2]))
activity_labels <- Y_TestTrain[,-1]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(X_TestTrain) <- features[selected_var[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(Subject_TestTrain) <- "subject"
total <- cbind(X_TestTrain, activity_labels, Subject_TestTrain)
total_mean <- total %>% group_by(activity_labels, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)

tidydata <- read.table("./UCI HAR Dataset/tidydata.txt")

head(tidydata)
