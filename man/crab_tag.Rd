\docType{data}
\name{crab_tag}
\alias{crab_tag}
\title{Crab tag}
\format{A list with 5 elements, as follows.
\code{id_block} is a list with 2 elements
\describe{
\item{Firmware Version No}{Version of the firmware used in the crab tag.}
\item{Firmware Build Level}{Build level of the firmware used in the crab tag.}
}
\code{tag_notebook} is a list with 5 elements.
\describe{
\item{Mission Day}{Number of days of data.}
\item{Last Deployment Date}{Date and time that the tag was released into the sea.}
\item{Deployed by Host Version}{UNKNOWN}
\item{Downloaded by Host Version}{UNKNOWN}
\item{Last Clock Set Date}{UNKNOWN}
}

\code{lifetime_notebook} is a list with 3 elements.
\describe{
\item{Tag ID}{The unique ID of the tag.}
\item{Pressure Range}{UNKNOWN}
\item{No of sensors}{The number of sensors on the tag.}
}

\code{deployment_notebook} is a data frame with X columns.
\describe{
\item{Start}{Start date and time of recording.}
\item{Stop}{Stop date and time of recording.}
\item{Logging Rate}{UNKNOWN}
\item{Pointer}{UNKNOWN}
\item{PA inc}{UNKNOWN}
\item{sensors}{UNKNOWN}
\item{Flags}{UNKNOWN}
\item{Resolution}{UNKNOWN}
\item{Fast Rate}{UNKNOWN}
\item{V1}{UNKNOWN}
\item{V2}{UNKNOWN}
}

\code{daylog} is a data frame with X columns.
\describe{
\item{Mission.Day}{Integer number of days since the start of recording.}
\item{Date}{Date of record.}
\item{Max.Temp}{Maximum temperature (Celcius) recorded that day.}
\item{Min.Temp}{Minimum temperature (Celcius) recorded that day.}
\item{Max.Depth}{Maximum depth (m) recorded that day.}
\item{Min.Depth}{Minimum depth (m) recorded that day.}
\item{Batt.Volts}{Voltage of tag battery.}
}}
\description{
  Depth and temperature data from a sensor tag attached to
  an edible crab (Cancer Pangurus) in the North Sea in 2008
  and 2009.
}
\note{
  This data was kindly supplied by Ewan Hunter of CEFAS. It
  is part of a larger dataset consisting of many crabs.
}
\references{
  Ewan Hunter \email{ewan.hunter@cefas.gov.uk} ran the
  project where the data was collected. A full analysis is
  in Hunter, E, Eaton, D, Stewart, C, Lawler, A & Smith, M.
  2013. Edible crabs "go west": migrations and incubation
  cycle revealed by electronic tags.
  \url{https://www.ncbi.nlm.nih.gov/pubmed/23734180}.
  Richard Cotton \email{richierocks@gmail.com} made some
  modifications while importing it into R.
}
\keyword{datasets}

