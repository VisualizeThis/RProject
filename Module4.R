# Module 4
#library for side by side histogram
library(lattice)

Freq <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
BloodP <- c(103,87,32,42,59,109,78,205,135,176)
First <- c("bad","bad","bad","bad","good","good","good","good","NA","bad")
Second <- c("low","low","high","high","low","low","high","high","high","high")
Final <- c("low","high","low","high","low","high","low","high","high","high")

#create data frame
Pat_df <- data.frame(Freq,BloodP,First,Second,Final)
Pat_df

#boxplots 

boxplot(Freq ~ Final, data=Pat_df, col="lightblue",
        xlab = "Doctor's Decision",
        ylab = "Frequency of Annual Visits", main = "Hospital Admission")
boxplot(BloodP ~ Final, data=Pat_df, col="red",
          xlab =  "Doctor's Decision",
        ylab = "Blood Pressure", main = "Hospital Admission")


#histograms

histogram(~BloodP | Final,xlab = "Blood Pressure",col = "orange",border = "red",
     ylab = "Pressure", main = "Histogram of Blood Pressure")

histogram(~Freq | Final,xlab = "",col = "green",border = "red",
     ylab = "Frequency", main = "Annual Hospital Visits")

