library("dplyr")
library("tidyr")


test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")

test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")

test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# step 1 - merging the data #

mergedata_x <- rbind(test_x,train_x)
mergedata_y <- rbind(test_y,train_y)
mergedata_subject <- rbind(test_subject,train_subject)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("./UCI HAR Dataset/features.txt")
colnames(mergedata_x) <- features[,2]
l <- grep("mean\\(\\)|std\\(\\)",colnames(mergedata_x))
mergedata_x <- mergedata_x[,l]

# Step 3
# Uses descriptive activity names to name the activities in the data set
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
mergedata_y[,1] <- activities[mergedata_y[,1],2]
colnames(mergedata_y) <- "activities"

# Step 4
# Appropriately labels the data set with descriptive variable names
colnames(mergedata_subject) <- "subject"
data_all <- cbind(mergedata_subject,mergedata_y,mergedata_x)
colnames(data_all)<-gsub("^t", "time", colnames(data_all))
colnames(data_all)<-gsub("^f", "frequency", colnames(data_all))
colnames(data_all)<-gsub("Acc", "Accelerometer", colnames(data_all))
colnames(data_all)<-gsub("Gyro", "Gyroscope", colnames(data_all))
colnames(data_all)<-gsub("Mag", "Magnitude", colnames(data_all))
colnames(data_all)<-gsub("BodyBody", "Body", colnames(data_all))


# Step 5
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

aggro_data <- group_by(data_all,subject,activities)
aggro_data <- summarise_each(aggro_data,funs(mean))

write.table(aggro_data, "Output.txt", row.name=FALSE)