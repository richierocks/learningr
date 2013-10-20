learningr
=========

Data and functions to accompany the book [Learning R](http://shop.oreilly.com/product/0636920028352.do "Learning R in the O'Reilly shop").

To install, you first need the `devtools` package.

    install.packages("devtools")
    
Then you can install the `learningr` package using    
  
    library(devtools)
    install_github("learningr", "richierocks")
   
Some filenames have been changed slightly to conform to CRAN portability requirements.  to change them back to those in the book, type:

    library(learningr)
    fix_filenames()
    