Environments and Functions
--------------------------


Chapter Goals
~~~~~~~~~~~~~


Environments
~~~~~~~~~~~~


an_environment <- new.env()


an_environment[["pythag"]] <- c(12, 15, 20, 21) #See http://oeis.org/A156683
an_environment$root <- polyroot(c(6, -5, 1))  


assign(
  "moonday", 
  weekdays(as.Date("1969/07/20")), 
  an_environment
)


an_environment[["pythag"]]
an_environment$root
get("moonday", an_environment)


ls(envir = an_environment)  
ls.str(envir = an_environment)


exists("pythag", an_environment) 


#Convert to list
(a_list <- as.list(an_environment))
# ... and back again.  Both lines of code do the same thing
as.environment(a_list)    
list2env(a_list)


nested_environment <- new.env(parent = an_environment)
exists("pythag", nested_environment)                        
exists("pythag", nested_environment, inherits = FALSE)


non_stormers <<- c(3, 7, 8, 13, 17, 18, 21) #See http://oeis.org/A002312
get("non_stormers", envir = globalenv())
head(ls(envir = baseenv()), 20)


Functions
~~~~~~~~~


Creating and Calling Functions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


rt


hypotenuse <- function(x, y)
{
  sqrt(x ^ 2 + y ^ 2)
}


hypotenuse <- function(x, y) sqrt(x ^ 2 + y ^ 2)   #same as before


hypotenuse(3, 4)          
hypotenuse(y = 24, x = 7)


hypotenuse <- function(x = 5, y = 12)
{
  sqrt(x ^ 2 + y ^ 2)
}
hypotenuse() #equivalent to hypotenuse(5, 12)


formals(hypotenuse)
args(hypotenuse)
formalArgs(hypotenuse)


(body_of_hypotenuse <- body(hypotenuse))
deparse(body_of_hypotenuse)


normalize <- function(x, m = mean(x), s = sd(x))
{
  (x - m) / s
}
normalized <- normalize(c(1, 3, 6, 10, 15))
mean(normalized)        #almost 0!
sd(normalized)


normalize(c(1, 3, 6, 10, NA))


normalize <- function(x, m = mean(x, na.rm = na.rm), 
  s = sd(x, na.rm = na.rm), na.rm = FALSE)
{
  (x - m) / s
}
normalize(c(1, 3, 6, 10, NA))  
normalize(c(1, 3, 6, 10, NA), na.rm = TRUE)


normalize <- function(x, m = mean(x, ...), s = sd(x, ...), ...)
{
  (x - m) / s
}                   
normalize(c(1, 3, 6, 10, NA))  
normalize(c(1, 3, 6, 10, NA), na.rm = TRUE)


Passing Functions To and From Other Functions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


do.call(hypotenuse, list(x = 3, y = 4)) #same as hypotenuse(3, 4)


dfr1 <- data.frame(x = 1:5, y = rt(5, 1))
dfr2 <- data.frame(x = 6:10, y = rf(5, 1, 1))
dfr3 <- data.frame(x = 11:15, y = rbeta(5, 1, 1))
do.call(rbind, list(dfr1, dfr2, dfr3)) #same as rbind(dfr1, dfr2, dfr3)


menage <- c(1, 0, 0, 1, 2, 13, 80) #See http://oeis.org/A000179
mean(menage)


mean(c(1, 0, 0, 1, 2, 13, 80))


x_plus_y <- function(x, y) x + y
do.call(x_plus_y, list(1:5, 5:1))  
#is the same as 
do.call(function(x, y) x + y, list(1:5, 5:1))


(emp_cum_dist_fn <- ecdf(rnorm(50)))
is.function(emp_cum_dist_fn)
plot(emp_cum_dist_fn)


Variable Scope
^^^^^^^^^^^^^^


f <- function(x)
{
  y <- 1  
  g <- function(x)
  {
    (x + y) / 2 #y is used, but is not a formal argument of g.
  }
  g(x)                                       
}
f(sqrt(5))      #It works! y is magically found in the environment of f


f <- function(x)
{
  y <- 1  
  g(x)
}      
g <- function(x)
{
  (x + y) / 2
}
f(sqrt(5))


h <- function(x)
{
  x * y
}


h(9)


y <- 16
h(9)


h2 <- function(x)
{
  if(runif(1) > 0.5) y <- 12
  x * y
}


replicate(10, h2(9))


Summary
~~~~~~~


Test Your Knowledge: Quiz
~~~~~~~~~~~~~~~~~~~~~~~~~


Test Your Knowledge: Exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


