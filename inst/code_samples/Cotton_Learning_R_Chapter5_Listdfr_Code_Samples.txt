Lists And Data Frames
---------------------


Chapter Goals
~~~~~~~~~~~~~


Lists
~~~~~


Creating Lists
^^^^^^^^^^^^^^


(a_list <- list(
  c(1, 1, 2, 5, 14, 42),    #See http://oeis.org/A000108
  month.abb, 
  matrix(c(3, -8, 1, -3), nrow = 2),
  asin
))


names(a_list) <- c("catalan", "months", "involutary", "arcsin")
a_list
(the_same_list <- list(
  catalan    = c(1, 1, 2, 5, 14, 42), 
  months     = month.abb, 
  involutary = matrix(c(3, -8, 1, -3), nrow = 2),
  arcsin     = asin
))


(main_list <- list(
  middle_list          = list(
    element_in_middle_list = diag(3),
    inner_list             = list(
      element_in_inner_list         = pi ^ 1:4,
      another_element_in_inner_list = "a"
    )
  ),
  element_in_main_list = log10(1:10)
))


Atomic and Recursive Variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


is.atomic(list())
is.recursive(list())
is.atomic(numeric())
is.recursive(numeric())


List Dimensions and Arithmetic
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


length(a_list)
length(main_list) #doesn't include the lengths of nested lists


dim(a_list)


nrow(a_list)
ncol(a_list)
NROW(a_list)
NCOL(a_list)


l1 <- list(1:5)
l2 <- list(6:10)
l1[[1]] + l2[[1]]


Indexing Lists
^^^^^^^^^^^^^^


l <- list(
  first  = 1,
  second = 2,
  third  = list(
    alpha = 3.1,
    beta  = 3.2
  )
)


l[1:2]
l[-3]
l[c("first", "second")] 
l[c(TRUE, TRUE, FALSE)]


l[[1]]
l[["first"]]


is.list(l[1])   
is.list(l[[1]])


l$first
l$f     #partial matching interprets 'f' as 'first'


l[["third"]]["beta"]
l[["third"]][["beta"]]
l[[c("third", "beta")]]


l[c(4, 2, 5)]   
l[c("fourth", "second", "fifth")]


l[["fourth"]]                     
l$fourth


l[[4]]       #this throws an error 


Converting Between Vectors and Lists
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


busy_beaver <- c(1, 6, 21, 107)  #See http://oeis.org/A060843
as.list(busy_beaver)


as.numeric(list(1, 6, 21, 107))


(prime_factors <- list(
  two   = 2,
  three = 3,
  four  = c(2, 2),
  five  = 5,
  six   = c(2, 3),
  seven = 7,
  eight = c(2, 2, 2),
  nine  = c(3, 3),
  ten   = c(2, 5)
))


unlist(prime_factors)


Combining Lists
^^^^^^^^^^^^^^^


c(list(a = 1, b = 2), list(3))


c(list(a = 1, b = 2), 3)


(matrix_list_hybrid <- cbind(
  list(a = 1, b = 2),
  list(c = 3, list(d = 4))
))
str(matrix_list_hybrid)


NULL
~~~~


(uk_bank_holidays_2013 <- list(
  Jan = "New Year's Day",
  Feb = NULL,
  Mar = "Good Friday",
  Apr = "Easter Monday",
  May = c("Early May Bank Holiday", "Spring Bank Holiday"),
  Jun = NULL,
  Jul = NULL,
  Aug = "Summer Bank Holiday",
  Sep = NULL,
  Oct = NULL,
  Nov = NULL,
  Dec = c("Christmas Day", "Boxing Day")
))


length(NULL)
length(NA)


is.null(NULL)
is.null(NA)


is.na(NULL)


uk_bank_holidays_2013$Jan <- NULL
uk_bank_holidays_2013$Feb <- NULL
uk_bank_holidays_2013


uk_bank_holidays_2013["Aug"] <- list(NULL)
uk_bank_holidays_2013                    


Pairlists
~~~~~~~~~


(arguments_of_sd <- formals(sd))
class(arguments_of_sd)


pairlist()
list()


Data Frames
~~~~~~~~~~~


Creating Data Frames
^^^^^^^^^^^^^^^^^^^^


(a_data_frame <- data.frame(
  x = letters[1:5],
  y = rnorm(5),
  z = runif(5) > 0.5
))
class(a_data_frame)


y <- rnorm(5)
names(y) <- month.name[1:5]
data.frame(
  x = letters[1:5],
  y = y,
  z = runif(5) > 0.5
)


data.frame(
  x = letters[1:5],
  y = y,
  z = runif(5) > 0.5,
  row.names = NULL
)


data.frame(
  x = letters[1:5],
  y = y,
  z = runif(5) > 0.5,
  row.names = c("Jackie", "Tito", "Jermaine", "Marlon", "Michael")
)


rownames(a_data_frame)
colnames(a_data_frame)
dimnames(a_data_frame)
nrow(a_data_frame)
ncol(a_data_frame)
dim(a_data_frame)


length(a_data_frame)
names(a_data_frame)


data.frame(        #lengths 1, 2 and 4 are OK
  x = 1,           #recycled 4 times
  y = 2:3,         #recycled twice
  z = 4:7          #the longest input; no recycling
)


data.frame(       #lengths 1, 2 and 3 cause an error
  x = 1,          #lowest common multiple is 6, which
  y = 2:3,        #is more than 3                                    
  z = 4:6
)


data.frame(
  "A column"   = letters[1:5],
  "!@#$%^&*()" = rnorm(5),
  "..."        = runif(5) > 0.5,
  check.names  = FALSE
)


Indexing Data Frames
^^^^^^^^^^^^^^^^^^^^


a_data_frame[2:3, -3]
a_data_frame[c(FALSE, TRUE, TRUE, FALSE, FALSE), c("x", "y")] 


class(a_data_frame[2:3, -3])
class(a_data_frame[2:3, 1])


a_data_frame$x[2:3]
a_data_frame[[1]][2:3]            
a_data_frame[["x"]][2:3]


a_data_frame[a_data_frame$y > 0 | a_data_frame$z, "x"]
subset(a_data_frame, y > 0 | z, x)


Basic Data Frame Manipulation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


t(a_data_frame)


another_data_frame <- data.frame(  #same cols as a_data_frame, different order
  z = rlnorm(5),       #log-normally distributed numbers
  y = sample(5),       #the numbers 1 to 5, in some order
  x = letters[3:7]
)
rbind(a_data_frame, another_data_frame) 
cbind(a_data_frame, another_data_frame)


merge(a_data_frame, another_data_frame, by = "x")
merge(a_data_frame, another_data_frame, by = "x", all = TRUE)


colSums(a_data_frame[, 2:3])
colMeans(a_data_frame[, 2:3])


Summary
~~~~~~~


Test Your Knowledge: Quiz
~~~~~~~~~~~~~~~~~~~~~~~~~


list(alpha = 1, list(beta = 2, gamma = 3, delta = 4), eta = NULL)


Test Your Knowledge: Exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


