Inspecting variables and your workspace
---------------------------------------


Chapter Goals
~~~~~~~~~~~~~


Classes
~~~~~~~


class(c(TRUE, FALSE))


Different Types of Numbers
~~~~~~~~~~~~~~~~~~~~~~~~~~


class(sqrt(1:10))
class(3 + 1i)      #'i' creates imaginary components of complex numbers
class(1)           #although this is a whole number, it has class numeric
class(1L)          #add a suffix of 'L' to make the number an integer
class(0.5:4.5)     #the colon operator returns a value that is numeric ...
class(1:5)         #unless all its values are whole numbers


Other Common Classes
~~~~~~~~~~~~~~~~~~~~           


class(c("she", "sells", "seashells", "on", "the", "sea", "shore"))


(gender <- factor(c("male", "female", "female", "male", "female")))


levels(gender)
nlevels(gender)


as.integer(gender)


gender_char <- sample(c("female", "male"), 10000, replace = TRUE)
gender_fac <- as.factor(gender_char)
object.size(gender_char)
object.size(gender_fac)


as.character(gender)


as.raw(1:17)
as.raw(c(pi, 1 + 1i, -1, 256))
(sushi <- charToRaw("Fish!"))
class(sushi)


Checking and Changing Classes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


if(!is(x, "some_class"))
{
  #Some corrective measure
}


is.character("red lorry, yellow lorry")
is.logical(FALSE)
is.list(list(a = 1, b = 2))


ls(pattern = "^is", baseenv())


is.numeric(1)
is.numeric(1L)
is.integer(1)
is.integer(1L)
is.double(1)
is.double(1L)


x <- "123.456"
as(x, "numeric")
as.numeric(x)


y <- c(2, 12, 343, 34997)       #See http://oeis.org/A192892
as(y, "data.frame")
as.data.frame(y)


x <- "123.456"
class(x) <- "numeric"
x
is.numeric(x)


Examining Variables
~~~~~~~~~~~~~~~~~~~


ulams_spiral <- c(1, 8, 23, 46, 77)  #See http://oeis.org/A033951
for(i in ulams_spiral) i             #uh-oh, the values aren't printed
for(i in ulams_spiral) print(i)


num <- runif(30)
summary(num)


fac <- factor(sample(letters[1:5], 30, replace = TRUE))
summary(fac)
bool <- sample(c(TRUE, FALSE, NA), 30, replace = TRUE)
summary(bool)


dfr <- data.frame(num, fac, bool)   
head(dfr)


summary(dfr)


str(num)
str(dfr)


unclass(fac)


attributes(fac)


View(dfr)               #no changes allowed
new_dfr <- edit(dfr)    #changes stored in new_dfr
fix(dfr)                #changes stored in dfr


View(head(dfr, 50))  #view first 50 rows


The Workspace
~~~~~~~~~~~~~


#Create some variables to find
peach <- 1
plum <- "fruity"
pear <- TRUE
ls()
ls(pattern = "ea")


browseEnv()


rm(peach, plum, pear)
rm(list = ls())  #Remove everything.  Use with caution!


Summary
~~~~~~~


Test Your Knowledge: Quiz
~~~~~~~~~~~~~~~~~~~~~~~~~


Test Your Knowledge: Exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


