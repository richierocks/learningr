Flow Control and Loops
----------------------


Chapter Goals
~~~~~~~~~~~~~


Flow Control
~~~~~~~~~~~~


if and else
^^^^^^^^^^^  


if(TRUE) message("It was true!")
if(FALSE) message("It wasn't true!") 


if(NA) message("Who knows if it was true?")


if(is.na(NA)) message("The value is missing!")


if(runif(1) > 0.5) message("This message appears with a 50% chance.")


x <- 3
if(x > 2)
{
  y <- 2 * x
  z <- 3 * y
}


if(FALSE)
{
  message("This won't execute...")
} else
{                               
  message("but this will.")
}


#if(FALSE)
#{
#  message("This won't execute...")
#} 
#else
#{                               
#  message("and you'll get an error before you reach this.")
#}


(r <- round(rnorm(2), 1)) 
(x <- r[1] / r[2])
if(is.nan(x))
{
  message("x is missing")
} else if(is.infinite(x))
{
  message("x is infinite")
} else if(x > 0)
{
  message("x is positive")
} else if(x < 0) 
{
  message("x is negative")
} else
{
  message("x is zero")
}


x <- sqrt(-1 + 0i)
(reality <- if(Re(x) == 0) "real" else "imaginary")


Vectorised if
^^^^^^^^^^^^^


if(c(TRUE, FALSE)) message("two choices")


ifelse(rbinom(10, 1, 0.5), "Head", "Tail")


(yn <- rep.int(c(TRUE, FALSE), 6))
ifelse(yn, 1:3, -1:-12)


yn[c(3, 6, 9, 12)] <- NA
ifelse(yn, 1:3, -1:-12)


Multiple Selection
^^^^^^^^^^^^^^^^^^


(greek <- switch(
  "gamma", 
  alpha = 1, 
  beta  = sqrt(4), 
  gamma = 
  {
    a <- sin(pi / 3)
    4 * a ^ 2
  }
))


(greek <- switch(
  "delta", 
  alpha = 1, 
  beta  = sqrt(4), 
  gamma = 
  {
    a <- sin(pi / 3)
    4 * a ^ 2
  }
))


(greek <- switch(
  "delta", 
  alpha = 1, 
  beta  = sqrt(4), 
  gamma = 
  {
    a <- sin(pi / 3)
    4 * a ^ 2
  },
  4
))


switch(
  3,
  "first",
  "second",
  "third",
  "fourth"
)


switch(
  as.character(2147483647),
  "2147483647" = "a big number",
  "another number"
)


Loops
~~~~~   


repeat Loops
^^^^^^^^^^^^


repeat
{
  message("Happy Groundhog Day!")
}


repeat
{
  message("Happy Groundhog Day!")
  action <- sample(
    c(
      "Learn French",
      "Make an ice statue", 
      "Rob a bank", 
      "Win heart of Andie McDowell"
    ),
    1
  )
  message("action = ", action)
  if(action == "Win heart of Andie McDowell") break
}


repeat
{
  message("Happy Groundhog Day!")
  action <- sample(
    c(
      "Learn French",
      "Make an ice statue", 
      "Rob a bank", 
      "Win heart of Andie McDowell"
    ),
    1
  )
  if(action == "Rob a bank")
  {
    message("Quietly skipping to the next iteration")
    next
  }
  message("action = ", action)
  if(action == "Win heart of Andie McDowell") break
}


while Loops
^^^^^^^^^^^


action <- sample(
  c(
    "Learn French",
    "Make an ice statue", 
    "Rob a bank", 
    "Win heart of Andie McDowell"
  ),
  1
)
while(action != "Win heart of Andie McDowell")
{
  message("Happy Groundhog Day!")
  action <- sample(
    c(
      "Learn French",
      "Make an ice statue", 
      "Rob a bank", 
      "Win heart of Andie McDowell"
    ),
    1
  )
  message("action = ", action)
}


for Loops
^^^^^^^^^


for(i in 1:5) message("i = ", i)


for(i in 1:5) 
{
  j <- i ^ 2
  message("j = ", j)
}


for(month in month.name)
{
  message("The month of ", month)
}         
for(yn in c(TRUE, FALSE, NA))
{
  message("This statement is ", yn)
}
l <- list(
  pi, 
  LETTERS[1:5],
  charToRaw("not as complicated as it looks"), 
  list(
    TRUE
  )
)
for(i in l)
{
  print(i)
}


Summary
~~~~~~~


Test Your Knowledge: Quiz
~~~~~~~~~~~~~~~~~~~~~~~~~


Test Your Knowledge: Exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


two_d6 <- function(n)
{
  random_numbers <- matrix(
    sample(6, 2 * n, replace = TRUE),
    nrow = 2
  )
  colSums(random_numbers)
}


sea_shells <- c(
  "She", "sells", "sea", "shells", "by", "the", "seashore",
  "The", "shells", "she", "sells", "are", "surely", "seashells",
  "So", "if", "she", "sells", "shells", "on", "the", "seashore",
  "I'm", "sure", "she", "sells", "seashore", "shells"
)


