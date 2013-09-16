\docType{data}
\name{obama_vs_mccain}
\alias{obama_vs_mccain}
\title{Obama vs. McCain}
\format{A data frame with 52 observations (one for each US state)
and the following columns.
\describe{
\item{State}{The name of the US state.}
\item{Region}{The US Federal region.}
\item{Obama}{Percentage of voters who voted for Barack Obama in the 2008 presidential election.}
\item{McCain}{Percentage of voters who voted for John McCain in the 2008 presidential election.}
\item{Turnout}{Percentage of people who voted in the 2008 presidential election.}
\item{Unemployment}{Percentage of people who are unemployed.}
\item{Income}{Mean annual income in US dollars.}
\item{Population}{Number of people living in the state.}
\item{Catholic}{Percentage of people identifying as Catholic.}
\item{Protestant}{Percentage of people identifying as Protestant.}
\item{Other}{Percentage of people identifying as religious, but not Catholic or Protestant.}
\item{Non.religious}{Percentage of people identifying as non-religious.}
\item{Black}{Percentage of people identifying as black.}
\item{Latino}{Percentage of people identifying as Latino.}
\item{Urbanization}{Percentage of people living in an urban area.}
}}
\description{
  State-by-state voting information in the 2008 US
  presidential election, along with contextual information
  on income, unemployment, ethnicity and religion.
}
\note{
  Religious identification data are not available for
  Alaska and Hawaii. The totals of these columns is
  generally less than 100, since some people didn't give an
  answer. The District of Columbia is included, even though
  it isn't a state. The dataset is not guaranteed to be
  error free.  Please double check the data if you want to
  use it for something serious.
}
\references{
  This dataset was kindly compiled and provided by Edwin
  Thoen \email{edwinthoen@hotmail.com}.

  The voting information came from
  \url{http://www.uselectionatlas.org/}, extracted on
  2011-12-09.

  The ethnicity, income and urbanisation information came
  from \url{http://quickfacts.census.gov}, extracted on
  2011-12-09.

  The unemployment information came from
  \url{http://data.bls.gov/timeseries/LNS14000000},
  extracted 2011-12-09.

  The religious information came from Table 12 of the
  American Religious Identification Survey 2008.
  \url{http://commons.trincoll.edu/aris/files/2011/08/ARIS_Report_2008.pdf}.
}
\keyword{datasets}

