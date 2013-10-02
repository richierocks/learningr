Programming
-----------


Chapter Goals
~~~~~~~~~~~~~


Messages, Warnings and Errors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


f <- function(x)
{
  message("'x' contains ", toString(x))
  x
}
f(letters[1:5])


suppressMessages(f(letters[1:5]))


g <- function(x)
{
  if(any(x < 0))
  {
    warning("'x' contains negative values: ", toString(x[x < 0]))
  }
  x
}
g(c(3, -7, 2, -9))


suppressWarnings(g(c(3, -7, 2, -9)))


getOption("warn")


old_ops <- options(warn = -1)
g(c(3, -7, 2, -9))


options(old_ops)


h <- function(x, na.rm = FALSE)
{
  if(!na.rm && any(is.na(x)))
  {
    stop("'x' has missing values.")
  }
  x
}
h(c(1, NA))


h <- function(x, na.rm = FALSE)
{
  if(!na.rm)
  {
    stopifnot(!any(is.na(x)))
  }
  x
}
h(c(1, NA))


library(assertive)
h <- function(x, na.rm = FALSE)
{
  if(!na.rm)
  {
    assert_all_are_not_na(x)
  }
  x
}
h(c(1, NA))


Error Handling
~~~~~~~~~~~~~~


to_convert <- list(
  first  = sapply(letters[1:5], charToRaw),
  second = polyroot(c(1, 0, 0, 0, 1)),
  third  = list(x = 1:2, y = 3:5)
)


lapply(to_convert, as.data.frame)


result <- try(lapply(to_convert, as.data.frame))


if(inherits(result, "try-error"))
{
  #special error handling code
} else
{
  #code for normal execution
}


tryCatch(
  lapply(to_convert, as.data.frame),
  error = function(e)
  {
    message("An error was thrown: ", e$message)
    data.frame()
  }
)


lapply(
  to_convert, 
  function(x)
  {
    tryCatch(
      as.data.frame(x),
      error = function(e) NULL
    )
  }
)


tryapply(to_convert, as.data.frame)


Debugging
~~~~~~~~~


outer_fn <- function(x) inner_fn(x)
inner_fn <- function(x) exp(x)


outer_fn(list(1))


inner_fn <- function(x) 
{
  browser()     #execution pauses here
  exp(x)
}


debug(buggy_count)
x <- factor(sample(c("male", "female"), 20, replace = TRUE))
buggy_count(x)


undebug(buggy_count)


Testing
^^^^^^^


hypotenuse <- function(x, y)
{
  sqrt(x ^ 2 + y ^ 2)
}


RUnit
^^^^^


library(RUnit)
test.hypotenuse.3_4.returns_5 <- function()
{
  expected <- 5
  actual <- hypotenuse(3, 4)
  checkEqualsNumeric(expected, actual)
}


test.hypotenuse.no_inputs.fails <- function()
{
  checkException(hypotenuse())
}


.Machine$double.xmin
.Machine$double.xmax


test.hypotenuse.very_small_inputs.returns_small_positive <- function()
{
  expected <- sqrt(2) * 1e-300
  actual <- hypotenuse(1e-300, 1e-300)
  checkEqualsNumeric(expected, actual, tolerance = 1e-305)
}
test.hypotenuse.very_large_inputs.returns_large_finite <- function()
{
  expected <- sqrt(2) * 1e300
  actual <- hypotenuse(1e300, 1e300)
  checkEqualsNumeric(expected, actual)
}


test_dir <- system.file("tests", package = "learningr")
suite <- defineTestSuite("hypotenuse suite", test_dir)


runTestSuite(suite)



----


##  Timing stopped at: 0 0 0 done successfully.
----


test.log.minus1.throws_warning <- function()
{
  old_ops <- options(warn = 2) #warnings become errors
  on.exit(old_ops)             #restore old behaviour
  checkException(log(-1))
}


testthat
^^^^^^^^


library(testthat)
expect_equal(hypotenuse(3, 4), 5)
expect_error(hypotenuse())
expect_equal(hypotenuse(1e-300, 1e-300), sqrt(2) * 1e-300, tol = 1e-305)
expect_equal(hypotenuse(1e300, 1e300), sqrt(2) * 1e300)


filename <- system.file(
  "tests", 
  "testthat_hypotenuse_tests.R", 
  package = "learningr"
)
test_file(filename)


expect_warning(log(-1))


Magic
~~~~~


Turning strings into code
^^^^^^^^^^^^^^^^^^^^^^^^^


atan(c(-Inf, -1, 0, 1, Inf))


(quoted_r_code <- quote(atan(c(-Inf, -1, 0, 1, Inf))))
class(quoted_r_code)


eval(quoted_r_code)


as.list(quoted_r_code)


vapply(
  list(`+`, `if`, `for`, `<-`, `[`, `[[`),
  is.function,
  logical(1)
)


parsed_r_code <- parse(text = "atan(c(-Inf, -1, 0, 1, Inf))")
class(parsed_r_code)


eval(parsed_r_code)


Turning code into strings
^^^^^^^^^^^^^^^^^^^^^^^^^


random_numbers <- rt(1000, 2)
hist(random_numbers)


divider <- function(numerator, denominator)
{
  if(denominator == 0)
  {
    denominator_name <- deparse(substitute(denominator))
    warning("The denominator, ", sQuote(denominator_name), ", is zero.")
  }
  numerator / denominator
}
top <- 3
bottom <- 0
divider(top, bottom)


eval(substitute(levels(Gender)), hafu)


with(hafu, levels(Gender))


Object Oriented Programming
~~~~~~~~~~~~~~~~~~~~~~~~~~~


S3 Classes
^^^^^^^^^^


print


today <- Sys.Date()
print(today)


print.Date


head(methods(print))
methods(mean)


Reference Classes
^^^^^^^^^^^^^^^^^


my_class_generator <- setRefClass(
  "MyClass",
  fields = list(
    #data variables are defined here
  ),
  methods = list(
    #functions to operate on that data go here
    initialize = function(...)
    {
      #initialize is a special function called
      #when an object is created.
    }
  )
)


point_generator <- setRefClass(
  "point",
  fields = list(
    x = "numeric",
    y = "numeric"
  ),
  methods = list(
    #TODO
  )
)


point_generator <- setRefClass(
  "point",
  fields = list(
    x = "numeric",
    y = "numeric"
  ),
  methods = list(
    initialize = function(x = NA_real_, y = NA_real_)
    {
      "Assign x and y upon object creation."
      x <<- x
      y <<- y
    }
  )
)


(a_point <- point_generator$new(5, 3))


point_generator$help("initialize")


create_point <- function(x, y)
{
  point_generator$new(x, y)
}


point_generator <- setRefClass(
  "point",
  fields  = list(
    x = "numeric",
    y = "numeric"
  ),
  methods = list(
    initialize         = function(x = NA_real_, y = NA_real_)
    {
      "Assign x and y upon object creation."
      x <<- x
      y <<- y
    },
    distanceFromOrigin = function()
    {
      "Euclidean distance from the origin"
      sqrt(x ^ 2 + y ^ 2)
    },
    add                = function(point)
    {
      "Add another point to this point"
      x <<- x + point$x
      y <<- y + point$y
      .self
    }
  )
)


a_point <- create_point(3, 4)
a_point$distanceFromOrigin()
another_point <- create_point(4, 2)
(a_point$add(another_point))


point_generator$fields()
point_generator$methods()


three_d_point_generator <- setRefClass(
  "three_d_point",
  fields   = list(
    z = "numeric"
  ),
  contains = "point",         #this line lets us inherit
  methods  = list(
    initialize = function(x, y, z)
    {
      "Assign x and y upon object creation."
      x <<- x
      y <<- y
      z <<- z
    }
  )
)
a_three_d_point <- three_d_point_generator$new(3, 4, 5)


a_three_d_point$distanceFromOrigin() #wrong!


three_d_point_generator <- setRefClass(
  "three_d_point",
  fields   = list(
    z = "numeric"
  ),
  contains = "point",
  methods  = list(
    initialize = function(x, y, z)
    {
      "Assign x and y upon object creation."
      x <<- x
      y <<- y
      z <<- z
    },
    distanceFromOrigin = function()
    {
      "Euclidean distance from the origin"
      sqrt(x ^ 2 + y ^ 2 + z ^ 2)
    }
  )
)


a_three_d_point <- three_d_point_generator$new(3, 4, 5)
a_three_d_point$distanceFromOrigin()


distanceFromOrigin = function()
{
  "Euclidean distance from the origin"
  two_d_distance <- callSuper()
  sqrt(two_d_distance ^ 2 + z ^ 2)
}


Summary
~~~~~~~


Test Your Knowledge: Quiz
~~~~~~~~~~~~~~~~~~~~~~~~~


Test Your Knowledge: Exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


