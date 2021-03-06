# Function renames columns names for the allData dataframe
renameColumns <- function (names) {
    x <- gsub("...X", " X axis", names)
    x <- gsub("...Y", " Y axis", x)
    x <- gsub("...Z", " Z axis", x)
    x <- gsub(".mean", " Mean", x)
    x <- gsub(".std\\.*", " StDev", x)    
    x <- gsub("tBodyAcc", "Time Body Acc", x)
    x <- gsub("tBodyGyro", "Time Body Gyro", x)
    x <- gsub("tGravityAcc", "Time Gravity Acc", x)
    x <- gsub("fBodyAcc", "Frequency Body Acc", x)    
    x <- gsub("fBodyGyro", "Frequency Body Gyro", x) 
    x <- gsub("Jerk", " Jerk", x)
    x <- gsub("Mag", " Mag", x)
    x <- gsub("fBodyBody", "Frequency By Body ", x)
    
    return (x)
}


# Get features or variable names and reduce them to the required ones in step 2
features <- grep("[a-z]", scan("./data/features.txt", what = character()), value = TRUE)
requiredFeatures <- features[grepl(".+std.+|.+mean[[:punct:]]{2}.+", features)]
activityLabels <- grep("[a-zA-Z]", scan("./data/activity_labels.txt", what = character()), value = TRUE)
columnNames <- gsub("[[:punct:]]","\\.",requiredFeatures)

# Get train data and extract needed measurements
trainDF <- read.table("./data/train/X_train.txt", col.names = features)
trainData <- trainDF[, which(names(trainDF) %in% columnNames)]

# Get train data set subjects and activities
trainSubjects <- scan("./data/train/subject_train.txt", what = integer())
trainActivities <- activityLabels[match(scan("./data/train/y_train.txt", what = integer()), c(1:6))]

# Get test data and extract needed measurements
testDF <- read.table("./data/test/X_test.txt", col.names = features)
testData <- testDF[, which(names(testDF) %in% columnNames)]

# Get test data subjects and activities
testSubjects <- scan("./data/test/subject_test.txt", what = integer())
testActivities <- activityLabels[match(scan("./data/test/y_test.txt", what = integer()), c(1:6))]

# Combine all train data together
trainSA <- data.frame(trainSubjects,trainActivities)
allTrainData <- cbind(trainSA,trainData)
names(allTrainData)[1] <- paste("Subject")
names(allTrainData)[2] <- paste("Activity")

# Combine all test data together
testSA <- data.frame(testSubjects,testActivities)
allTestData <- cbind(testSA,testData)
names(allTestData)[1] <- paste("Subject")
names(allTestData)[2] <- paste("Activity")

# Combine test and train data
allData <- rbind(allTrainData,allTestData)
names(allData) <- renameColumns(names(allData))
save(allData,file = "allData")

library(reshape2)
# Aggregate data with the average of each variable for each activity and each subject
attach(allData)
meltData <- melt(allData, id=c("Subject","Activity")) 
aggData <- dcast(meltData,Subject + Activity ~ variable, mean)
detach(allData)

# Write averaged data to file
write.table(aggData, "./aggData.txt", row.name = FALSE)




    
   
