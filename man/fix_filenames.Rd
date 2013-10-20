\name{fix_filenames}
\alias{fix_filenames}
\title{Convert filenames to match those in the book}
\usage{
  fix_filenames(x = c("tobook", "tocran"),
    dir = system.file("extdata", packages = "learningr"))
}
\arguments{
  \item{x}{Either ``tocran'' or ``tobook''.}

  \item{dir}{Directory containing the files.}
}
\value{
  A logical vector of length 4, \code{TRUE} for each file
  whose name was changed.
}
\description{
  Some filenames have been altered in order to comply with
  portability requirements on CRAN.  This function converts
  the filenames between the CRAN forms and the book forms.
}
\examples{
\dontrun{
#To convert the files to the book form, use:
fix_filenames("tobook")
#The files were converted to CRAN form using:
fix_filenames("tocran", "learningr/inst/extdata")
}
}

