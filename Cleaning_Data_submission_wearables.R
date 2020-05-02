library(dplyr)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "Dataset.zip")
unzip("Dataset.zip")

# load the train date including subject list, sensor data and predicted activity
subjecttrain <-read.table("./UCI HAR Dataset/train/subject_train.txt",
                          col.names = c("subject"))
xtrain <-read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <-read.table("./UCI HAR Dataset/train/y_train.txt",
                           col.names = c("activity"))
train <-cbind(subjecttrain, ytrain, xtrain)

# load the test data including subject list, sensor data and predicted activity

subjecttest <-read.table("./UCI HAR Dataset/test/subject_test.txt",
                         col.names = c("subject"))
xtest <-read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <-read.table("./UCI HAR Dataset/test/y_test.txt",
                          col.names = c("activity"))
test <-cbind(subjecttest, ytest, xtest)

# merge test and train datasets
testtrain = rbind(test, train)

#correct labelling
#y labels
activitylabels <-read.table("./UCI HAR Dataset/activity_labels.txt",
                      col.names = c("activityid", "activityname"))
#xlabels
features <-read.table("./UCI HAR Dataset/features.txt",
                      col.names = c("featureid", "featurename"))

features <- as.character(features[ ,2])  ##Make the featurename a string
datalabels <- c("subject", "activityname", features)  
colnames(testtrain) <-c("subject", "activity", features)

suppressWarnings(labeleddata <- merge(testtrain, activitylabels, by.x="activity", by.y="activityid", all = TRUE))
labeledsorteddata <-labeleddata[c(2,564, 3:563)]
# select relevant data
keepreduced <- grep("subject|activityname|mean\\(|std\\(",datalabels, value = FALSE)
datameanstd <-labeledsorteddata[,keepreduced]
rm(fileURL, test, train, subjecttest, subjecttrain, subjectxtest, xtrain, ytest,
   ytrain, labeleddata, labeledsorteddata, testtrain)
#rename the columns
names(datameanstd) <- gsub("activityname", "activity", names(datameanstd))
names(datameanstd) <- gsub("BodyBody", "Body", names(datameanstd))
names(datameanstd) <- gsub("Acc", "Acceleration", names(datameanstd))
names(datameanstd) <- gsub("Mag", "Magnitude", names(datameanstd))
names(datameanstd) <- gsub("Gyro", "Angular", names(datameanstd))
names(datameanstd) <- gsub("^t", "Time", names(datameanstd))
names(datameanstd) <- gsub("^f", "Frequency", names(datameanstd))
names(datameanstd) <- gsub("std", "StdDev", names(datameanstd))
names(datameanstd) <- gsub("mean", "Mean", names(datameanstd))
names(datameanstd) <- gsub("-X", "-X-Axis", names(datameanstd))
names(datameanstd) <- gsub("-Y", "-Y-Axis", names(datameanstd))
names(datameanstd) <- gsub("-Z", "-Z-Axis", names(datameanstd))
write.table(datameanstd, file = "tidy_wearables.txt", row.names = FALSE)

avg_data_per_activity_subject <- datameanstd%>%
  group_by(subject, activity)%>%
  summarise_if(is.numeric, mean)
View(avg_data_per_activity_subject)
write.table(avg_data_per_activity_subject, file = "tidy_wearables_AVG.txt", row.names = FALSE)

