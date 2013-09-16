\name{buggy_count}
\alias{buggy_count}
\title{A buggy version of plyr's count function}
\usage{
  buggy_count(df, vars = NULL, wt_var = NULL)
}
\arguments{
  \item{df}{A data frame or an atomic input.}

  \item{vars}{Variables in \code{df} to count unique values
  of}

  \item{wt_var}{Optional variable to weight by.  See
  \code{\link[plyr]{count}}.}
}
\value{
  A data frame with label and freq columns.
}
\description{
  An old version of the \code{plyr} package's \code{count}
  function that fails when you pass it a \code{factor}
  input.
}
\note{
  In case the ``buggy'' part of the name didn't give it
  away, this is not suitable for real world usage!
}
\examples{
\dontrun{
buggy_count(factor()) #oops!
}
}
\seealso{
  \code{\link[plyr]{count}} and \code{\link[base]{table}}
}

