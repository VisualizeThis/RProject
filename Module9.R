library(data.table)
library(ggplot2)
library(lattice)

# download data from online source
#  It contains the year and average temperature of New Hampshire in (Farenheight) 
myData <- data.table(fread('https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/Ecdat/Diamond.csv'))

str(myData)
#simple plot
plot(myData$carat, myData$price, col="red", main = "Diamond Prices by Carat",
      type="p", xlab="Carat", ylab="Price", cex=.8) 

qplot(carat, price, data=my_data, color=clarity, size=carat,
      xlab="Carat", ylab="Price")
?plot

densityplot(~carat,main="Density Plot", xlab="Popular Carats",data = myData)
?bwplot
bwplot(price ~ carat | factor(clarity), myData, layout=c(5,1))

#using Lattice 
?stripplot
stripplot(price ~ factor(carat), 
          data = myData, 
          jitter.data = F, 
          alpha = 0.6, 
          cex=.8, 
          pch=c(1,20),
          groups=clarity,
          main = "Price of Diamonds by Carat", 
          xlab = "Carat", ylab = "Price")

# ggplot
ggplot(myData, aes(x=carat, y=price, color=clarity)) + geom_point() 
?ggplot

ggplot(myData, aes(x=carat, y=price, color=clarity)) + geom_point() + geom_smooth(se=FALSE)

ggplot(myData, aes(x=carat, y=price, color=carat)) + geom_point() + facet_wrap(~ clarity) +
   labs(title = "Diamond Prices by Clarity")

