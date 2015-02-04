\docType{data}
\name{deer_endocranial_volume}
\alias{deer_endocranial_volume}
\title{Deer Endocranial Volume}
\format{A data frame with the following columns.
\describe{
\item{SkullID}{A unique identifier for each red deer.}
\item{VolCT}{Endocranial volume calculated by cardiac tomography.}
\item{VolBead}{Endocranial volume calculated by glass beads.}
\item{VolLWH}{Endocranial volume calculated by length*width*height.}
\item{VolFinarelli}{Endocranial volume calculated by Finarelli's equation.}
\item{VolCT2}{A second measurement via cardiac tomography.}
\item{VolBead2}{A second measurement via glass beads.}
\item{VolLWH2}{A second measurement via l*w*h.}
}}
\description{
  The dataset contains the endocranial volume of 33 red
  deer (Cervus elaphus), using four different methods of
  measurement: cardiac tomography, filling the skull with
  glass beads (yes, the skulls are from dead deer), simply
  measuring the length, width and height and multiplying
  the numbers, and using Finarelli's equation.
  "Endocranial volume" is a proxy for brain size.
}
\note{
  The data was kindly provided by Corina Logan. Second
  measurements are provided for several of the deer.
  Finarelli's equation is used for estimating the brain
  volume of non-bovid ruminant Artiodactylid species (say
  that 10 times fast). \deqn{\ln(volume(skull)) = 2.6616 *
  \ln(width(skull)) - 6.2722}{% \ln(volume(skull)) = 2.6616
  * \ln(width(skull)) - 6.2722}
}
\references{
  The dataset was collected by Corina Logan
  \email{itsme@corinalogan.com}.  It is stored in the Dryad
  Digital Repository, \code{doi:10.5061/dryad.4t7h2}. A more
  full analysis is given in the paper Logan CJ,
  Clutton-Brock TH. 2013. Validating methods for estimating
  endocranial volume in individual red deer (Cervus
  elaphus). Behavioural Processes 92:143-146.
  doi:10.1016/j.beproc.2012.10.015.
  \url{http://www.sciencedirect.com/science/article/pii/S037663571200232X}
  Richard Cotton \email{richierocks@gmail.com} made some
  modifications while importing it into R.
}
\keyword{datasets}

