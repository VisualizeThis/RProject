#' Scrapes data from IMDB website, remove unwanted data and relevant attributes in a dataset
#'
#' Takes in no paramaters, get the data and rename the columns
#' @param p1 Input parameter valid value are 'movies' 'tvshows'
#' @return Complete formatted dataset extracted from IMDB website
#' @export
#' @import xml2

getpopular <- function(p1)
{
  popmovieurl <- 'http://www.imdb.com/chart/moviemeter?ref_=nv_mv_mpm_8'
  poptvurl    <- 'http://www.imdb.com/chart/tvmeter?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=4da9d9a5-d299-43f2-9c53-f0efa18182cd&pf_rd_r=0Y0FT9F0HC2DZF44R0C3&pf_rd_s=right-4&pf_rd_t=15506&pf_rd_i=moviemeter&ref_=chtmvm_ql_5'

  if (p1 =='movies') {
    url <- popmovieurl
    typeofmedia <- 'movies'
    }
  else if (p1 =='tvshows') {
    url <- poptvurl
    typeofmedia <- 'tvshows'
    } else
      return('Invalid media selection')

  imdbData <- get.IMDB.data(url)

  cssCol <- '.titleColumn'
  cssCol2 <-  '.imdbRating'

  regespName <- '\n      \n      (.*?)\n'
  movieNames <- parseCols.data(removeXML.data(imdbData,cssCol),regespName)

  regespRating <- '\n            (.*?)\n'
  ratings <- parseCols.data(removeXML.data(imdbData,cssCol),regespRating)

  regexpRank <- '\n\\(\n\n(.*?)\\)\n'
  ranking <- parseCols.data(removeXML.data(imdbData,cssCol),regexpRank)

  regexpYear <- "\n        \\((.*?)\\)\n"
  year <- parseCols.data(removeXML.data(imdbData,cssCol),regexpYear)

  regexpIMDB <- "\n            (.*?)\n"
  IMDBrtng <- parseCols.data(removeXML.data(imdbData,cssCol2),regexpIMDB)

  moviesds <- as.data.frame(cbind(ratings, movieNames, year, ranking, IMDBrtng))
  colnames(moviesds)[colnames(moviesds)=="movieNames"] <- typeofmedia
  return(moviesds)
}
