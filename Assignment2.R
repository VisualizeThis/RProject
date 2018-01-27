#assignment 2

library(data.table)
library(ggplot2)

Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Berine")
Name

ABC.poll.results <- c(4, 62, 51, 21, 2, 14, 15)
CBS.poll.results <- c(12, 75, 43, 19, 1, 21, 19)

poll.results <- cbind(Name,ABC.poll.results,CBS.poll.results)
poll.results

poll.df <- data.frame(Name,ABC.poll.results,CBS.poll.results)
poll.df

poll.df[,2:3]

#the following statement generates an error because the function is defunction from release 3.0 onwards
mean(poll.df[ ,2:3], na.rm = TRUE)

#the following functions can be used to determine the mean
lapply(poll.df, mean, na.rm=TRUE)
lapply(poll.df[ ,2:3], mean, na.rm=TRUE)

sapply(poll.df, mean, na.rm=TRUE)
sapply(poll.df[ ,2:3], mean, na.rm=TRUE)

colMeans(poll.df[ ,2:3])


a <- c(1,2,3)
b <- c(10,20,30)
c <- c(100,200,300)
d <- c(1000,2000,3000)

C.df <- data.frame(a,b,c,d)
C.df

B <- matrix(c(1,10,100,1000,1,10,100,1000,1,10,100,1000,1,10,100,1000),nrow=4)
B
as.matrix(C.df)%*%B

y <- matrix(c(1,2,3,4),nrow=2,ncol=2)
y

C<- as.matrix(C.df)
C
#the mean function was depricated
mean(C)

#the following can be used to determine the mean of the matrix
colMeans(as.data.frame(C))

#  ggplot using poll.df

ggplot(data=poll.df) +
  geom_point(aes(x = Name, y = ABC.poll.results ),
             colour = 'red') +
  geom_point(aes(x = Name, y = CBS.poll.results),
             colour = 'blue') +
  ggtitle('Elections Polling Results') +
  xlab('Candidates') +
  ylab('TV Network Polls')

#improved ggplot using pivoted data and line chart.

poll <- read.csv("Primary.csv")
poll

ggplot(data=poll, aes(x=Candidate, y=Poll, group=Network, colour=Network)) +
  geom_line()+
  geom_point() +
  scale_color_brewer(palette="Dark2") +
  ggtitle('2016 Primary Polling Results') +
  xlab('Candidates') +
  ylab('TV Network Polls') +
  theme(legend.position="top")
