#' Scrapes data from IMDB website, remove unwanted data and package relevant data in a dataset
#'
#' Takes in no paramaters, get the data and rename the columns
#' @param p1 Input parameter valid value are 'movies' 'tvshows'
#' @return Formatted dataset of Top 100 movies or tvshows
#' @export
#' @import xml2

gettopshows <- function(p1)
{

  topmovieurl <- 'http://www.imdb.com/chart/top?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=4da9d9a5-d299-43f2-9c53-f0efa18182cd&pf_rd_r=0Y0FT9F0HC2DZF44R0C3&pf_rd_s=right-4&pf_rd_t=15506&pf_rd_i=moviemeter&ref_=chtmvm_ql_3'
  toptvurl <- 'http://www.imdb.com/chart/toptv?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=4da9d9a5-d299-43f2-9c53-f0efa18182cd&pf_rd_r=0Y0FT9F0HC2DZF44R0C3&pf_rd_s=right-4&pf_rd_t=15506&pf_rd_i=moviemeter&ref_=chtmvm_ql_6'

  if (p1 =='movies'){
    url <- topmovieurl
    typeofmedia <- 'movies'
  } else if (p1 =='tvshows') {
    url <- toptvurl
    typeofmedia <- 'tvshows'
  } else
    return('Invalid selection, options are "movies" or "tvshows"')


  imdbData <- get.IMDB.data(url)

  cssCol <- '.titleColumn'
  cssCol2 <-  '.imdbRating'

  regespName <- '.\n      (.*?)\n'
  movieNames <- parseCols.data(removeXML.data(imdbData,cssCol),regespName)
  movieNames

  regexpRank <- '\n      (.*?).\n'
  ranking <- parseCols.data(removeXML.data(imdbData,cssCol),regexpRank)
  ranking

  regexpYear <- "\n        \\((.*?)\\)\n"
  year <- parseCols.data(removeXML.data(imdbData,cssCol),regexpYear)
  year

  regexpIMDB <- "\n            (.*?)\n"
  IMDBrtng <- parseCols.data(removeXML.data(imdbData,cssCol2),regexpIMDB)
  IMDBrtng

  moviesds <- as.data.frame(cbind(ranking, movieNames, year, IMDBrtng))
  colnames(moviesds)[colnames(moviesds)=="movieNames"] <- typeofmedia
  return(moviesds)
}
