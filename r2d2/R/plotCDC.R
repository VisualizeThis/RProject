#' This function plots a barchart
#'
#' Takes in filtered CDC dataset
#' @param ds CDC dataset,
#' @return null
#' @export
#' @import ggplot2
plot.CDC.data <- function(ds){
  ch.title <- paste("Main Causes of Deaths in", ds[1,4], "for the year",ds[1,1])
  g <- ggplot2::ggplot(ds,ggplot2::aes(Cause, Deaths,fill= Cause ))
  g +  ggplot2::geom_bar(stat="identity", position = 'dodge') +
    ggplot2::theme(axis.text.x=ggplot2::element_text(angle=90,hjust=1)) +
    ggplot2::ggtitle(ch.title)
}