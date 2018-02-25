library("pryr")
library(data.table)

# download data from online source
#  It contains the year and average temperature of New Hampshire in (Farenheight) 
my_data <- fread('https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/nhtemp.csv')
my_data

#determine type of data
(otype(my_data))

#test using some S3 functions
head(my_data)
tail(my_data)
print(my_data)

# create S3 function that will convert the temperature to Farehneit
# return the entire row

#function to convert temperature
tocelsius <- function(year, temp )
{
  temp <-  round(((temp -32) * (5/9)), 2)
  tempstr  <- paste("In the Year", year, "the average temperature in Celsius was", temp )
  return(tempstr)
} 
my_data[3]

(y <- tocelsius(my_data[3,2], my_data[3,3]))
 
# create a class to do the temperature conversion
setClass("toC", slots = list(year = "numeric", temp = "numeric"))
setMethod("show", "toC",
          function(object) {
            temp <- 
            cat("Year", object@year, "Average temperature in Celsius =", round(((object@temp -32) * (5/9)),2), " \n")
          }
)
(temperature <- new("toC", year = 2018, temp = 88))
 

#this would not work
(temperature <- new("toC", year = my_data[3,2], temp= my_data[3,3]))

#convert dataset to class
(my_data_s4 <- my_data)
attr(my_data_s4, "class") <- "NHTemp"
otype(my_data_s4) 
# attr(my_data, "c.names") <-c("event", "time", "temperature")
# class(my_data_s4) <- "data.frame"
isS4(my_data_s4)

# Using reference to slots in the dataset
(temperature <- new("toC", year = my_data_s4$time[3], temp= my_data_s4$nhtemp[3]))
