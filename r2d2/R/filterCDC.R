#' This function the CDC dataset as input and apply year and state filters
#'
#' Takes in CDC dataset, year, state as input paramaters.  Also remove diseases "All Causes"
#' @param ds CDC dataset,
#' @param year year to filter data
#' @param state US State Which state should the filter be applied
#' @return filtered dataset
#' @export
filter.CDC.data <- function(ds, year, state){
  if(year=='') return("Invalid Year selection")
  if(state=='') return("Invalid State selection")
  df <- subset(ds,Year==year & State==state & Cause != 'All Causes')
  return(df)
}
