## Establish filePath ##
wd <- getwd()
directory <- "UCI HAR Dataset"
filePath <- paste(wd,directory, sep="/")

## Load Generic Data ##

actNamesPath <- paste(filePath,"activity_labels.txt",sep="/")
actNames <- read.table(actNamesPath, sep = " ", col.names = c("Activity.ID", "Activity.Name"))

colNamesPath <- paste(filePath,"features.txt",sep="/")
colNames <- read.table(colNamesPath, sep = " ", col.names = c("ColPos", "Name"))


## Load test Data ##

testPath <- paste(filePath,"test",sep="/")

subjectTestPath <- paste(testPath,"subject_test.txt", sep = "/")
subjectTest <- read.table(subjectTestPath, sep = " ", col.names = c("Subject"))

activityTestPath <- paste(testPath,"y_test.txt", sep = "/")
activityTest <- read.table(activityTestPath, sep = " ", col.names = c("Activity.ID"))
    
sub.act.test <- cbind(subjectTest,activityTest, data.frame(Type = "test"))

testDataPath <- paste(testPath,"X_test.txt", sep = "/")
testData <- read.table(testDataPath, sep = "", col.names = colNames$Name)
test <- cbind(sub.act.test,testData)

## Load train Data ##

trainPath <- paste(filePath,"train",sep="/")

subjectTrainPath <- paste(trainPath,"subject_train.txt", sep = "/")
subjectTrain <- read.table(subjectTrainPath, sep = " ", col.names = c("Subject"))

activityTrainPath <- paste(trainPath,"y_train.txt", sep = "/")
activityTrain <- read.table(activityTrainPath, sep = " ", col.names = c("Activity.ID"))

sub.act.train <- cbind(subjectTrain,activityTrain, data.frame(Type = "train"))

trainDataPath <- paste(trainPath,"X_train.txt", sep = "/")
trainData <- read.table(trainDataPath, sep = "", col.names = colNames$Name)
train <- cbind(sub.act.train,trainData)

## Merge all Data ##
all <- rbind(test,train)
all <- merge(all,actNames,by.x="Activity.ID", by.y= "Activity.ID", all = F)

# Get Requested Data
subset <-{ c("Subject", "Activity.ID", "Activity.Name", "Type" 
            
            , "tBodyAcc.mean...X", "tBodyAcc.mean...Y", "tBodyAcc.mean...Z"
            , "tBodyAcc.std...X", "tBodyAcc.std...Y", "tBodyAcc.std...Z"
            
            , "tGravityAcc.mean...X", "tGravityAcc.mean...Y", "tGravityAcc.mean...Z"
            , "tGravityAcc.std...X", "tGravityAcc.std...Y", "tGravityAcc.std...Z"
            
            , "tBodyAccJerk.mean...X", "tBodyAccJerk.mean...Y", "tBodyAccJerk.mean...Z"
            , "tBodyAccJerk.std...X", "tBodyAccJerk.std...Y", "tBodyAccJerk.std...Z"
            
            , "tBodyGyro.mean...X", "tBodyGyro.mean...Y", "tBodyGyro.mean...Z"
            , "tBodyGyro.std...X", "tBodyGyro.std...Y", "tBodyGyro.std...Z"
            
            , "tBodyGyroJerk.mean...X", "tBodyGyroJerk.mean...Y", "tBodyGyroJerk.mean...Z"
            , "tBodyGyroJerk.std...X", "tBodyGyroJerk.std...Y", "tBodyGyroJerk.std...Z"
            
            , "tBodyAccMag.mean..", "tBodyAccMag.std.."
            
            , "tBodyAccJerkMag.mean..", "tBodyAccJerkMag.std.."
            
            , "tGravityAccMag.mean..", "tGravityAccMag.std.."
                        
            , "tBodyGyroMag.mean..", "tBodyGyroMag.std.."
            
            , "tBodyGyroJerkMag.mean..", "tBodyGyroJerkMag.std.."
            
            , "fBodyAcc.mean...X", "fBodyAcc.mean...Y", "fBodyAcc.mean...Z"
            , "fBodyAcc.std...X", "fBodyAcc.std...Y", "fBodyAcc.std...Z"
            
            , "fBodyAccJerk.mean...X", "fBodyAccJerk.mean...Y", "fBodyAccJerk.mean...Z"
            , "fBodyAccJerk.std...X", "fBodyAccJerk.std...Y", "fBodyAccJerk.std...Z"
            
            , "fBodyGyro.mean...X", "fBodyGyro.mean...Y", "fBodyGyro.mean...Z"
            , "fBodyGyro.std...X", "fBodyGyro.std...Y", "fBodyGyro.std...Z"
            
            , "fBodyAccMag.mean..", "fBodyAccMag.std.."
            
            , "fBodyBodyAccJerkMag.mean..", "fBodyBodyAccJerkMag.std.."
            
            , "fBodyBodyGyroMag.mean..", "fBodyBodyGyroMag.std.."
            
            , "fBodyBodyGyroJerkMag.mean..", "fBodyBodyGyroJerkMag.std.."
            )
    }
ds <- all[,subset]
# Fix Names
colnames(ds) <- gsub("  ","",gsub("\\."," ",colnames(ds)))

## Result ##

# Average per Subject and Activity
ds.average <- aggregate(ds[,5:length(ds)], by = list(ds$Subject, ds[,"Activity Name"]), FUN = mean)
# order Dataset by Subject and Activity
ds.average <- ds.average[order(ds.average[,1], ds.average[,2]),]
# Give a descriptive Name to variables:
colnames(ds.average) <-{ c("Subject", "Activity Name"
                          , "tBodyAcc mean-X", "tBodyAcc mean-Y", "tBodyAcc mean-Z"
                          , "tBodyAcc std-X", "tBodyAcc std-Y", "tBodyAcc std-Z"
                          
                          , "tGravityAcc mean-X", "tGravityAcc mean-Y", "tGravityAcc mean-Z"
                          , "tGravityAcc std-X", "tGravityAcc std-Y", "tGravityAcc std-Z"
                          
                          , "tBodyAccJerk mean-X", "tBodyAccJerk mean-Y", "tBodyAccJerk mean-Z"
                          , "tBodyAccJerk std-X", "tBodyAccJerk std-Y", "tBodyAccJerk std-Z"
                          
                          , "tBodyGyro mean-X", "tBodyGyro mean-Y", "tBodyGyro mean-Z"
                          , "tBodyGyro std-X", "tBodyGyro std-Y", "tBodyGyro std-Z"
                          
                          , "tBodyGyroJerk mean-X", "tBodyGyroJerk mean-Y", "tBodyGyroJerk mean-Z"
                          , "tBodyGyroJerk std-X", "tBodyGyroJerk std-Y", "tBodyGyroJerk std-Z"
                          
                          , "tBodyAccMag mean", "tBodyAccMag std"
                          
                          , "tBodyAccJerkMag mean", "tBodyAccJerkMag std"
                          
                          , "tGravityAccMag mean", "tGravityAccMag std"
                          
                          , "tBodyGyroMag mean", "tBodyGyroMag std"
                          
                          , "tBodyGyroJerkMag mean", "tBodyGyroJerkMag std"
                          
                          , "fBodyAcc mean-X", "fBodyAcc mean-Y", "fBodyAcc mean-Z"
                          , "fBodyAcc std-X", "fBodyAcc std-Y", "fBodyAcc std-Z"
                          
                          , "fBodyAccJerk mean-X", "fBodyAccJerk mean-Y", "fBodyAccJerk mean-Z"
                          , "fBodyAccJerk std-X", "fBodyAccJerk std-Y", "fBodyAccJerk std-Z"
                          
                          , "fBodyGyro mean-X", "fBodyGyro mean-Y", "fBodyGyro mean-Z"
                          , "fBodyGyro std-X", "fBodyGyro std-Y", "fBodyGyro std-Z"
                          
                          , "fBodyAccMag mean", "fBodyAccMag std"
                          
                          , "fBodyAccJerkMag mean", "fBodyAccJerkMag std"
                          
                          , "fBodyGyroMag mean", "fBodyGyroMag std"
                          
                          , "fBodyGyroJerkMag mean", "fBodyGyroJerkMag std"
                    )}
# Create file
write.table(ds.average, file = "result.txt", row.names = F)
