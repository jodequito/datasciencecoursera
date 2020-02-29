## readIn data and dpylr
library(dplyr)
d1 <- "./UCI HAR Dataset/train/X_train.txt"
xtrain<- read.table(d1)
d1y<-"./UCI HAR Dataset/train/y_train.txt"
ytrain<- read.table(d1y)
d2 <- "./UCI HAR Dataset/test/X_test.txt"
xtest<- read.table(d2)
d2y<-"./UCI HAR Dataset/test/y_test.txt"
ytest<- read.table(d2y)
headlinesx <- read.table("./UCI HAR Dataset/features.txt")
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
##add activitys to y
ytrain <- merge(ytrain, activity, by = "V1", all = TRUE)
ytest <- merge(ytest, activity, by = "V1", all = TRUE)
##Merge X with Y for Train and Test set and label the table
xytrain<- xtrain%>%
  as_tibble()%>%
  mutate(Label = ytrain$V1, activity = ytrain$V2, TestTrain = "Train")
xytest<- xtest%>%
  as_tibble()%>%
  mutate(Label = ytest$V1, activity = ytest$V2, TestTrain = "Test")
## Merge Train and Testset
xytraintest <- union(xytrain, xytest)

## identify colnames with mean and standard deviation
mean_sel<- grep("*mean*", headlinesx$V2)
std_sel<- grep("*std*", headlinesx$V2)
## select relevant columns and rename with attribute
xyfinal<-xytraintest%>%
  as_tibble%>%
  select(mean_sel, std_sel, "Label", "activity", "TestTrain")
colnames(xyfinal)<-c(grep("*mean*", headlinesx$V2, value = TRUE), grep("*std*", headlinesx$V2, value = TRUE), "Label", "activity", "TestTrain")
View(xyfinal)

## generate the dataset with the means for each variable group by the activity(walking, )
avgxyfinal <- xyfinal%>%
  group_by(Label, activity)%>%
  summarise_if(is.numeric, mean)
View(avgxyfinal)
