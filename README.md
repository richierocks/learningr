[![Project Status: Inactive - The project has reached a stable, usable state but is no longer being actively developed; support/maintenance will be provided as time allows.](http://www.repostatus.org/badges/0.1.0/inactive.svg)](http://www.repostatus.org/#inactive)
[![Is the package on CRAN?](http://www.r-pkg.org/badges/version/learningr)](http://www.r-pkg.org/pkg/learningr)
[![Build Status](https://semaphoreci.com/api/v1/projects/48f18cca-2308-4a49-810c-4977c824f25d/635272/badge.svg)](https://semaphoreci.com/richierocks/learningr)

learningr
=========

Data and functions to accompany the book [Learning R](http://shop.oreilly.com/product/0636920028352.do "Learning R in the O'Reilly shop").

To install, you first need the *devtools* package.

    install.packages("devtools")
    
Then you can install the *learningr* package using    
  
    library(devtools)
    install_github("richierocks/learningr")
   
Some filenames have been changed slightly to conform to CRAN portability requirements.  To change them back to those in the book, type:

    library(learningr)
    fix_filenames()
    
