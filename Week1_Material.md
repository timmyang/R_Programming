Week1\_Material
================

## Background Material

Get working directory

``` r
getwd()
```

    ## [1] "/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project"

Set a new working directory

``` r
setwd("/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project/data")
```

Display a list of files in the working directory

``` r
dir()
```

    ## [1] "data.R"       "hw1_data.csv" "y.R"

Create a function

``` r
myfunction <- function() {
        x <- rnorm(100)
        mean(x)
}
```

Execute a function

``` r
myfunction()
```

    ## [1] 0.07964859

Display a list of objects in the current environment

``` r
ls()
```

    ## [1] "myfunction"

Source(bring) all functions (objects) in a different file:  
`source("mycode.R")`

## Week 1: Getting Started and R Nuts and Bolts

Assignment operator, `<-`

``` r
x <- 5
msg <- "hello"
```

Display the numeric object (vector), `x`, that has one element

``` r
print(x)        # explicit printing
```

    ## [1] 5

``` r
x               # auto-printing
```

    ## [1] 5

*The \[1\] indicated that x is a `vector` and 5 is the first element*

Display the character object (vector), `msg`, that has one element

``` r
print(msg)
```

    ## [1] "hello"

``` r
msg
```

    ## [1] "hello"

Create integer sequences

``` r
x <- 1:20
x
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

## Objects

Everything in R is an `object`. `Atomic` classes of objects:

  - character  
  - numeric (real numbers)  
  - integer  
  - complex  
  - logical (TRUE/FALSE)

The most basic object is a `vector`

  - A vector can only contain objects of the same class  
    BUT: The one exception is a “list”, which is represented as a vector
    but can contain objects of different classes

## Numbers

Infinity  
`Inf`

Not a Number (undefined value)  
`NaN`

Attributes: `name`, `dimnames`, `dimensions` (e.g. matrices, arrays),
`class`, `length`  
`attributes()`

## Vectors

Create vectors of objects `c()`

``` r
x <- c(0.5, 0.6)        # numeric
x <- c(TRUE, FALSE)     # logical
x <- c(T, F)            # logical
x <- c("a", "b", "c")   # character
x <- 9:29               # integer
x <- c(1+0i, 2+4i)      # complex
```

`vector()` function

``` r
x <- vector("numeric", length = 10)
x
```

    ##  [1] 0 0 0 0 0 0 0 0 0 0

## Mixing Objects

Coerces to the least common denominator

``` r
y <- c(1.7, "a")        # character
y <- c(TRUE, 2)         # numeric
y <- c("a", TRUE)       # character
```

Explicit Coercion: `as.`

``` r
x <- 0:6
x
```

    ## [1] 0 1 2 3 4 5 6

``` r
class(x)
```

    ## [1] "integer"

``` r
as.numeric(x)
```

    ## [1] 0 1 2 3 4 5 6

``` r
as.logical(x)
```

    ## [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE

``` r
as.character(x)
```

    ## [1] "0" "1" "2" "3" "4" "5" "6"

Nonsensical coercion results in NAs

``` r
x <- c("a", "b", "c")

as.numeric(x)
```

    ## Warning: NAs introduced by coercion

    ## [1] NA NA NA

``` r
as.logical(x)
```

    ## [1] NA NA NA

``` r
as.complex(x)
```

    ## Warning: NAs introduced by coercion

    ## [1] NA NA NA

## List

``` r
x <- list(1, "a", TRUE, 1 + 4i)
x
```

    ## [[1]]
    ## [1] 1
    ## 
    ## [[2]]
    ## [1] "a"
    ## 
    ## [[3]]
    ## [1] TRUE
    ## 
    ## [[4]]
    ## [1] 1+4i

*\[\[1\]\] Elements of a list*  
*\[1\] 1 Elements of a vector*

## Matrices

Matrices are `vectors` with a `dimension attribute`  
Must have every element be the same class (object)

``` r
m <- matrix(nrow = 2, ncol = 3)
m
```

    ##      [,1] [,2] [,3]
    ## [1,]   NA   NA   NA
    ## [2,]   NA   NA   NA

``` r
dim(m)
```

    ## [1] 2 3

``` r
attributes(m)
```

    ## $dim
    ## [1] 2 3

Matrices are constructed `column-wise`

``` r
m <- matrix(1:6, nrow = 2, ncol = 3)
m
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    3    5
    ## [2,]    2    4    6

Matrices can also be created directly from `vectors` by adding a
`dimension attribute`

``` r
m <- 1:10
m
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10

``` r
dim(m) <- c(2, 5)
m
```

    ##      [,1] [,2] [,3] [,4] [,5]
    ## [1,]    1    3    5    7    9
    ## [2,]    2    4    6    8   10

Another way to create matrices by `cbind()` and `rbind()`

``` r
x <- 1:3
y <- 10:12

cbind(x, y)
```

    ##      x  y
    ## [1,] 1 10
    ## [2,] 2 11
    ## [3,] 3 12

``` r
rbind(x, y)
```

    ##   [,1] [,2] [,3]
    ## x    1    2    3
    ## y   10   11   12

## Factors

Factors are used to represent `categorical data`  
Factors can be `un-ordered` or `ordered`  
Factors are vectors with `labels`

``` r
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
```

    ## [1] yes yes no  yes no 
    ## Levels: no yes

``` r
table(x)
```

    ## x
    ##  no yes 
    ##   2   3

``` r
unclass(x)
```

    ## [1] 2 2 1 2 1
    ## attr(,"levels")
    ## [1] "no"  "yes"

Setting the order of the levels

``` r
x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))
x
```

    ## [1] yes yes no  yes no 
    ## Levels: yes no

``` r
table(x)
```

    ## x
    ## yes  no 
    ##   3   2

``` r
unclass(x)
```

    ## [1] 1 1 2 1 2
    ## attr(,"levels")
    ## [1] "yes" "no"

## Missing Values

`NA`  
`NaN`  
`is.na()` is used to test objects if they are NA  
`is.nan()` is used to test for NaN  
NA values have a class also, so there are integer NA, character NA,
etc.  
A NaN value is also NA but the converse is not true (NaN means Not a
Number, i.e. undefined value)

``` r
is.na(NaN)
```

    ## [1] TRUE

``` r
is.nan(NA)
```

    ## [1] FALSE

## Data Frames

Data frames are used to store tabular data  
Represented as a special type of list where every element of the list
has to have the same length  
Each element of the list: column, and the length of each element of the
list: the number of rows  
However, each column doesn’t have to be the same type

`row.names` - every row has its own name  
Data frames are created by calling `read.table()` or `read.csv()`  
Can be converted to a matrix by calling `data.matrix()` - force objects
will be coerced to be the same class

``` r
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
```

    ##   foo   bar
    ## 1   1  TRUE
    ## 2   2  TRUE
    ## 3   3 FALSE
    ## 4   4 FALSE

``` r
nrow(x)
```

    ## [1] 4

``` r
ncol(x)
```

    ## [1] 2

## Names Attribute

Very useful for writing readable code and self-describing objects

``` r
x <- 1:3
names(x)
```

    ## NULL

``` r
names(x) <- c("foo", "bar", "norf") # name for each element
x
```

    ##  foo  bar norf 
    ##    1    2    3

``` r
names(x)
```

    ## [1] "foo"  "bar"  "norf"

``` r
x <- list(a = 1, b = 2, c = 3)
x
```

    ## $a
    ## [1] 1
    ## 
    ## $b
    ## [1] 2
    ## 
    ## $c
    ## [1] 3

``` r
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m
```

    ##   c d
    ## a 1 3
    ## b 2 4

## Summary

Data Types:

  - atomic classes: numeric, logical, character, integer, complex
  - vectors, lists
  - factors
  - missing values
  - data frames
  - names

## Reading Data

Tabular Data: `read.table()`, `read.csv()` (returns a dataframe in R)  
Lines of a text file: `readLines()`  
R Code files: `source()`  
R Code files: `dget()` for reading R objects that have been dparsed into
text files  
Reading binary objects into R: `load()` for reading in saved workspaces,
`unserialize()` for reading single R objects in binary form

## Writing Data

`write.table()`  
`writeLines()`  
`dump()`  
`dput()`  
`save()`  
`serialize()`

`read.table()` function

``` r
str(read.table)
```

    ## function (file, header = FALSE, sep = "", quote = "\"'", dec = ".", numerals = c("allow.loss", 
    ##     "warn.loss", "no.loss"), row.names, col.names, as.is = !stringsAsFactors, 
    ##     na.strings = "NA", colClasses = NA, nrows = -1, skip = 0, check.names = TRUE, 
    ##     fill = !blank.lines.skip, strip.white = FALSE, blank.lines.skip = TRUE, 
    ##     comment.char = "#", allowEscapes = FALSE, flush = FALSE, stringsAsFactors = default.stringsAsFactors(), 
    ##     fileEncoding = "", encoding = "unknown", text, skipNul = FALSE)

  - `file`, the name of a file, or a connection  
  - `header`, logical indicating if the file has a header line  
  - `sep`, a string indicating how the columns are separated  
  - `colClasses`, a character vector indicating the class of each column
    in the dataset  
  - `nrows`, the number of rows in the dataset  
  - `comment.char`, a character string indicating the comment
    character  
  - `skip`, the number of lines to skip from the beginning  
  - `stringAsFactors`, should character variables be coded as factors?
    `defualt = TRUE(yes)`

e.g. `data <- read.table("foo.txt")`  
`read.csv` = `read.table` except that the default separator is a comma

## Reading Large Tables

To prevent R from choking:  
Read the “help” page for `read.table()`, which contains many hints  
Make a rough calculation of the memory required to store your dataset  
Set `comment.char = ""` if there are no commented lines in your file

the `colClasses` argument  
initial \<- `read.table("datatable.txt", nrows = 100)`  
classes \<- `sapply(initial, class)`  
tabAll \<- `read.table("datatable.text", colClasses = classes)`

## Textual Data Formats

`dumping` and `dputing` preserves metadata(sacrificing some
readability), so that another user doesn’t have to specify it all over
again.  
advantage: editable  
disadvanage: not space-efficient

`dput()`

``` r
y <- data.frame(a = 1, b = "a")
dput(y)
```

    ## structure(list(a = 1, b = "a"), class = "data.frame", row.names = c(NA, 
    ## -1L))

``` r
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y
```

    ##   a b
    ## 1 1 a

`dput()` function, essentially writes R code, which can be used to
reconstruct an R object

`dump()`  
`dget()` can only be used on a single R object  
`dump()` can be used on multiple R objects

``` r
x <- "foo"
y <- data.frame(a = 1, b = "a")

dump(c("x", "y"), file = "data.R")
rm(x, y) # remove x and y
source("data.R")

y
```

    ##   a b
    ## 1 1 a

``` r
x
```

    ## [1] "foo"

## Connections: Interfaces to the Outside World

`file` opens a connection to a file  
`gzfile` opens a connection to a file compressed with gzip  
`bzfile` opens a connection to a file compressed with bzip2  
`url` opens a connection to a webpage

``` r
str(file) # "str()" displays the internal structure of a R object
```

    ## function (description = "", open = "", blocking = TRUE, encoding = getOption("encoding"), 
    ##     raw = FALSE, method = getOption("url.method", "default"))

  - `description` is the name of the file  
  - `open` is a code indicating  
  - `r` read only  
  - `w` writing (and initializina new file)  
  - `a` appending  
  - `rb`, `wb`, `ab` reading, writing, or appending in binary mode
    (Windows)

`con <- file("foo.txt", "r")`  
`data <- read.csv(con)`  
`close(con)`

is the same as  
`data <- read.csv("foo.txt")`

``` r
connection <- url("http://www.jhsph.edu", "r")
x <- readLines(connection)
head(x)
```

    ## [1] "<!DOCTYPE html>"                                               
    ## [2] "<html lang=\"en\">"                                            
    ## [3] ""                                                              
    ## [4] "<head>"                                                        
    ## [5] "<meta charset=\"utf-8\" />"                                    
    ## [6] "<title>Johns Hopkins Bloomberg School of Public Health</title>"

## Subsetting: Basics

`[` always returns an `object` of the same class as original (vector -\>
vector) (list -\> list)  
Can be used to select more than one element of an object (there is one
exception)  
`[[` extracts `elements` of a list or a dataframe  
Can only be used to extract a single element and the class of the
returned object will not necessarily be a list or dataframe  
`$` extracts `elements` of a list or dataframe `by name`

``` r
x <- c("a", "b", "c", "c", "d", "a")
x[1]
```

    ## [1] "a"

``` r
x[1:4]                          # numeric index
```

    ## [1] "a" "b" "c" "c"

``` r
x[x > "a"]                      # logical index
```

    ## [1] "b" "c" "c" "d"

``` r
u <- x > "a"
u
```

    ## [1] FALSE  TRUE  TRUE  TRUE  TRUE FALSE

``` r
x[u]
```

    ## [1] "b" "c" "c" "d"

## Subsetting: Lists

``` r
x <- list(foo = 1:4, bar = 0.6)
x
```

    ## $foo
    ## [1] 1 2 3 4
    ## 
    ## $bar
    ## [1] 0.6

``` r
x[1]
```

    ## $foo
    ## [1] 1 2 3 4

``` r
x[[1]]
```

    ## [1] 1 2 3 4

``` r
x[[2]]
```

    ## [1] 0.6

``` r
x$bar
```

    ## [1] 0.6

``` r
x[["bar"]]      # = x[[2]]
```

    ## [1] 0.6

``` r
x["bar"]        # = x[2]
```

    ## $bar
    ## [1] 0.6

``` r
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x
```

    ## $foo
    ## [1] 1 2 3 4
    ## 
    ## $bar
    ## [1] 0.6
    ## 
    ## $baz
    ## [1] "hello"

``` r
x[c(1, 3)]
```

    ## $foo
    ## [1] 1 2 3 4
    ## 
    ## $baz
    ## [1] "hello"

``` r
name <- "foo"
x[[name]]       # = x[[1]]
```

    ## [1] 1 2 3 4

``` r
x$name          # element 'name' doesn't exist!
```

    ## NULL

``` r
x$foo
```

    ## [1] 1 2 3 4

``` r
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x
```

    ## $a
    ## $a[[1]]
    ## [1] 10
    ## 
    ## $a[[2]]
    ## [1] 12
    ## 
    ## $a[[3]]
    ## [1] 14
    ## 
    ## 
    ## $b
    ## [1] 3.14 2.81

``` r
x[[c(1, 3)]]
```

    ## [1] 14

``` r
x[[1]][[3]]
```

    ## [1] 14

``` r
x[[c(2, 1)]]
```

    ## [1] 3.14

## Subsetting - Matrices

``` r
x <- matrix(1:6, 2, 3)
x
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    3    5
    ## [2,]    2    4    6

``` r
x[1, 2]
```

    ## [1] 3

``` r
x[2, 1]
```

    ## [1] 2

``` r
x[1, ]
```

    ## [1] 1 3 5

``` r
x[, 2]
```

    ## [1] 3 4

By default, when a single element of a matrix is retrieved, it is
returned as a `vector` of length 1 rather than a 1 x 1 matrix  
This behavior can be turned off by setting `drop = FALSE`

``` r
x[1, 2]
```

    ## [1] 3

``` r
x[1, 2, drop = FALSE]
```

    ##      [,1]
    ## [1,]    3

``` r
x[1, ]
```

    ## [1] 1 3 5

``` r
x[1, , drop = FALSE]
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    3    5

## Subsetting - Partial Matching

``` r
x <- list(aardvark = 1:5)
x
```

    ## $aardvark
    ## [1] 1 2 3 4 5

``` r
x$a
```

    ## [1] 1 2 3 4 5

``` r
x[["a"]]
```

    ## NULL

``` r
x [["a", exact = FALSE]]
```

    ## [1] 1 2 3 4 5

## Subsetting - Removing Missing Values

``` r
x <- c(1, 2, NA, 4, NA, 5)
is.na(x)
```

    ## [1] FALSE FALSE  TRUE FALSE  TRUE FALSE

``` r
bad <- is.na(x)
x[!bad]
```

    ## [1] 1 2 4 5

``` r
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, NA)
complete.cases(x, y)
```

    ## [1]  TRUE  TRUE FALSE  TRUE FALSE FALSE

``` r
good <- complete.cases(x, y)
x[good]
```

    ## [1] 1 2 4

``` r
y[good]
```

    ## [1] "a" "b" "d"

``` r
airquality[1:6, ]
```

    ##   Ozone Solar.R Wind Temp Month Day
    ## 1    41     190  7.4   67     5   1
    ## 2    36     118  8.0   72     5   2
    ## 3    12     149 12.6   74     5   3
    ## 4    18     313 11.5   62     5   4
    ## 5    NA      NA 14.3   56     5   5
    ## 6    28      NA 14.9   66     5   6

``` r
complete.cases(airquality[1:6, ])
```

    ## [1]  TRUE  TRUE  TRUE  TRUE FALSE FALSE

``` r
good <- complete.cases(airquality)
airquality[good, ][1:6, ]
```

    ##   Ozone Solar.R Wind Temp Month Day
    ## 1    41     190  7.4   67     5   1
    ## 2    36     118  8.0   72     5   2
    ## 3    12     149 12.6   74     5   3
    ## 4    18     313 11.5   62     5   4
    ## 7    23     299  8.6   65     5   7
    ## 8    19      99 13.8   59     5   8

## Vectorized Operations

``` r
x <- 1:4; y <- 6:9
x
```

    ## [1] 1 2 3 4

``` r
y
```

    ## [1] 6 7 8 9

``` r
x + y
```

    ## [1]  7  9 11 13

``` r
x > 2
```

    ## [1] FALSE FALSE  TRUE  TRUE

``` r
x >= 2
```

    ## [1] FALSE  TRUE  TRUE  TRUE

``` r
y == 8
```

    ## [1] FALSE FALSE  TRUE FALSE

``` r
x * y
```

    ## [1]  6 14 24 36

``` r
x / y
```

    ## [1] 0.1666667 0.2857143 0.3750000 0.4444444

``` r
x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x
```

    ##      [,1] [,2]
    ## [1,]    1    3
    ## [2,]    2    4

``` r
y
```

    ##      [,1] [,2]
    ## [1,]   10   10
    ## [2,]   10   10

``` r
x * y                   # element-wise multiplication
```

    ##      [,1] [,2]
    ## [1,]   10   30
    ## [2,]   20   40

``` r
x / y
```

    ##      [,1] [,2]
    ## [1,]  0.1  0.3
    ## [2,]  0.2  0.4

``` r
x %*% y                 # true matrix multiplication
```

    ##      [,1] [,2]
    ## [1,]   40   40
    ## [2,]   60   60

<LINK>  
*Italic*  
**Bold**

  - bullet point

Inserting R Code: `Cmd+Option+I`  
Avoid printing the code: `echo = FALSE`
