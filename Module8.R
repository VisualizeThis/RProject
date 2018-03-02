library("pryr")
library(data.table)

# download dataset from online source
my_data <- fread('https://instructure-uploads.s3.amazonaws.com/account_130000000086643/attachments/52433435/Dataset.txt?response-content-disposition=inline%3B%20filename%3D%22Dataset-1.txt%22%3B%20filename%2A%3DUTF-8%27%27Dataset%252D1.txt&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJFNFXH2V2O7RPCAA%2F20180302%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20180302T005915Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=251932170f33a37fa72a232f3aace4b95092fe75a4eb15bfa7f52ac87ff74299')
str(my_data)

#convert the Sex column to a factor
my_data$Sex <- as.factor(my_data$Sex)
my_data
str(my_data)

#Create an output file using CAT with the mean of sex attribute.
cat("The mean of the Sex attribute is:\n", file = "output1.txt")
cat(mean(as.numeric(my_data$Sex)), file="output1.txt", append=TRUE)

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
