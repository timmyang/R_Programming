Week 2
================

# Table of Contents

  - **Control Structures**
    
      - Introduction
      - If-else
      - For Loops
      - While Loops
      - Repeat, Next, Break

  - **Your First R Function**
    
      - Functions (part 1)
      - Functions (part 2)

  - **Scoping Rules**
    
      - Symbol Binding (lexical scoping)
      - Optimization Example (optional)

  - **Coding Standards**

  - **Dates and Times**

  - **Quiz**

  - **Programming Assignment**

  - **Key Takeaway Functions**

# Control Strcutures

## Introduction

Common structures in R:

  - `if, else`
  - `for`
  - `while`
  - `repeat`
  - `break`
  - `next`
  - `return`

## If-else

``` r
x <- 0

if(x > 3) {
        y <- 20
} else if (x > 0) {
        y <- 10
} else {
        y <- 0
}
```

## For loops

``` r
for(i in 1:10) {
        print(i)
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5
    ## [1] 6
    ## [1] 7
    ## [1] 8
    ## [1] 9
    ## [1] 10

``` r
x <- c("a", "b", "c", "d")
```

``` r
for(i in 1:4) {
        print(x[i])
}
```

    ## [1] "a"
    ## [1] "b"
    ## [1] "c"
    ## [1] "d"

``` r
for(i in seq_along(x)) { # creates an integer sequence that is equal to the length of the vector
        print(x[i])
}
```

    ## [1] "a"
    ## [1] "b"
    ## [1] "c"
    ## [1] "d"

``` r
for(letter in x) {
        print(letter)
}
```

    ## [1] "a"
    ## [1] "b"
    ## [1] "c"
    ## [1] "d"

``` r
for(i in 1:4) print(x[i])
```

    ## [1] "a"
    ## [1] "b"
    ## [1] "c"
    ## [1] "d"

``` r
x <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))) {
        for(j in seq_len(ncol(x))) {
                print(x[i, j])
        }
}
```

    ## [1] 1
    ## [1] 3
    ## [1] 5
    ## [1] 2
    ## [1] 4
    ## [1] 6

## While loop

Conditions are always evaluated from left to right

``` r
count <- 0
while(count >= 0 && count < 10) {
        print(count)
        count <- count + 1
}
```

    ## [1] 0
    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5
    ## [1] 6
    ## [1] 7
    ## [1] 8
    ## [1] 9

&, | = vectorized (returns multiple elements)  
&&, || = (always returns a single value)

## Repeat, Next, Break

#### Repeat

Initiates an *infinite loop*. The only way to exit a `repeat` loop is to
call `break`.

``` r
x0 <- 1
tol <- 1e-8

repeat {
        x1 <- rbinom(1, 1, 0.5)
        
        if(abs(x1 - x0) < tol) {
                break
        } else {
                x0 <- x1
        }
}
```

#### Next

Used to skip an iteration of a loop

``` r
for(i in 1:100) {
        if(i <= 20) {
                ## Skip the first 20 iterations
                next
        }
        ## Do something here
}
```

#### Break

# Your First R Function

Usually you are going to want to put your functions in a separate file,
a text file, separate from the command line.

``` r
add2 <- function(x, y) {
        x + y # the function returns whatever the last expression was
}
add2(3, 5)
```

    ## [1] 8

``` r
x <- 1:20
```

``` r
above10 <- function(x) {
        use <- x > 10 # returns a logical vector: TRUE, FALSE
        x[use]
}
above10(x)
```

    ##  [1] 11 12 13 14 15 16 17 18 19 20

``` r
above <- function(x, n = 10) { # 10 is the default value
        use <- x > n
        x[use]
}
above(x)
```

    ##  [1] 11 12 13 14 15 16 17 18 19 20

``` r
columnmean <- function(y, removeNA = TRUE) { # y is a data frame or a matrix
        nc <- ncol(y) # calculate the number of columns
        means <- numeric(nc) # an empty vector
        for(i in 1:nc) {
                means[i] <- mean(y[, i], na.rm = removeNA)
        }
        means
}
columnmean(airquality, FALSE)
```

    ## [1]        NA        NA  9.957516 77.882353  6.993464 15.803922

``` r
columnmean(airquality)
```

    ## [1]  42.129310 185.931507   9.957516  77.882353   6.993464  15.803922

## Functions (Part 1)

Functions are R objects of class “function”  
Functions in R are “first class objects”, which means that they can be
treated much like any other R object

Functions have `named arguments` which potentially have `default`
values.

  - `formal arguements` are the arguments included in the function
    “definition”
      - The `formals` function returns a list of all the `formal
        arguments` of a function.

When an argument is matched by name, it is “taken out” of the argument
list and the remaining, unnamed arguments are matched “in the order”
that they are listed in the function definition.

#### Argument Matching

The order of operations when given an argument is

1.  Check for *exact* match for a named argument
2.  Check for a *partial* match
3.  Check for a *positional* match

## Functions (Part 2)

``` r
f <- function(a, b = 1, c = 2, d = NULL) { # a, b, c, d are "formal" arguments
        
}
```

#### Lazy Evaluation

Arguments to functions are evaluated *only* as needed

``` r
f <- function(a, b) {
        a^2
}
f(2)
```

    ## [1] 4

``` r
f <- function(a, b) {
        print(a)
        print(b)
}
```

`f(45)`  
`[1] 45`  
`## Error: argument "b" is missing, with no default`

#### The “…” Argument

Any arguments that appear *after* … on the argument list must be named
explicitly and cannot be partially matched

``` r
args(paste)
```

    ## function (..., sep = " ", collapse = NULL, recycle0 = FALSE) 
    ## NULL

``` r
paste("a", "b", sep = ":")
```

    ## [1] "a:b"

``` r
paste("a", "b", se = ":")
```

    ## [1] "a b :"

# Scoping Rules

## Symbol Binding

The scoping rules determine how a value is associated with `a free
variable (symbol, name)` in a function

When R tries to bind a value to `a free variable (symbol, name)`, the
order is roughly:

1.  Search the `global environment (user's workspace)` for a symbol name
    matching the one requested.
2.  Search the `namespaces` of each of the packages on the search list

The search list can be found by `search()`

``` r
search()
```

    ## [1] ".GlobalEnv"        "package:stats"     "package:graphics" 
    ## [4] "package:grDevices" "package:utils"     "package:datasets" 
    ## [7] "package:methods"   "Autoloads"         "package:base"

The order of the packages on the search list matters\!

When a user loads a package with `library` the namespace of that package
gets put in the 2 of the search list (by default) and everything else
gets shifted down the list.

#### Lexical Scoping (R Scoping Rules)

Means that *the values of free variables are searched for in the
environment in which the function was defined.*  
What is an *environment*?

  - An *environment* is a collection of (symbol, value) pairs, i.e. `x`
    is a symbol and `3.14` might be its value
  - Every environment has a parent environment; it is possible for an
    environment to have multiple “children”
  - the only environment without a parent is the empty environment
  - A function + an environment = a *closure* or *function closure*

<!-- end list -->

``` r
f <- function(x, y) {
        x^2 + y / z # z is the *free* variable, a symbol(name)
}
```

The scoping rules of a language determine how values are assigned to
free variables.  
Free variables are not formal arguments and are not local variables
(assigned inside the function body)  
What value do we assign to z? scoping rule\!

Searching for the `value` for `a free variable`:

  - If the `value` of a symbol is not found in the environment in which
    a function was defined, then the search is continued in the `parent
    environment`
  - The `search` continues down the sequence of parent environments
    until we hit the `top-level environment`; this usually the global
    environment (workspace) or the namespace of a package
  - After the `top-level environment`, the search continues down the
    search list until we hit the `empty environment`. If a value for a
    given symbol cannot be found once the empty environment is arrived
    at, then an `error` is thrown.

Why does all this matter?

  - Typically, a function is defined in the *global environment*, so
    that the values of free variables are just found in the user’s
    workspace.
  - However, in R you can have functions defined *inside other
    functions*
  - In this case the environment in which a function is defined is the
    body of another function

<!-- end list -->

``` r
rm(list = ls())
```

``` r
make.power <- function(n) {
        pow <- function(x) {
                x^n
        }
        pow
        # "make.power(n)" function returns the function "pow" with "n" defined by its parameter
}
```

This function returns another function as its value.

``` r
cube <- make.power(3) # cube is the pow(x) function where n = 3
square <- make.power(2) # square is the pow(x) function where n = 2
```

``` r
cube(3)
```

    ## [1] 27

``` r
square(3)
```

    ## [1] 9

What is in a functions’ environment

``` r
ls(environment(make.power))
```

    ## [1] "cube"       "make.power" "square"

``` r
ls(environment(cube))
```

    ## [1] "n"   "pow"

``` r
get("n", environment(cube))
```

    ## [1] 3

``` r
get("pow", environment(cube))
```

    ## function(x) {
    ##                 x^n
    ##         }
    ## <environment: 0x7fb2b8cc78a0>

``` r
ls(environment(square))
```

    ## [1] "n"   "pow"

``` r
get("n", environment(square))
```

    ## [1] 2

``` r
get("pow", environment(square))
```

    ## function(x) {
    ##                 x^n
    ##         }
    ## <bytecode: 0x7fb2b8550940>
    ## <environment: 0x7fb2b8d1d630>

#### Lexical Scoping in R vs. Dynamic Scoping

``` r
y <- 10

f <- function(x) {
        y <- 2          # y is a free variable
        y^2 + g(x)      # g is also a free variable
}

g <- function(x) {
        x*y             # y is a free variable
                        # In R, the value of y is looked up in the environment 
                        # in which the function was defined (= global env.)
                        # so y = 10
                        # In Dynamic Scoping, the value of y is looked up in the environment
                        # in which the function was called (calling environment = Parent Frame in R)
                        # so y = 2
}
```

What is the value of

``` r
f(3)
```

    ## [1] 34

Alternatively,

``` r
y <- 10

f <- function(x) {
        y <- 2          # y is a free variable
        g <- function(x) {
                x*y
        }
        y^2 + g(x)      
}
```

``` r
f(3)
```

    ## [1] 10

#### Other Languages

Supporting lexical scoping:

  - Scheme
  - Perl
  - Python
  - Common Lisp

## Optimization Example (Optional)

# Coding Standards

1.  Always use text files / text editor
2.  Indent your code
3.  Limit the width of your code (80 columns?) `Cmd + A`, `Cmd + I`  
    `RStudio -> Preferences -> Code` (space indent: 8, column margin:
    80)  
4.  Limit the length of individual functions

# Date and Times

  - Dates are represented by the `Date` class
  - Times are represented by the `POSIXct` or the `POSIXlt` class
  - Dates are stored internally as the number of days since `1970-01-01`
  - Times are stored internally as the number of seconds since
    `1970-01-01`

Generic functions that work on dates and times:

  - `weekdays`
  - `months`
  - `quarters`

Dates are represented by the `Date` class and can be coerced from a
“character string” using the `as.Date()` function

``` r
x <- as.Date("1970-01-01")
x
```

    ## [1] "1970-01-01"

``` r
unclass(x)
```

    ## [1] 0

``` r
unclass(as.Date("1970-01-02"))
```

    ## [1] 1

Times can be coerced from a “character string” using the `as.POSIXlt` or
`as.POSIXct` function

``` r
x <- Sys.time() # already in *POSIXct* format
x
```

    ## [1] "2020-12-08 22:16:44 CST"

``` r
p <- as.POSIXct(x) # atomic vector (useful for a data frame)
p
```

    ## [1] "2020-12-08 22:16:44 CST"

``` r
unclass(p)
```

    ## [1] 1607487405

``` r
p <- as.POSIXlt(x) # list
p
```

    ## [1] "2020-12-08 22:16:44 CST"

``` r
unclass(p)
```

    ## $sec
    ## [1] 44.83854
    ## 
    ## $min
    ## [1] 16
    ## 
    ## $hour
    ## [1] 22
    ## 
    ## $mday
    ## [1] 8
    ## 
    ## $mon
    ## [1] 11
    ## 
    ## $year
    ## [1] 120
    ## 
    ## $wday
    ## [1] 2
    ## 
    ## $yday
    ## [1] 342
    ## 
    ## $isdst
    ## [1] 0
    ## 
    ## $zone
    ## [1] "CST"
    ## 
    ## $gmtoff
    ## [1] -21600
    ## 
    ## attr(,"tzone")
    ## [1] ""    "CST" "CDT"

``` r
names(unclass(p))
```

    ##  [1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"   "yday"  
    ##  [9] "isdst"  "zone"   "gmtoff"

``` r
p$sec
```

    ## [1] 44.83854

The`strptime` function in case your dates are written in a different
format

``` r
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
```

    ## [1] "2012-01-10 10:40:00 CST" "2011-12-09 09:10:00 CST"

``` r
# ?strptime
```

## Operations on Dates and Times

``` r
x <- as.Date("2012-01-01")
y <- as.Date("2011-01-09 01:00:00")

x-y
```

    ## Time difference of 357 days

# Week 2 Quiz

## Question 1

**Suppose I define the following function in R**

``` r
cube <- function(x, n) {
        x^3
}
```

**What is the result of running**

``` r
cube(3)
```

    ## [1] 27

## Question 2

**The following code will produce a warning in R**  
`x <- 1:10`  
`if(x > 5) {`  
`x <- 0`  
`}`

(Answer): `x` is a vector of length 10 and `if` can only test a single
logical statement.

## Question 3

**Consider the following function**

``` r
f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}
```

**If I then run in R, what value is returned?**

``` r
z <- 10
f(3)
```

    ## [1] 10

## Question 4

**Consider the following expression:**

``` r
x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}
```

**What is the value of `y` after evaluating this expression?**

``` r
y
```

    ## [1] 10

## Question 5

**Consider the following R function**

``` r
h <- function(x, y = NULL, d = 2L) {
        z <- cbind(x, d)
        if(!is.null(y)) {
                z <- z + y
        }
        else {
                z <- z + f
        }
        
        g <- x + y / z
        if(d == 3L) {
                return(g)
        }
        
        g <- g + 10
        g
} 
```

**which symbol in the above function is a free variable?**  
(Answer): f

## Question 6

**What is an environment in R?**  
(Answer): a collection of symbol/value pairs

## Question 7

**The R language uses what type of scoping rule for resolving free
variables?**  
(Answer): lexical scoping

## Question 8

**How are free variables in R functions resolved?**  
(Answer): The values of free variables are searched for in the
environment in which the function was defined

## Question 9

**What is one of the consequences of the scoping rules used in R?**  
(Answer): All objects must be stored in memory

## Question 10

**In R, what is the parent frame?**  
(Answer): It is the environment in which a function was called

# Programming Assignment

Get working directory

``` r
getwd()
```

    ## [1] "/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project/1_class_notes"

Set a new working directory

``` r
setwd("/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project/data")
```

## Part 1

**Write a function named ‘pollutantmean’ that calculates the mean of a
pollutant (sulfate or nitrate) across a specified list of monitors. The
function ‘pollutantmean’ takes three arguments: ‘directory’,
‘pollutant’, and ‘id’. Given a vector monitor ID numbers,
‘pollutantmean’ reads that monitors’ particulate matter data from the
directory specified in the ‘directory’ argument and returns the mean of
the pollutant across all of the monitors, ignoring any missing values
coded as NA.**

``` r
pollutantmean <- function(directory, pollutant, id = 1:332) {
        # Setting working directory
        setwd(paste("/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project/data", directory, sep = "/"))
        
        # Reading files from the given id range
        df <- data.frame()
        
        for(i in id) {
                if(i < 10) {
                        x <- data.frame(read.csv(paste("00", i, ".csv", sep = "")))
                        df <- rbind(df, x)
                }
                else if(i < 100) {
                        x <- data.frame(read.csv(paste("0", i, ".csv", sep = "")))
                        df <- rbind(df, x)
                }
                else {
                        x <- data.frame(read.csv(paste(i, ".csv", sep = "")))
                        df <- rbind(df, x)
                }
        }
        
        # Which pollutant? sulfate or nitrate?
        mean(df[, pollutant], na.rm = TRUE)
}
```

``` r
# Saving the function (object) to a file
dump("pollutantmean", file = "pollutantmean.R")
```

``` r
print(R.version.string)
```

    ## [1] "R version 4.0.2 (2020-06-22)"

``` r
rm(list = ls())
source("pollutantmean.R")
```

``` r
pollutantmean("specdata", "sulfate", 1:10)
```

    ## [1] 4.064128

``` r
pollutantmean("specdata", "nitrate", 70:72)
```

    ## [1] 1.706047

``` r
pollutantmean("specdata", "nitrate", 23)
```

    ## [1] 1.280833

## Part 2

**Write a function that reads a directory full of files and reports the
number of completely observed cases in each data file. The function
should return a data frame where the first column is the name of the
file and the second column is the number of complete cases.**

``` r
complete <- function(directory, id = 1:332) {
        # Setting working directory
        setwd(paste("/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project/data", directory, sep = "/"))
        
        # Reading files from the given id range
        df <- data.frame()
        
        for(i in id) {
                if(i < 10) {
                        x <- data.frame(read.csv(paste("00", i, ".csv", sep = "")))
                        s <- sum(complete.cases(x))
                        df <- rbind(df, c(i, s))
                }
                else if(i < 100) {
                        x <- data.frame(read.csv(paste("0", i, ".csv", sep = "")))
                        s <- sum(complete.cases(x))
                        df <- rbind(df, c(i, s))
                }
                else {
                        x <- data.frame(read.csv(paste(i, ".csv", sep = "")))
                        s <- sum(complete.cases(x))
                        df <- rbind(df, c(i, s))
                }
        }
        
        names(df) <- c("id", "nobs")
        
        # Return the dataframe
        df
}
```

``` r
# Saving the function (object) to a file
dump("complete", file = "complete.R")
```

``` r
rm(list = ls())
source("complete.R")
complete("specdata", 1)
```

    ##   id nobs
    ## 1  1  117

``` r
complete("specdata", c(2, 4, 8, 10, 12))
```

    ##   id nobs
    ## 1  2 1041
    ## 2  4  474
    ## 3  8  192
    ## 4 10  148
    ## 5 12   96

``` r
complete("specdata", 30:25)
```

    ##   id nobs
    ## 1 30  932
    ## 2 29  711
    ## 3 28  475
    ## 4 27  338
    ## 5 26  586
    ## 6 25  463

``` r
complete("specdata", 3)
```

    ##   id nobs
    ## 1  3  243

## Part 3

**Write a function that takes a directory of data files and a threshold
for complete cases and calculates the correlation between sulfate and
nitrate for monitor locations where the number of completely observed
cases (on all variables) is greater than the threshold. The function
should return a vector of correlations for the monitors that meet the
threshold requirement. If no monitors meet the threshold requirement,
then the function should return a numeric vector of length 0.**

``` r
corr <- function(directory, threshold = 0) {
        # Setting working directory
        setwd(paste("/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project/data", directory, sep = "/"))
        
        # Reading files from the given id range
        v <- c()
        
        for(i in 1:332) {
                if(i < 10) {
                        x <- data.frame(read.csv(paste("00", i, ".csv", sep = "")))
                        s <- sum(complete.cases(x))
                                
                        if(s > threshold) {
                                good <- complete.cases(x)
                                c <- cor(x[good, ][, "sulfate"], x[good, ][, "nitrate"])
                                v <- append(v, c)
                        }
                }
                else if(i < 100) {
                        x <- data.frame(read.csv(paste("0", i, ".csv", sep = "")))
                        s <- sum(complete.cases(x))
                        
                        if(s > threshold) {
                                good <- complete.cases(x)
                                c <- cor(x[good, ][, "sulfate"], x[good, ][, "nitrate"])
                                v <- append(v, c)
                        }
                }
                else {
                        x <- data.frame(read.csv(paste(i, ".csv", sep = "")))
                        s <- sum(complete.cases(x))
                        
                        if(s > threshold) {
                                good <- complete.cases(x)
                                c <- cor(x[good, ][, "sulfate"], x[good, ][, "nitrate"])
                                v <- append(v, c)
                        }
                }
        }

        # Return a numeric vector of correlations
        v
}
```

``` r
# Saving the function (object) to a file
dump("corr", file = "corr.R")
```

``` r
rm(list = ls())
source("corr.R")

cr <- corr("specdata", 150)
head(cr)
```

    ## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814

``` r
summary(cr)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313

``` r
cr <- corr("specdata", 400)
head(cr)
```

    ## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860

``` r
summary(cr)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313

``` r
cr <- corr("specdata", 5000)
summary(cr)
```

    ## Length  Class   Mode 
    ##      0   NULL   NULL

``` r
length(cr)
```

    ## [1] 0

``` r
cr <- corr("specdata")
summary(cr)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000

``` r
length(cr)
```

    ## [1] 323

## Programming Assignment Quiz

``` r
rm(list = ls())
source("pollutantmean.R")
source("complete.R")
source("corr.R")
```

#### Question 1

**What value is returned by the following call to pollutantmean()?**  
**You should round your output to 3 digits.**

``` r
pollutantmean("specdata", "sulfate", 1:10)
```

    ## [1] 4.064128

#### Question 2

**What value is returned by the following call to pollutantmean()?**  
**You should round your output to 3 digits.**

``` r
pollutantmean("specdata", "nitrate", 70:72)
```

    ## [1] 1.706047

#### Question 3

**What value is returned by the following call to pollutantmean()?**  
**You should round your output to 3 digits.**

``` r
pollutantmean("specdata", "sulfate", 34)
```

    ## [1] 1.477143

#### Question 4

**What value is returned by the following call to pollutantmean()?**  
**You should round your output to 3 digits.**

``` r
pollutantmean("specdata", "nitrate")
```

    ## [1] 1.702932

#### Question 5

**What value is printed at the end of the following code?**

``` r
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
```

    ## [1] 228 148 124 165 104 460 232

#### Question 6

**What value is printed at the end of the following code?**

``` r
cc <- complete("specdata", 54)
print(cc$nobs)
```

    ## [1] 219

#### Question 7

**What value is printed at the end of the following code?**

``` r
RNGversion("3.5.1")
```

    ## Warning in RNGkind("Mersenne-Twister", "Inversion", "Rounding"): non-uniform
    ## 'Rounding' sampler used

``` r
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
```

    ##  [1] 711 135  74 445 178  73  49   0 687 237

#### Question 8

**What value is printed at the end of the following code?**

``` r
cr <- corr("specdata")
cr <- sort(cr)
RNGversion("3.5.1")
```

    ## Warning in RNGkind("Mersenne-Twister", "Inversion", "Rounding"): non-uniform
    ## 'Rounding' sampler used

``` r
set.seed(868)
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
```

    ## [1]  0.2688  0.1127 -0.0085  0.4586  0.0447

#### Question 9

**What value is printed at the end of the following code?**

``` r
cr <- corr("specdata", 129)
cr <- sort(cr)
n <- length(cr)
RNGversion("3.5.1")
```

    ## Warning in RNGkind("Mersenne-Twister", "Inversion", "Rounding"): non-uniform
    ## 'Rounding' sampler used

``` r
set.seed(197)
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
```

    ## [1] 243.0000   0.2540   0.0504  -0.1462  -0.1680   0.5969

#### Question 10

**What value is printed at the end of the following code?**

``` r
cr <- corr("specdata", 2000)
n <- length(cr)
cr <- corr("specdata", 1000)
cr <- sort(cr)
print(c(n, round(cr, 4)))
```

    ## [1]  0.0000 -0.0190  0.0419  0.1901

# Key Takeaway Functions

  - **Control Structures**
      - For Loops
          - `seq_along(x)`  
          - `seq_len(x)`
      - While Loops
          - `&`, `|` = vectorized (returns multiple elements)  
          - `&&`, `||` = (always returns a single value)
      - Functions
          - `rnorm(n)` = A random, normal distribution with size = n,
            mean = 0, sd = 1 as a default
  - **Coding Standards**
      - Auto indent = `Cmd + I`
  - **Date and Times**
      - `as.Date("1970-01-01")`  
      - `Sys.time()`
  - **Programming Assignment**
      - `append(vector, element, index)`
