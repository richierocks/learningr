Getting Data
------------  


Chapter Goals
~~~~~~~~~~~~~


Built-in Datasets
~~~~~~~~~~~~~~~~~


data()


data(package = .packages(TRUE))


data("kidney", package = "survival")


head(kidney)


Reading Text Files
~~~~~~~~~~~~~~~~~~


CSV and Tab Delimited Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~


library(learningr)
deer_file <- system.file("extdata", "RedDeerEndocranialVolume.dlm", package = "learningr")
deer_data <- read.table(deer_file, header = TRUE, fill = TRUE)
str(deer_data)
head(deer_data)


crab_file <- system.file(
  "extdata", 
  "crabtag.csv", 
  package = "learningr"
)
(crab_id_block <- read.csv(
  crab_file, 
  header = FALSE, 
  skip = 3, 
  nrow = 2
))
(crab_tag_notebook <- read.csv(
  crab_file, 
  header = FALSE, 
  skip = 8, 
  nrow = 5
))
(crab_lifetime_notebook <- read.csv(
  crab_file, 
  header = FALSE, 
  skip = 15, 
  nrow = 3
))


write.csv(
  crab_lifetime_notebook, 
  "Data/Cleaned/crab lifetime data.csv",
  row.names    = FALSE,
  fileEncoding = "utf8"
)


Unstructured Text Files
^^^^^^^^^^^^^^^^^^^^^^^


text_file <- system.file(
  "extdata", 
  "Shakespeare's The Tempest, from Project Gutenberg pg2235.txt", 
  package = "learningr"
)
the_tempest <- readLines(text_file)
the_tempest[1926:1927]


writeLines(
  rev(text_file),     #rev reverses vectors
  "Shakespeare's The Tempest, backwards.txt"
)


XML and HTML files
^^^^^^^^^^^^^^^^^^


install.packages("XML")


library(XML)
xml_file <- system.file("extdata", "options.xml", package = "learningr")
r_options <- xmlParse(xml_file)


xmlParse(xml_file, useInternalNodes = FALSE)
xmlTreeParse(xml_file)      #the same


xpathSApply(r_options, "//variable[contains(@name, 'warn')]")


library(Runiversal)
ops <- as.list(options())
cat(makexml(ops), file = "options.xml")


JSON and YAML Files
^^^^^^^^^^^^^^^^^^^


library(RJSONIO)
library(rjson)
jamaican_city_file <- system.file("extdata", "Jamaican Cities.json", package = "learningr")
(jamaican_cities_RJSONIO <- RJSONIO::fromJSON(jamaican_city_file)) 
(jamaican_cities_rjson <- rjson::fromJSON(file = jamaican_city_file))


special_numbers <- c(NaN, NA, Inf, -Inf)
RJSONIO::toJSON(special_numbers)
rjson::toJSON(special_numbers)


library(yaml)
yaml.load_file(jamaican_city_file)


Reading Binary Files
~~~~~~~~~~~~~~~~~~~~


Reading Excel Files
^^^^^^^^^^^^^^^^^^^


library(xlsx)
bike_file <- system.file(
  "extdata", 
  "Alpe d'Huez.xls", 
  package = "learningr"
)
bike_data <- read.xlsx2(
  bike_file, 
  sheetIndex = 1, 
  startRow   = 2, 
  endRow     = 38,
  colIndex   = 2:8, 
  colClasses = c(
    "character", "numeric", "character", "integer", 
    "character", "character", "character"
  )
)
head(bike_data)


Reading SAS, Stata, SPSS and MATLAB Files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Reading Other File Types
^^^^^^^^^^^^^^^^^^^^^^^^


Web Data
~~~~~~~~


Sites With an API
~~~~~~~~~~~~~~~~~


install.packages("WDI")


library(WDI)
#list all available datasets
wdi_datasets <- WDIsearch()
head(wdi_datasets)
#retrieve one of them
wdi_trade_in_services <- WDI(
  indicator = "BG.GSR.NFSV.GD.ZS"
)
str(wdi_trade_in_services)


library(quantmod)
#If you are using a version before 0.5.0 then set this option
#or pass auto.assign = FALSE to getSymbols.
options(getSymbols.auto.assign = FALSE)
microsoft <- getSymbols("MSFT")
head(microsoft)


Scraping Web Pages
~~~~~~~~~~~~~~~~~~


salary_url <- "http://www.justinmrao.com/salary_data.csv"
salary_data <- read.csv(salary_url)
str(salary_data)


salary_url <- "http://www.justinmrao.com/salary_data.csv"
local_copy <- "my local copy.csv"
download.file(salary_url, local_copy)
salary_data <- read.csv(local_copy)


library(RCurl)
time_url <- "http://tycho.usno.navy.mil/cgi-bin/timer.pl"
time_page <- getURL(time_url)
cat(time_page)


library(XML)
time_doc <- htmlParse(time_page)
pre <- xpathSApply(time_doc, "//pre")[[1]]
values <- strsplit(xmlValue(pre), "\n")[[1]][-1]
strsplit(values, "\t+")


library(httr)
time_page <- GET(time_url)
time_doc <- content(page, useInternalNodes = TRUE)


Accessing Databases
~~~~~~~~~~~~~~~~~~~


library(DBI)
library(RSQLite)


driver <- dbDriver("SQLite")
db_file <- system.file(
  "extdata", 
  "crabtag.sqlite", 
  package = "learningr"
)
conn <- dbConnect(driver, db_file)


driver <- dbDriver("MySQL")
db_file <- "path/to/MySQL/database"
conn <- dbConnect(driver, db_file)


query <- "SELECT * FROM IdBlock"
(id_block <- dbGetQuery(conn, query))


dbDisconnect(conn)
dbUnloadDriver(driver)


query_crab_tag_db <- function(query)
{
  driver <- dbDriver("SQLite")
  db_file <- system.file(
    "extdata", 
    "crabtag.sqlite", 
    package = "learningr"
  )
  conn <- dbConnect(driver, db_file)
  on.exit(
    {
      #this code block runs at the end of the function, 
      #even if an error is thrown
      dbDisconnect(conn)
      dbUnloadDriver(driver)
    }
  )
  dbGetQuery(conn, query)
}


query_crab_tag_db("SELECT * FROM IdBlock")


dbReadTable(conn, "idblock")


library(RODBC)
conn <- odbcConnect("my data source name")
id_block <- sqlQuery(conn, "SELECT * FROM IdBlock")
odbcClose(conn)


Summary
~~~~~~~


Test Your Knowledge: Quiz
~~~~~~~~~~~~~~~~~~~~~~~~~


Test Your Knowledge: Exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


