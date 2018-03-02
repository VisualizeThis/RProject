# module 8 Assignment
library(pryr)
library(data.table)
library(dplyr)

# download dataset from online source
my_data <- data.frame(fread('https://instructure-uploads.s3.amazonaws.com/account_130000000086643/attachments/52433435/Dataset.txt?response-content-disposition=inline%3B%20filename%3D%22Dataset-1.txt%22%3B%20filename%2A%3DUTF-8%27%27Dataset%252D1.txt&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJFNFXH2V2O7RPCAA%2F20180302%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20180302T005915Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=251932170f33a37fa72a232f3aace4b95092fe75a4eb15bfa7f52ac87ff74299'))
my_data <- fread('https://instructure-uploads.s3.amazonaws.com/account_130000000086643/attachments/52433435/Dataset.txt?response-content-disposition=inline%3B%20filename%3D%22Dataset-1.txt%22%3B%20filename%2A%3DUTF-8%27%27Dataset%252D1.txt&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJFNFXH2V2O7RPCAA%2F20180302%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20180302T005915Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=251932170f33a37fa72a232f3aace4b95092fe75a4eb15bfa7f52ac87ff74299')

str(my_data)
my_data

# using the DPLYR function to average the Grades by Sex
avg_by_sex <- ddply(my_data, .(Sex), transform, mean = mean(Grade))
avg_by_sex

#get a summary of the data
summary_by_sex <- ddply(my_data, .(Sex), summarise, avgmean = mean(Grade))
summary_by_sex

# %>% is passing data from from function to function
#I wonder why I cannot get grouping to work here?
avg_grades <- my_data %>%
  group_by(Sex) %>%
  transform(avg_grades = mean(Grade))


#Create an output file using CAT with the mean of sex attribute.
cat("The average grades categorized by the Sex attribute is:\n", file = "output1.txt")
write.table(summary_by_sex,file="output1.txt", append = TRUE, col.names = FALSE)

#use the Scan function to read same data frame
my_names<- read.table("https://instructure-uploads.s3.amazonaws.com/account_130000000086643/attachments/52433435/Dataset.txt?response-content-disposition=inline%3B%20filename%3D%22Dataset-1.txt%22%3B%20filename%2A%3DUTF-8%27%27Dataset%252D1.txt&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJFNFXH2V2O7RPCAA%2F20180302%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20180302T005915Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=251932170f33a37fa72a232f3aace4b95092fe75a4eb15bfa7f52ac87ff74299", 
                header=T,sep=",")
str(my_names)
# find the columns using Grep of the names with "i"
for (j in 1:nrow(my_names)) 
  { 
  #  create a vector of the row numbers where "i" is found in name
  sel_names <- grep(pattern = "i",my_names$Name ,ignore.case = T)
}

str(sel_names)
#create a CSV file of the names using the position vector identified by GREP

write.csv(my_names[c(sel_names),1],'output2.csv', row.names=FALSE)

?grepl
#using the solution provided
new_names <-  subset(my_names,grepl("i", ignore.case = FALSE,my_names$Name))
new_names
write.csv(new_names,'output3.csv', row.names=FALSE)
