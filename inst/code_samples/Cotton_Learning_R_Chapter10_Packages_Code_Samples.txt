Packages
--------


Chapter Goals
~~~~~~~~~~~~~


Loading Packages
~~~~~~~~~~~~~~~~


library(lattice)


dotplot(
  variety ~ yield | site, 
  data   = barley, 
  groups = year
)


pkgs <- c("lattice", "utils", "rpart")
for(pkg in pkgs)
{
  library(pkg, character.only = TRUE)
}


if(!require(apackagethatmightnotbeinstalled))
{
  warning("The package 'apackagethatmightnotbeinstalled' is not available.")
  #perhaps try to download it
  #...
}


The Search Path
^^^^^^^^^^^^^^^


search()


Libraries and Installed Packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


View(installed.packages())


R.home("library")   #or
.Library


path.expand("~")    #or
Sys.getenv("HOME")


.libPaths()


Installing Packages
~~~~~~~~~~~~~~~~~~~


View(available.packages())


install.packages(
  c("xts", "zoo"),
  repos = "http://www.stats.bris.ac.uk/R/"
)


install.packages(
  c("xts", "zoo"),
  lib   = "some/other/folder/to/install/to",
  repos = "http://www.stats.bris.ac.uk/R/"
)


setInternet2()


install.packages(
  "path/to/downloaded/file/xts_0.8-8.tar.gz",
  repos = NULL,       #NULL repo means "package already downloaded"
  type = "source"     #this means build the package now
)

install.packages(
  "path/to/downloaded/file/xts_0.8-8.zip",
  repos = NULL,       #still need this
  type = "win.binary" #Windows only!
)


install.packages("devtools")


library(devtools)
install_github("knitr", "yihui")


Maintaining Packages
~~~~~~~~~~~~~~~~~~~~


update.packages(ask = FALSE)


remove.packages("zoo")


Summary
~~~~~~~


Test Your Knowledge: Quiz
~~~~~~~~~~~~~~~~~~~~~~~~~


Test Your Knowledge: Exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


