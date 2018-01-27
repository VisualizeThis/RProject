assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

a1 <- sum(assignment2)
a1
b1 <- length(assignment2)
b1
c1 <- a1/b1
c1

#corrected code, accepting as input the vector assignment2

myMean <- function(assignment) { 
  return(sum(assignment)/length(assignment)) 
}
test <- myMean(assignment2)
test
