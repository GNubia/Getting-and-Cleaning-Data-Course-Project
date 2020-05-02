
# The Data Set information

The data set presented used in this assignment was collected from the accelerometers from the Samsung 
Galaxy S smartphone where a group with 30 volunters (age of 19-48 years) performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a Samsung Galaxy S II. You can find more information at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# This data set includes the following files:

run_analysis.R - The script of this project

codebook.md - Document describing the variables

tidydata.txt - Document containing tidy data

# Script

1. Merges the training and the test sets to create one data set.
 
The data training and test labels (X_train, X_test) training and test set (Y_train, Y_test) were merged using rbind() function,        which combines vector, matrix or data frame by rows and were storaged in the variables X_TestTrain and Y_TestTrain respectivaly.
As well as the subject train and test were merged and storaged in the Subject_TestTrain variable.
    
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 
 The mean and standad deviation measurements were extracted using grep() function, which match and replace patterns. The result was storeged in the new variable X_TestTrain.
 
 3. Uses descriptive activity names to name the activities in the data set.
 4. Appropriately labels the data set with descriptive variable names.
 
 
 To name the activitie and labels the data with descriptive variable names, the file activity_label.txt was used. To achieve it the following functions was used: colnames() and cbinds(), group_by(), and summarize_each().
 

 5. From the data set in step 4, creates a second, independent tidy data set with the 
 average of each variable for each activity and each subject.
 
 For this new tidy data set, the function write.table().
