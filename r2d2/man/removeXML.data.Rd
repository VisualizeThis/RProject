% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/removeXML.R
\name{removeXML.data}
\alias{removeXML.data}
\title{parse data from IMDB website, remove unwated xml data}
\usage{
removeXML.data(wp, csstxt)
}
\arguments{
\item{wp}{Scraped data from IMDB web site}

\item{csstxt}{css Tag to isolate}
}
\value{
Extracted data denoted by the CSS text
}
\description{
Takes in unformatted data
}
