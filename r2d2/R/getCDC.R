#' Get the dataset from CDC website that contains the disease which is the leading cause of death
#'
#' Takes in no paramaters, get the data and rename the columns
#' @param null
#' @return Complete dataset from CDC website
#' @export
#' @import data.table::fread

get.CDC.data <- function()
{
  url <- 'https://data.cdc.gov/api/views/bi63-dtpu/rows.csv?accessType=DOWNLOAD'
  dat <- data.table::fread(url)
  names(dat)  <-c('Year','CauseName','Cause','State','Deaths',"AgeAdjust")
  return(dat)
}