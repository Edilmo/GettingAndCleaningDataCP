x.test.raw <- NULL
y.test.raw <- NULL
subject.test.raw <- NULL

x.train.raw <- NULL
y.train.raw <- NULL
subject.train.raw <- NULL

activities <- NULL
merge.raw <- NULL
merge.filtered <- NULL
data.final <- NULL

load_data <- function(){
        features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
        
        x.test.raw <<- read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE, col.names = features[[2]])
        y.test.raw <<- read.table("UCI HAR Dataset/test/Y_test.txt", stringsAsFactors = FALSE, col.names = c("activity"))
        subject.test.raw <<- read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE, col.names = c("subject"))

        x.train.raw <<- read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE, col.names = features[[2]])
        y.train.raw <<- read.table("UCI HAR Dataset/train/Y_train.txt", stringsAsFactors = FALSE, col.names = c("activity"))
        subject.train.raw <<- read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE, col.names = c("subject"))
}

merge_data <- function(){
        x.raw <- rbind(x.test.raw,x.train.raw)
        y.raw <- rbind(y.test.raw,y.train.raw)
        subject.raw <- rbind(subject.test.raw,subject.train.raw)
        merge.raw <<- cbind(subject.raw,y.raw,x.raw)

        activities <<- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
        merge.raw[2] <<- factor(merge.raw[[2]], activities[[1]], activities[[2]])
}

filter_data <- function(){
        merge.means <- apply(merge.raw[,3:563],2,mean)
        merge.sds <- apply(merge.raw[,3:563],2,sd)
        filter.function <- function(r){
                pass <- abs(r - merge.means)
                pass <- (pass <= merge.sds)
                any(pass)
        }
        row.indices.logical <- apply(merge.raw[,3:563],1,filter.function)
        row.indices <- which(row.indices.logical)
        merge.filtered <<- merge.raw[row.indices, ]
}

generate_tidy_data <- function(){
        load_data()
        merge_data()
        filter_data()
        data.final <<- split(merge.filtered,merge.filtered[,c(1,2)],drop = TRUE)
        data.final <<- sapply(data.final,function(df){
                t <- apply(df[,3:563], 2, mean)
                c(unlist(df[1,1:2]),unlist(t))
                })
        data.final <<- t(data.final)
        data.final <<- data.frame(data.final)
        data.final[2] <<- factor(data.final[[2]], activities[[1]], activities[[2]])
        write.table(data.final,file = "data.final.txt", row.names = FALSE)
}
