#' This function plots a barchart
#'
#' Takes in filtered CDC dataset
#' @param ds CDC dataset,
#' @return null
#' @export
#' @import ggplot2
plot.CDC.data <- function(ds){
  ch.title <- paste("Main Causes of Deaths in", ds[1,4], "for the year",ds[1,1])
  g <- ggplot(ds,aes(Cause, Deaths,fill= Cause ))
  g +  geom_bar(stat="identity", position = 'dodge') +
    theme(axis.text.x=element_text(angle=90,hjust=1)) +
    ggtitle(ch.title)
}