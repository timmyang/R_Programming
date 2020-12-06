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

  - **Key Takeaway Functions**

# Control Strcutures

#### Introduction

Common structures in R:

  - `if, else`
  - `for`
  - `while`
  - `repeat`
  - `break`
  - `next`
  - `return`

#### If-else

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

#### For loops

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

#### While loop

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

#### Repeat, Next, Break

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

#### Functions (Part 1)

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

**Argument Matching:**  
The order of operations when given an argument is

1.  Check for *exact* match for a named argument
2.  Check for a *partial* match
3.  Check for a *positional* match

#### Functions (Part 2)

``` r
f <- function(a, b = 1, c = 2, d = NULL) { # a, b, c, d are "formal" arguments
        
}
```

**Lazy Evaluation:**  
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

**The “…” Argument:**  
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

#### Symbol Binding

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

**Lexical Scoping (R Scoping Rules):**  
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
    ## <environment: 0x7ffd0f52c888>

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
    ## <bytecode: 0x7ffd0f752338>
    ## <environment: 0x7ffd0f63b670>

**Lexical Scoping in R vs. Dynamic Scoping:**

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

**Other Languages:**  
Support lexical scoping

  - Scheme
  - Perl
  - Python
  - Common Lisp

#### Optimization Example (Optional)

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

    ## [1] "2020-12-05 19:36:49 CST"

``` r
p <- as.POSIXct(x) # atomic vector (useful for a data frame)
p
```

    ## [1] "2020-12-05 19:36:49 CST"

``` r
unclass(p)
```

    ## [1] 1607218609

``` r
p <- as.POSIXlt(x) # list
p
```

    ## [1] "2020-12-05 19:36:49 CST"

``` r
unclass(p)
```

    ## $sec
    ## [1] 49.13732
    ## 
    ## $min
    ## [1] 36
    ## 
    ## $hour
    ## [1] 19
    ## 
    ## $mday
    ## [1] 5
    ## 
    ## $mon
    ## [1] 11
    ## 
    ## $year
    ## [1] 120
    ## 
    ## $wday
    ## [1] 6
    ## 
    ## $yday
    ## [1] 339
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

    ## [1] 49.13732

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

**Operations on Dates and Times:**

``` r
x <- as.Date("2012-01-01")
y <- as.Date("2011-01-09 01:00:00")

x-y
```

    ## Time difference of 357 days

# Week 2 Quiz

## Question 1

## Question 2

## Question 3

## Question 4

## Question 5

## Question 6

## Question 7

## Question 8

## Question 9

## Question 10

# Key Takeaway Functions

  - **For Loops**
      - `seq_along(x)`  
      - `seq_len(x)`
  - **While Loops**
      - `&`, `|` = vectorized (returns multiple elements)  
      - `&&`, `||` = (always returns a single value)
  - **Functions**
      - `rnorm(n)` = A random, normal distribution with size = n, mean =
        0, sd = 1 as a default
  - **Coding Standards**
      - Auto indent = `Cmd + I`
  - **Date and Times**
      - `as.Date("1970-01-01")`  
      - `Sys.time()`
