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
# Data frames are created by calling "read.table(0 or read.csv()"
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