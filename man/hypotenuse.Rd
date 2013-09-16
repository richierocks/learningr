\name{hypotenuse}
\alias{hypotenuse}
\title{Dumb hypotenuse function.}
\usage{
  hypotenuse(x, y)
}
\arguments{
  \item{x}{A numeric vector.}

  \item{y}{A numeric vector.}
}
\value{
  A numeric vector of the hyptenuse of the inputs.
}
\description{
  Calculate the (Pythagorean) hypotenuse of two numeric
  vectors using the obvious algorithm.
}
\note{
  This algorithm fails when the inputs are very large of
  very small, making it unsuitable for real-world use.
}
\examples{
hypotenuse(5, 12)           #okay
hypotenuse(1e-300, 1e-300)  #fails
hypotenuse(1e300, 1e300)    #fails
}
\references{
  Cleve Moler (MATLAB creator and discoverer of the
  Moler-Morrison algorithm for calculating hypotenuses)
  discusses the pro and cons of several algorithms here.
  \url{http://blogs.mathworks.com/cleve/2012/07/30/pythagorean-addition}
}
\seealso{
  \code{\link[pracma]{hypot}}
}

