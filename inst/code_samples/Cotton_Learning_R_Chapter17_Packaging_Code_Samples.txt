Making Packages
---------------  


Chapter Goals
~~~~~~~~~~~~~


Why Create Packages?
~~~~~~~~~~~~~~~~~~~~


Prerequisites
~~~~~~~~~~~~~


install.packages(c("devtools", "roxygen2"))


The Package Directory Structure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  


Your First Package
~~~~~~~~~~~~~~~~~~  


hypotenuse <- function(x, y)
{
  sqrt(x ^ 2 + y ^ 2)
}
pythagorean_triples <- data.frame(
  x = c(3, 5, 8, 7, 9, 11, 12, 13, 15, 16, 17, 19),
  y = c(4, 12, 15, 24, 40, 60, 35, 84, 112, 63, 144, 180),
  z = c(5, 13, 17, 25, 41, 61, 37, 85, 113, 65, 145, 181)
)


package.skeleton(
  "pythagorus",
  c("hypotenuse", "pythagorean_triples")
)


Documenting packages
~~~~~~~~~~~~~~~~~~~~


#' Help page title
#' 
#' A couple of lines of description about the function(s).
#' If you want to include code, use \code{my_code()}.
#' @param x Description of the first argument.
#' @param y Description of the second argument.
#' @return description of the return value from a function.
#' If it returns a list, use
#' \itemize{
#'    \item{item1}{A description of item1.}
#'    \item{item2}{A description of item2.}
#' }
#' @note Describe how the algorithm works, or if the function has 
#' any quirks here.
#' @author Your name here!
#' @references Journal papers, algorithms or other inspiration here.
#' You can include web links like this 
#' \url{http://www.thewebsiteyouarelinkingto.com}
#' @seealso Link to functions in the same package with
#' \code{\link{a_function_or_dataset}}
#' and functions in other packages with
#' \code{\link[another_package]{a_function_or_dataset}}
#' @examples
#' #R code run by the example function
#' \dontrun{
#' #R code that isn't run by example or when the package is built
#' }
#' @keywords misc
#' @export
f <- function(x, y)
{
  #Function content goes here, as usual
}


library(R.oo)
Rdoc$getKeywords()


#' Help page title.  Probably the package name and tagline.
#' 
#' A description of what the package does, why you might want to use it,
#' which functions to look at first, and anything else that the user 
#' really, absolutely, must look at because you've created it and it is 
#' astonishing.
#' 
#' @author You again!
#' @docType package
#' @name packagename
#' @aliases packagename packagename-package
#' @keywords package
NULL


#' Help page title
#' 
#' Explain the contents of each column here in the description.
#' \itemize{
#'   \item{column1}{Description of column1.}
#'   \item{column2}{Description of column2.}
#' }
#' 
#' @references Where you found the data.
#' @docType data
#' @keywords datasets
#' @name datasetname
#' @usage data(datasetname)
#' @format A data frame with m rows of n variables
NULL


roxygenise("path/to/root/of/package")


Checking and Building Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


library(devtools)
check("path/to/root/of/package")


build("path/to/root/of/package")


release("path/to/root/of/package")


Maintaining packages
~~~~~~~~~~~~~~~~~~~~


hypotenuse <- function(x, y, p = 2)
{
  if(!missing(p))
  {
    .NotYetUsed("p")
  }
  sqrt(x ^ 2 + y ^ 2)
}
hypotenuse(5, 12)      #behaviour as before
hypotenuse(5, 12, 1)   


hypotenuse <- function(x, y, p = 2)
{  
  (x ^ p + y ^ p) ^ (1 / p)
}


triangular <- function(n)
{
  .NotYetImplemented()
}
triangular()


hypotenuse <- function(x, y, p = 2)
{  
  .Deprecated("p_norm")
  (x ^ p + y ^ p) ^ (1 / p)
}
hypotenuse(5, 12)   


hypotenuse <- function(x, y, p = 2)
{  
  .Defunct("p_norm")
}
hypotenuse(5, 12)   


Summary
~~~~~~~


Test Your Knowledge: Quiz
~~~~~~~~~~~~~~~~~~~~~~~~~


Test Your Knowledge: Exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


