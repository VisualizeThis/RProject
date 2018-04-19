#' Get web page data from IMDB website
#'
#' Takes in the URL as input paramater, return the entire web page
#' @param url Url of web page
#' @return Complete web page from IMDB website
#' @import rvest

get.IMDB.data <- function(url)
{
  if (!requireNamespace("xml2", quietly = TRUE))
    {
    return("Package \"xml2\" needed for this function to work. Please install it.")
    }
  else if (!requireNamespace("rvest", quietly = TRUE))
    {
      return("Package \"rvest\" needed for this function to work. Please install it.")
    }
  {
  webpage <- read_html(url)
  return(webpage)
  }
}
