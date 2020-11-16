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