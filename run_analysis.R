#Clear environment
rm(list=ls())

#Set the WD to the folder w/ the data
setwd(dir = "~/R Working Directory/UCI HAR Dataset")
#Import test data into variable
testSet <- read.table("X_test.txt",header = F)
labels <- read.table("features.txt",header= F)
#Assign proper names to variables (Requirement #4)
names(testSet) <- labels[,2]
#Read subject data and apply variable name
testSub <- read.table("subject_test.txt",header = F)
#Read activity data and apply variable name
names(testSub) <- "Subject"
testAct <- read.table("Y_test.txt",header = F)
names(testAct) <- "Activity"
#Merge columns into one
test <- cbind(testSet,testSub,testAct)

#Import training data into variable
#Apply variables names (Requirement #4)
trainSet <- read.table("X_train.txt",header = F)
names(trainSet) <- labels[,2]
#Process for training the same as above for test
trainSub <- read.table("subject_train.txt",header = F)
names(trainSub) <- "Subject"
trainAct <- read.table("Y_train.txt",header = F)
names(trainAct) <- "Activity"
#Merge columns into one
training <- cbind(trainSet,trainSub,trainAct)

#Union between train and test (Requirement #1)
dat <- rbind(training,test)
#Extract measures of mean and standard dev (Requirement #2)
colIndex <- which(grepl("^.+(mean|std)",names(dat)))
#Add back columns for subject and activity
colIndex <- append(colIndex,c(562,563))
datTrim <-dat[,colIndex]

#Descriptive names for activity (Requirement #3)
datTrim[,"Activity"] <- factor(datTrim[,"Activity"],1:6,c("Walking","Walking Up","Walking Down", "Sitting","Standing","Laying"),ordered = T)

#Create long data frame, then cast the mean function over it
#grouping by subject and activity (Requirement #5)
library(reshape2)
long <- melt(datTrim,id.vars = c("Subject","Activity"))
longAve <- dcast(long,Subject+Activity ~ variable,mean)
longAve <- melt(longAve,id.vars = c("Subject","Activity"))
write.table(longAve,file = "Average by Subject and Activity.txt", sep = "\t",row.names=F,col.names = T)

