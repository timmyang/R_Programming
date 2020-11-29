################################# BACKGROUND MATERIAL #################################
#                                (Working Directory, Functions)
# Get Working Directory
getwd()

# Set a new Working Directory
setwd("~/Desktop/Desktop/5_Coursera/1_R_Programming/data")

# Display a list of files in the working directory
dir()

# Read a csv file
read.csv("mydata.csv")

# Create a Function
myfunction <- function() {
        x <- rnorm(100)
        mean(x)
}

# Execute a Function
myfunction()

# Display a list of objects in the current environment
ls()

# Source(bring) all functions(objects) in a different file
source("mycode.R")


################################# Week 1: Getting Started and R Nuts and Bolts #################################
#                                 (Assignment Operator, Objects, Vectors, Lists)
# Assignment Operator, <-
x <- 5
msg <- "hello"

# Display the numeric object(vector), x, that has one element
print(x)        # explicit printing
x               # auto-printing
# [1] 5
# The [1] indicated that x is a vector and 5 is the first element

# Display the character object(vector), msg, that has one element
print(msg)
msg

# Create integer sequences
x <- 1:20
x
# [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

#
# Objects
# Everything in R is an "Object"
## Atomic classes of objects: character, numeric (real numbers), integer, complex, logical (TRUE/FALSE)

# The most basic object is a "Vector"
## A vector can only contain objects of the same class
## BUT: The one exception is a "list", which is represented as a vector but can contain objects of different classes

# Numbers
# Infinity
Inf
# Not a Number (undefined value)
NaN 

# Attributes: "name, dimnames", "dimensions (e.g. matrices, arrays)", "class", "length"
attributes()

#
# Vectors
# create vectors of objects "c()"
x <- c(0.5, 0.6)        # numeric
x <- c(TRUE, FALSE)     # logical
x <- c(T, F)            # logical
x <- c("a", "b", "c")   # character
x <- 9:29               # integer
x <- c(1+0i, 2+4i)      # complex

# "vector()" function
x <- vector("numeric", length = 10)
x
# [1] 0 0 0 0 0 0 0 0 0 0

# Mixing Objects        (coerces to the least common denominator)
y <- c(1.7, "a")        # character
y <- c(TRUE, 2)         # numeric
y <- c("a", TRUE)       # character

# Explicit Coercion, "as."
x <- 0:6
x
# [1] 0 1 2 3 4 5 6
class(x)
# [1] "integer"

as.numeric(x)
# [1] 0 1 2 3 4 5 6
as.logical(x)
# [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
as.character(x)
# [1] "0" "1" "2" "3" "4" "5" "6"

# Nonsensical coercion results in NAs
x <- c("a", "b", "c")
as.numeric(x)
# [1] NA NA NA
as.logical(x)
# [1] NA NA NA
as.complex(x)
# [1] NA NA NA

#
# List
x <- list(1, "a", TRUE, 1 + 4i)
x
# [[1]]                 # Elements of a list
# [1] 1                 # Elements of a vector

# [[2]]
# [1] "a"

# [[3]]
# [1] TRUE

# [[4]]
# [1] 1+4i

#
# Matrices
# Matrices are "vectors" with a "dimension attribute"
# must have every element be the same class (object)
m <- matrix(nrow = 2, ncol = 3)
m
#       [,1] [,2] [,3]
# [1,]   NA   NA   NA
# [2,]   NA   NA   NA

dim(m)
# [1] 2 3

attributes(m)
# $dim
# [1] 2 3

# Matrices are constructed "column-wise"
m <- matrix(1:6, nrow = 2, ncol = 3)
m
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

# Matrices can also be created directly from "vectors" by adding a "dimension attribute"
m <- 1:10
m
# [1]  1  2  3  4  5  6  7  8  9 10
dim(m) <- c(2, 5)
m
#       [,1] [,2] [,3] [,4] [,5]
# [1,]    1    3    5    7    9
# [2,]    2    4    6    8   10

# Another way to create matrices by "cbind()" and "rbind()"
x <- 1:3
y <- 10:12

cbind(x, y)
#      x  y
# [1,] 1 10
# [2,] 2 11
# [3,] 3 12

rbind(x, y)
#    [,1] [,2] [,3]
# x    1    2    3
# y   10   11   12

#
# Factors
# Factors are used to represent "categorical data"
# Factors can be "un-ordered" or "ordered".
# Factors are vectors with "labels"
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
# [1] yes yes no  yes no 
# Levels: no yes

table(x)
# x
# no yes 
#  2   3 

unclass(x)
# [1] 2 2 1 2 1
# attr(,"levels")
# [1] "no"  "yes"

# Setting the order of the levels
x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))
x
# [1] yes yes no  yes no 
# Levels: yes no

table(x)
# x
# yes no 
#  3  2 

unclass(x)
# [1] 1 1 2 1 2
# attr(,"levels")
# [1] "yes" "no"

#
# Missing Values
NA
NaN
# "is.na()" is used to test objects if they are NA
# "is.nan()" is used to test for NaN
# NA values have a class also, so there are integer NA, character NA, etc.
# A NaN value is also NA but the converse is not true (NaN means Not a Number, i.e. undefined value)
is.na(NaN)
# [1] TRUE
is.nan(NA)
# [1] FALSE

#
# Data Frames
# Data frames are used to store tabular data
# represented as a special type of list where every element of the list has to have the same length
# Each element of the list: column, and the length of each element of the list: the number of rows
# However, each column doesn't have to be the same type

# "row.names" - every row has its own name
# Data frames are created by calling "read.table()" or read.csv()"
# Can be converted to a matrix by calling "data.matrix()"   - force objects will be coerced to be the same class

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
#   foo   bar
# 1   1  TRUE
# 2   2  TRUE
# 3   3 FALSE
# 4   4 FALSE

nrow(x)
# [1] 4
ncol(x)
# [1] 2

#
# Names Attribute
# Very useful for writing readable code and self-describing objects

x <- 1:3
names(x)
# NULL
names(x) <- c("foo", "bar", "norf") # name for each element
x
# foo  bar norf 
#   1    2    3 
names(x)
# [1] "foo"  "bar"  "norf"

x <- list(a = 1, b = 2, c = 3)
x
# $a
# [1] 1
# 
# $b
# [1] 2
# 
# $c
# [1] 3

m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m
#   c d
# a 1 3
# b 2 4


#
## Summary
# Data Types -
# atomic classes: numeric, logical, character, integer, complex \
# vectors, lists
# factors
# missing values
# data frames
# names

#
# Reading Data
# Tabular Data: "read.table()", "read.csv()" (returns a dataframe in R)
# Lines of a text file: "readLines()" 
# R Code files: "source()"
# R Code files: "dget()" for reading R objects that have been dparsed into text files
# Reading binary objects into R: "load()" for reading in saved workspaces, "unserialize()" for reading single R objects in binary form

# Writing Data
# "write.table()"
# "writeLines()"
# "dump()"
# "dput()"
# "save()"
# "serialize()"

# "read.table()" function
# "file", the name of a file, or a connection
# "header", logical indicating if the file has a header line
# "sep", a string indicating how the columns are separated
# "colClasses", a charater vector indicating the class of each column in the dataset
# "nrows", the number of rows in the dataset
# "comment.char", a charater string indicating the comment character
# "skip", the number of lines to skiip from the beginning
# "stringAsFactors", should character variables be coded as factors? defualt = TRUE(yes)

# e.g. "data <- read.table("foo.txt")"
# "read.csv" = "read.table" except that the default separator is a comma

#
# Reading Large Tables
# To prevent R from choking:
# Read the "help" page for "read.table()", which contains many hints
# Make a rough calculation of the memory required to store your dataset
# Set "comment.char = "" if there are no commented lines in your file

# the "colClasses" argument
# initial <- read.table("datatable.txt", nrows = 100)
# classes <- sapply(initial, class)
# tabAll <- read.table("datatable.text", colClasses = classes)

#
# Textual Data Formats
# "dumping" and "dputing" preserves metadata(sacrificing some readability), so that another user doesn't have to specify it all over again.
# advantage: editable
# disadvanage: not space-efficient

# "dput()"
y <- data.frame(a = 1, b = "a")
dput(y)
# structure(list(a = 1, b = "a"), class = "data.frame", row.names = c(NA, -1L))
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y
#   a b
# 1 1 a

# "dput()" function, essentially writes R code, which can be used to reconstruct an R object

# "dump()"
# "dget()" can only be used on a single R object
# "dump()" can be used on multiple R objects
x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "data.R")
rm(x, y) # remove x and y
source("data.R")
y
x

#
# Connections: Interfaces to the Outside World
# "file" opens a connection to a file
# "gzfile" opens a connection to a file compressed with gzip
# "bzfile" opens a connection to a file compressed with bzip2
# "url" opens a connection to a webpage

str(file) # "str()" displays the internal structure of a R object
# function (description = "", open = "", blocking = TRUE, encoding = getOption("encoding"), raw = FALSE, method = getOption("url.method", 
# "default"))  

# "description" is the name of the file
# "open" is a code indicating
# - "r" read only
# - "w" writing (and initializina new file)
# - "a" appending
# - "rb", "wb", "ab" reading, writing, or appending in binary mode (Windows)

con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)

# is the same as 
data <- read.csv("foo.txt")


connection <- url("http://www.jhsph.edu", "r")
x <- readLines(connection)
head(x)


#
# Subsetting: Basics
# "[" always returns "an object" of the same class as original (vector -> vector) (list -> list)
# can be used to select more than one element of an object (there is one exception)
# "[[" extracts "elements" of a list or a dataframe
# can only be used to extract a single element and the class of the returned object will not necessarily be a list or dataframe
# "$" extracts "elements" of a list or dataframe "by name"
  
x <- c("a", "b", "c", "c", "d", "a")
x[1]
# [1] "a"
x[1:4]                          # numeric index
# [1] "a" "b" "c" "c"

x[x > "a"]                      # logical index
# [1] "b" "c" "c" "d"
u <- x > "a"
u
# [1] FALSE  TRUE  TRUE  TRUE  TRUE FALSE
x[u]
# [1] "b" "c" "c" "d"

#
# Subsetting: Lists
x <- list(foo = 1:4, bar = 0.6)
x
# $foo
# [1] 1 2 3 4

# $bar
# [1] 0.6


x[1]
# $foo
# [1] 1 2 3 4

x[[1]]
# [1] 1 2 3 4
x[[2]]
# [1] 0.6

x$bar
# [1] 0.6
x[["bar"]]      # = x[[2]]
# [1] 0.6
x["bar"]        # = x[2]
# $bar
# [1] 0.6


x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x
# $foo
# [1] 1 2 3 4

# $bar
# [1] 0.6

# $baz
# [1] "hello"

x[c(1, 3)]
# $foo
# [1] 1 2 3 4

# $baz
# [1] "hello"

name <- "foo"
x[[name]] # = x[[1]]
# [1] 1 2 3 4
x$name          # element 'name' doesn't exist!
# NULL
x$foo
# [1] 1 2 3 4           

x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x
# $a
# $a[[1]]
# [1] 10

# $a[[2]]
# [1] 12

# $a[[3]]
# [1] 14


# $b
# [1] 3.14 2.81

x[[c(1, 3)]]
# [1] 14
x[[1]][[3]]
# [1] 14
x[[c(2, 1)]]
# [1] 3.14

#
# Subsetting - Matrices
x <- matrix(1:6, 2, 3)
x
#       [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

x[1, 2]
# [1] 3
x[2, 1]
# [1] 2

x[1, ]
# [1] 1 3 5
x[, 2]
# [1] 3 4

# By default, when a single element of a matrix is retrieved, it is returned as a "vector" of length 1 rather than a 1 x 1 matrix
# This behavior can be turned off by setting "drop = FALSE"
x[1, 2]
# [1] 3
x[1, 2, drop = FALSE]
#       [,1]
# [1,]    3

x[1, ]
# [1] 1 3 5
x[1, , drop = FALSE]
#       [,1] [,2] [,3]
# [1,]    1    3    5

#
# Subsetting - Partial Matching
x <- list(aardvark = 1:5)
x
# $aardvark
# [1] 1 2 3 4 5

x$a
# [1] 1 2 3 4 5
x[["a"]]
# NULL
x [["a", exact = FALSE]]
# [1] 1 2 3 4 5

#
# Subsetting - Removing Missing Values
x <- c(1, 2, NA, 4, NA, 5)
is.na(x)
# [1] FALSE FALSE  TRUE FALSE  TRUE FALSE
bad <- is.na(x)
x[!bad]
# [1] 1 2 4 5

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, NA)
complete.cases(x, y)
# [1]  TRUE  TRUE FALSE  TRUE FALSE FALSE
good <- complete.cases(x, y)
x[good]
# [1] 1 2 4
y[good]
# [1] "a" "b" "d"

airquality[1:6, ]
#   Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 5    NA      NA 14.3   56     5   5
# 6    28      NA 14.9   66     5   6
complete.cases(airquality[1:6, ])
# [1]  TRUE  TRUE  TRUE  TRUE FALSE FALSE
good <- complete.cases(airquality)
airquality[good, ][1:6, ]
#   Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 7    23     299  8.6   65     5   7
# 8    19      99 13.8   59     5   8

#
# Vectorized Operations
x <- 1:4; y <- 6:9
x
# [1] 1 2 3 4
y
# [1] 6 7 8 9

x + y
# [1]  7  9 11 13
x > 2
# [1] FALSE FALSE  TRUE  TRUE
x >= 2
# [1] FALSE  TRUE  TRUE  TRUE
y == 8
# [1] FALSE FALSE  TRUE FALSE
x * y
# [1]  6 14 24 36
x / y
# [1] 0.1666667 0.2857143 0.3750000 0.4444444

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x
#       [,1] [,2]
# [1,]    1    3
# [2,]    2    4
y
#       [,1] [,2]
# [1,]   10   10
# [2,]   10   10

x * y                   # element-wise multiplication
#       [,1] [,2]
# [1,]   10   30
# [2,]   20   40
x / y
#       [,1] [,2]
# [1,]  0.1  0.3
# [2,]  0.2  0.4
x %*% y                 # true matrix multiplication
#       [,1] [,2]
# [1,]   40   40
# [2,]   60   60


################################# Week 1 Quiz #################################
# Question 1
# The R language is a dialect of which of the following programming languages?
# (Answer): S

# Question 2
# The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition? Select all that apply.
# (Answer): all except the following 
# Freedom 0: to run the program, for any purpose
# Freedom 1: to study how the program works, and adapt it to your needs
# Freedom 2: to redistribute copies so you can help your neighbor
# Freedom 3: improve the program, and release your improvements to the public, so that the whole community benefits

# Question 3
# In R the following are all atomic data types EXCEPT: (Select all that apply)
# (Answer):
# (atomic data types): numeric, complex, integer, logical, character
# (non-atomic data types): table, matrix, array, data frame, list

# Question 4
# If I execute the expression x <- 4 in R, what is the class of the object `x' as determined by the `class()' function?
x <- 4
class(x)
# [1] "numeric"

# Question 5
# What is the class of the object defined by the expression x <- c(4, "a", TRUE)?
x <- c(4, "a", TRUE)
class(x)
# [1] "character"

# Question 6
# If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression rbind(x, y)?
x <- c(1, 3, 5); y <- c(3, 2, 10)
rbind(x, y)
#    [,1] [,2] [,3]
# x    1    3    5
# y    3    2   10

# Question 7
# A key property of vectors in R is that
# (Answer): elements of a vector all must be of the same class

# Question 8
# Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[2]] give me? Select all that apply
x <- list(2, "a", "b", TRUE)
x[[2]]
# [1] 3

# Question 9
# Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?
x <- 1:4; y <- 2
x + y
# [1] 3 4 5 6

# Question 10
# Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all elements of this vector that are greater than 10 to be equal to 4. What R code achieves this? Select all that apply.
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x > 10] <- 4
# OR
x[x >= 11] <- 4

# Question 11
#Use the Week 1 Quiz Data Set to answer questions 11-20.
# In the dataset provided for this Quiz, what are the column names of the dataset?
getwd()
# [1] "/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project"
setwd("~/Desktop/Desktop/5_Coursera/1_R_Programming/data")
dir()

# [1] "hw1_data.csv"
table <- read.csv("hw1_data.csv")

colnames(table)
# [1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"  

# Question 12
# Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
table[1:2, ]
head(table, 2)
#    Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2

# Question 13
# How many observations (i.e. rows) are in this data frame?
nrow(table)
# [1] 153

# Question 14
# Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
tail(table, 2)
#      Ozone Solar.R Wind Temp Month Day
# 152    18     131  8.0   76     9  29
# 153    20     223 11.5   68     9  30

# Question 15
# What is the value of Ozone in the 47th row?
which(colnames(table) == "Ozone")
match("Ozone", colnames(table))
# [1] 1

table[47, 1]
# [1] 21

# Question 16
# How many missing values are in the Ozone column of this data frame?
sum(is.na(table[, 1]))
# [1] 37

# Question 17
# What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(table[, 1], na.rm = TRUE)
# [1] 42.12931
# OR
x <- complete.cases(table[, 1])
mean(table[x, 1])
# [1] 42.12931
# OR
x <- is.na(table[, 1])
mean(table[!x, 1])
# [1] 42.12931

# Question 18
# Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
x <- complete.cases(table[, "Ozone"], table[, "Temp"])
y <- table[x, ]
View(y)

z <- y[y$Ozone > 31 & y$Temp > 90, ]
View(z)
mean(z[, "Solar.R"])
# [1] 212.8

# Question 19
# What is the mean of "Temp" when "Month" is equal to 6?
x <- table[table$Month == 6, ]
mean(x[, "Temp"])
# [1] 79.1

# Question 20
# What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
x <- table[table$Month == 5, ]
max(x[, "Ozone"], na.rm = TRUE)
# [1] 115