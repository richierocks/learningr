Vectors, Matrices And Arrays
----------------------------


Chapter Goals
~~~~~~~~~~~~~


Vectors
~~~~~~~


8.5:4.5                #sequence of numbers from 8.5 down to 4.5
c(1, 1:3, c(5, 8), 13) #values concatenated into single vector


vector("numeric", 5) 
vector("complex", 5)
vector("logical", 5)
vector("character", 5)
vector("list", 5)


numeric(5)
complex(5)
logical(5)
character(5)


Sequences
^^^^^^^^^


seq.int(3, 12) #same as 3:12       


seq.int(3, 12, 2)        
seq.int(0.1, 0.01, -0.01)


n <- 0
1:n        #not what you might expect!
seq_len(n)


pp <- c("Peter", "Piper", "picked", "a", "peck", "of", "pickled", "peppers")
for(i in seq_along(pp)) print(pp[i])


Lengths
^^^^^^^


length(1:5)
length(c(TRUE, FALSE, NA))


sn <- c("Sheena", "leads", "Sheila", "needs")
length(sn)
nchar(sn)


poincare <- c(1, 0, 0, 0, 2, 0, 2, 0)  #See http://oeis.org/A051629
length(poincare) <- 3
poincare
length(poincare) <- 8
poincare


Names
^^^^^


c(apple = 1, banana = 2, "kiwi fruit" = 3, 4)


x <- 1:4
names(x) <- c("apple", "bananas", "kiwi fruit", "")
x


names(x)


names(1:4)


Indexing Vectors
^^^^^^^^^^^^^^^^


(x <- (1:5) ^ 2)


x[c(1, 3, 5)]                        
x[c(-2, -4)]
x[c(TRUE, FALSE, TRUE, FALSE, TRUE)]


names(x) <- c("one", "four", "nine", "sixteen", "twenty five")
x[c("one", "nine", "twenty five")]


x[c(1, -1)]      #This doesn't make sense!


x[c(1, NA, 5)]     
x[c(TRUE, FALSE, NA, FALSE, TRUE)]


x[c(-2, NA)]     #This doesn't make sense either!


x[6]     


x[1.9]   #1.9 rounded to 1
x[-1.9]  #-1.9 rounded to -1


x[]


which(x > 10)


which.min(x)
which.max(x)


Vector Recycling and Repetition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


1:5 + 1  
1 + 1:5


1:5 + 1:15


1:5 + 1:7


rep(1:5, 3)          
rep(1:5, each = 3)
rep(1:5, times = 1:5)
rep(1:5, length.out = 7)


rep.int(1:5, 3)  #the same as rep(1:5, 3) 


rep_len(1:5, 13)


Matrices and Arrays
~~~~~~~~~~~~~~~~~~~


Creating Arrays and Matrices
^^^^^^^^^^^^^^^^^^^^^^^^^^^^


(three_d_array <- array(
  1:24,
  dim = c(4, 3, 2),
  dimnames = list(
    c("one", "two", "three", "four"),
    c("ein", "zwei", "drei"),
    c("un", "deux")
  )
))
class(three_d_array)


(a_matrix <- matrix(
  1:12,
  nrow = 4,            #ncol = 3 works the same
  dimnames = list(
    c("one", "two", "three", "four"),
    c("ein", "zwei", "drei")
  )
))                           
class(a_matrix)


(two_d_array <- array(
  1:12,
  dim = c(4, 3),
  dimnames = list(
    c("one", "two", "three", "four"),
    c("ein", "zwei", "drei")
  )
))
identical(two_d_array, a_matrix)
class(two_d_array)


matrix(
  1:12,
  nrow = 4,        
  byrow = TRUE,
  dimnames = list(
    c("one", "two", "three", "four"),
    c("ein", "zwei", "drei")
  )
)


Rows, Columns and Dimensions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^


dim(three_d_array)
dim(a_matrix)


nrow(a_matrix)
ncol(a_matrix)


nrow(three_d_array)
ncol(three_d_array)


length(three_d_array)
length(a_matrix)


dim(a_matrix) <- c(6, 2)
a_matrix


identical(nrow(a_matrix), NROW(a_matrix))
identical(ncol(a_matrix), NCOL(a_matrix))
recaman <- c(0, 1, 3, 6, 2, 7, 13, 20) #See http://oeis.org/A005132
nrow(x)
NROW(x)
ncol(x)
NCOL(x)
dim(x)     #There is no DIM(X)


Row, Column and Dimension Names
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


rownames(a_matrix)
colnames(a_matrix) 
dimnames(a_matrix) 
rownames(three_d_array)
colnames(three_d_array) 
dimnames(three_d_array)


Indexing Arrays
^^^^^^^^^^^^^^^


a_matrix[1, c("zwei", "drei")] #elements in 1st row, 2nd and 3rd columns


a_matrix[1, ]  #all the first row
a_matrix[, c("zwei", "drei")]  #all the second and third columns


Combining Matrices
^^^^^^^^^^^^^^^^^^


(another_matrix <- matrix(
  seq.int(2, 24, 2),
  nrow = 4,
  dimnames = list(
    c("five", "six", "seven", "eight"),
    c("vier", "funf", "sechs")
  )
))   
c(a_matrix, another_matrix)


cbind(a_matrix, another_matrix)
rbind(a_matrix, another_matrix)


Array Arithmetic
^^^^^^^^^^^^^^^^


a_matrix + another_matrix  
a_matrix * another_matrix   


(another_matrix <- matrix(1:12, nrow = 2))
a_matrix + another_matrix   #adding non-conformable matrices throws an error


t(a_matrix)


a_matrix %*% t(a_matrix)  #inner multiplication
1:3 %o% 4:6               #outer multiplication
outer(1:3, 4:6)           #same


(m <- matrix(c(1, 0, 1, 5, -3, 1, 2, 4, 7), nrow = 3))
m ^ -1
(inverse_of_m <- solve(m))
m %*% inverse_of_m         


Summary
~~~~~~~


Test Your Knowledge: Quiz
~~~~~~~~~~~~~~~~~~~~~~~~~


Test Your Knowledge: Exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


