#' Private function that parses individual columns
#'
#' Takes in unformatted datas
#' @param  str regular expression string
#' @param  data css Tag where data is extracted
#' @return vector of specific attribute from IMDB data
#' @import xml2

parseCols.data <- function(data, str)
{
  col1 <-  regexec(str, data)
  col1 <- regmatches(data,col1)
  col1 <- sapply(col1,function(x) x[2])
  return(col1)
}
