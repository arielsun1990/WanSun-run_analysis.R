setwd("D:/R/UCI HAR Dataset")
## step 1 read all the data
## step 1 reformat: subjects, labels, etc
## step 1 read features
## step 1 keep standard deviation & mean 
test.labels <- read.table("test/y_test.txt", col.names="label")
test.subjects <- read.table("test/subject_test.txt", col.names="subject")
test.data <- read.table("test/X_test.txt")
train.labels <- read.table("train/y_train.txt", col.names="label")
train.subjects <- read.table("train/subject_train.txt", col.names="subject")
train.data <- read.table("train/X_train.txt")
data <- rbind(cbind(test.subjects, test.labels, test.data),cbind(train.subjects, train.labels, train.data))
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
features.mean.std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
## step 2  extracts only the measurements on the mean and standard deviation for each measurement
## step 2  create increment of 2 due to the labels and subjects in the file
data.mean.std <- data[, c(1, 2, features.mean.std$V1+2)]
## step 3  read activities
## step 3  replace activities labels with label names
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
data.mean.std$label <- labels[data.mean.std$label, 2]
## step 4  appropriately labels the data set with descriptive variable names
## step 4  make a list of current names and tidy the list
## step 4  find mean for each combination
## step 5  write table.
good.colnames <- c("subject", "label", features.mean.std$V2)
good.colnames <- tolower(gsub("[^[:alpha:]]", "", good.colnames))
colnames(data.mean.std) <- good.colnames
aggr.data <- aggregate(data.mean.std[, 3:ncol(data.mean.std)],by=list(subject = data.mean.std$subject,label = data.mean.std$label),mean)
write.table(format(aggr.data, scientific=T), "tidy.txt",row.names=F, col.names=F, quote=2)
