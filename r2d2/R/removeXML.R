#' parse data from IMDB website, remove unwated xml data
#'
#' Takes in unformatted data
#' @param  wp Scraped data from IMDB web site
#' @param  csstxt css Tag to isolate
#' @return Extracted data denoted by the CSS text
#' @import xml2

removeXML.data <- function(wp,csstxt)
{
  #Using CSS selectors to scrap the rankings section
  if (csstxt =='')
    { return("Missing CSS tag")  }

  data_html <- html_nodes(wp, csstxt)
  data <- html_text(data_html)
  return(data)
}

