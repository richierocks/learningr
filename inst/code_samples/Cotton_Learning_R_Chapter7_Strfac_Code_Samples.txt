Strings and Factors
-------------------


Chapter Goals
~~~~~~~~~~~~~


Strings
~~~~~~~


Constructing and Printing Strings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


c(
  "You should use double quotes most of the time", 
  'Single quotes are better for including " inside the string'
)


paste(c("red", "yellow"), "lorry") 
paste(c("red", "yellow"), "lorry", sep = "-")
paste(c("red", "yellow"), "lorry", collapse = ", ") 
paste0(c("red", "yellow"), "lorry") 


x <- (1:15) ^ 2
toString(x)
toString(x, width = 40)


cat(c("red", "yellow"), "lorry")


x <- c(
  "I", "saw", "a", "saw", "that", "could", "out", 
  "saw", "any", "other", "saw", "I", "ever", "saw"
)
y <- noquote(x)
x
y


Formatting Numbers
^^^^^^^^^^^^^^^^^^


pow <- 1:3
(powers_of_e <- exp(pow))
formatC(powers_of_e)  
formatC(powers_of_e, digits = 3)               #3 sig figs
formatC(powers_of_e, digits = 3, width = 10)   #preceding spaces
formatC(powers_of_e, digits = 3, format = "e") #scientific formatting
formatC(powers_of_e, digits = 3, flag = "+")   #precede +ve values with +


sprintf("%s %d = %f", "Euler's constant to the power", pow, powers_of_e) 
sprintf("To three decimal places, e ^ %d = %.3f", pow, powers_of_e) 
sprintf("In scientific notation, e ^ %d = %e", pow, powers_of_e) 


format(powers_of_e)
format(powers_of_e, digits = 3)                    #at least 3 sig figs
format(powers_of_e, digits = 3, trim = TRUE)       #remove leading zeroes
format(powers_of_e, digits = 3, scientific = TRUE)
prettyNum(
  c(1e10, 1e-20), 
  big.mark   = ",", 
  small.mark = " ",
  preserve.width = "individual", 
  scientific = FALSE
)


Special Characters
^^^^^^^^^^^^^^^^^^


cat("foo\tbar", fill = TRUE)


cat("foo\nbar", fill = TRUE)


cat("foo\0bar", fill = TRUE)  #this throws an error


cat("foo\\bar", fill = TRUE)


cat("foo\"bar", fill = TRUE)
cat('foo\'bar', fill = TRUE)


cat("foo'bar", fill = TRUE)
cat('foo"bar', fill = TRUE)


cat("\a")
alarm()


Changing Case
^^^^^^^^^^^^^


toupper("I'm Shouting")
tolower("I'm Whispering")


Extracting Substrings
^^^^^^^^^^^^^^^^^^^^^


woodchuck <- c(
  "How much wood would a woodchuck chuck",
  "If a woodchuck could chuck wood?",
  "He would chuck, he would, as much as he could",
  "And chuck as much wood as a woodchuck would",
  "If a woodchuck could chuck wood."
)
substring(woodchuck, 1:6, 10)   
substr(woodchuck, 1:6, 10)


Splitting Strings
^^^^^^^^^^^^^^^^^


strsplit(woodchuck, " ", fixed = TRUE)


strsplit(woodchuck, ",? ")


File paths
^^^^^^^^^^


getwd()
setwd("c:/windows")
getwd()


"c:\\windows"           #remember to double up the slashes
"\\\\myserver\\mydir"   #UNC names need four slashes at the start


file.path("c:", "Program Files", "R", "R-devel")
R.home()      #Same place: a shortcut to the R installation dir


path.expand(".")
path.expand("..")
path.expand("~")


file_name <- "C:/Program Files/R/R-devel/bin/x64/RGui.exe"
basename(file_name)
dirname(file_name)


Factors
~~~~~~~


Creating Factors
^^^^^^^^^^^^^^^^


(heights <- data.frame(
  height_cm = c(153, 181, 150, 172, 165, 149, 174, 169, 198, 163),
  gender = c(
    "female", "male", "female", "male", "male", 
    "female", "female", "male", "male", "female"
  )
))


class(heights$gender)


heights$gender


heights$gender[1] <- "Female"  #notice the capital 'F'
heights$gender


levels(heights$gender)


nlevels(heights$gender)


gender_char <- c(
  "female", "male", "female", "male", "male", 
  "female", "female", "male", "male", "female"
)
(gender_fac <- factor(gender_char))


Changing Factor Levels
^^^^^^^^^^^^^^^^^^^^^^


factor(gender_char, levels = c("male", "female"))


factor(gender_fac, levels = c("male", "female"))


levels(gender_fac) <- c("male", "female")
gender_fac


relevel(gender_fac, "male")


Dropping Factor Levels
^^^^^^^^^^^^^^^^^^^^^^


getting_to_work <- data.frame(
  mode = c(
    "bike", "car", "bus", "car", "walk", 
    "bike", "car", "bike", "car", "car"
  ),
  time_mins = c(25, 13, NA, 22, 65, 28, 15, 24, NA, 14)
)


(getting_to_work <- subset(getting_to_work, !is.na(time_mins)))


unique(getting_to_work$mode)


getting_to_work$mode <- droplevels(getting_to_work$mode)
getting_to_work <- droplevels(getting_to_work)
levels(getting_to_work$mode)


Ordered Factors
^^^^^^^^^^^^^^^


happy_choices <- c("depressed", "grumpy", "so-so", "cheery", "ecstatic")
happy_values <- sample(
  happy_choices,
  10000,
  replace = TRUE
)
happy_fac <- factor(happy_values, happy_choices)
head(happy_fac)


happy_ord <- ordered(happy_values, happy_choices)   
head(happy_ord)


is.factor(happy_ord)
is.ordered(happy_fac)


Converting Continuous Variables to be Categorical
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


ages <- 16 + 50 * rbeta(10000, 2, 3)
grouped_ages <- cut(ages, seq.int(16, 66, 10)) 
head(grouped_ages)
table(grouped_ages)


class(ages)
class(grouped_ages)


Converting Categorical Variables to be Continuous
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


dirty <- data.frame(
  x = c("1.23", "4..56", "7.89")
)


as.numeric(dirty$x)


as.numeric(as.character(dirty$x))


as.numeric(levels(dirty$x))[as.integer(dirty$x)]


factor_to_numeric <- function(f)
{
  as.numeric(levels(f))[as.integer(f)] 
}


Generating Factor Levels
^^^^^^^^^^^^^^^^^^^^^^^^


gl(3, 2)
gl(3, 2, labels = c("placebo", "drug A", "drug B")) 
gl(3, 1, 6, labels = c("placebo", "drug A", "drug B")) #alternating


Combining Factors
^^^^^^^^^^^^^^^^^


treatment <- gl(3, 2, labels = c("placebo", "drug A", "drug B"))
gender <- gl(2, 1, 6, labels = c("female", "male"))
interaction(treatment, gender)


Summary
~~~~~~~


Test Your Knowledge: Quiz
~~~~~~~~~~~~~~~~~~~~~~~~~


Test Your Knowledge: Exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


x <- c(
  "Swan swam over the pond, Swim swan swim!",
  "Swan swam back again - Well swum swan!"
)


#n specifies the number of scores to generate.
#It should be a natural number.
three_d6 <- function(n)
{
  random_numbers <- matrix(
    sample(6, 3 * n, replace = TRUE),
    nrow = 3
  )
  colSums(random_numbers)
}


