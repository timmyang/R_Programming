Week 3
================

# Table of Contents

  - **Loop Functions**
    
      - lapply
      - sapply
      - apply
      - mapply
      - tapply
      - split

  - **Debugging Tools**
    
      - Diagnosing the Problem
      - Basic Tools
      - Using the Tools
      - Summary

  - **Quiz**

  - **Programming Assignment**

  - **Key Takeaway Functions**

# Loop Functions

  - `lapply`: Loop over a “list” and evaluate a function on each element
  - `sapply`: Same as `lapply` but try to “simplify” the result
  - `apply`: Apply a function over the “margins” of an “array”
  - `mapply`: “Multivariate” version of `lapply`
  - `tapply`: Apply a function over “subsets” of a “vector”

An auxiliary function `split` is also useful, particularly in
conjunction with `lapply`. Splits objects into sub-pieces.

## lapply

Takes three arguments

1.  a list `X` (if X is not a list, it will be coerced to a list using
    `as.list`)
2.  a function `FUN`
3.  `...`

<!-- end list -->

``` r
lapply
```

    ## function (X, FUN, ...) 
    ## {
    ##     FUN <- match.fun(FUN)
    ##     if (!is.vector(X) || is.object(X)) 
    ##         X <- as.list(X)
    ##     .Internal(lapply(X, FUN))
    ## }
    ## <bytecode: 0x7fbc89078dc0>
    ## <environment: namespace:base>

``` r
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)
```

    ## $a
    ## [1] 3
    ## 
    ## $b
    ## [1] -0.2112814

`lapply` always returns a list.

``` r
x <- 1:4
lapply(x, runif, min = 0, max = 10)
```

    ## [[1]]
    ## [1] 3.876261
    ## 
    ## [[2]]
    ## [1] 5.500947 5.648072
    ## 
    ## [[3]]
    ## [1] 8.468244 9.187430 2.594503
    ## 
    ## [[4]]
    ## [1] 0.4497064 7.0990998 0.1360773 7.4691844

`lapply` makes heavy use of *anonymous* functions, functions that have
no names.

``` r
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
```

    ## $a
    ##      [,1] [,2]
    ## [1,]    1    3
    ## [2,]    2    4
    ## 
    ## $b
    ##      [,1] [,2]
    ## [1,]    1    4
    ## [2,]    2    5
    ## [3,]    3    6

An anonymous function for extracting the first column of each matrix.

``` r
lapply(x, function(elt) {elt[, 1]})
```

    ## $a
    ## [1] 1 2
    ## 
    ## $b
    ## [1] 1 2 3

## sapply

`sapply` will try to simplify the result of `lapply` if possible.

  - If the result is a list where every element is “length 1”, then “a
    vector” is returned
  - If the result is a list where every element is a vector of “the same
    length” (\> 1), “a matrix” is returned
  - If it can’t figure things out, “a list” is returned

<!-- end list -->

``` r
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
```

    ## $a
    ## [1] 2.5
    ## 
    ## $b
    ## [1] -0.06367446
    ## 
    ## $c
    ## [1] 1.173623
    ## 
    ## $d
    ## [1] 4.9162

``` r
sapply(x, mean)
```

    ##           a           b           c           d 
    ##  2.50000000 -0.06367446  1.17362277  4.91620023

## apply

`apply` is used to evaluate a function (often an anonymous one) over the
margins of an **array**.

  - It is most often used to apply a function to the rows or columns of
    a matrix
  - It can be used with general arrays, e.g. taking the average of an
    array of matrices
  - It is not really faster than writing a loop, but it works in one
    line\!

<!-- end list -->

``` r
str(apply)
```

    ## function (X, MARGIN, FUN, ...)

  - `X` is an **array**
  - `MARGIN` is an integer vector indicating which margins should be
    “retained”.
  - `FUN` is a function to be applied
  - `...` is fr other arguments to be passed to `FUN`

<!-- end list -->

``` r
x <- matrix(rnorm(200), 20, 10) # dimension 1 has 20 rows, and dimension 2 has 10 columns
apply(x, 2, mean) 
```

    ##  [1] -0.03201049  0.28656504 -0.08115870 -0.10233833  0.03446084 -0.11194814
    ##  [7] -0.34715695  0.21515810  0.00806843 -0.28560138

``` r
apply(x, 1, sum)
```

    ##  [1] -6.01228871 -6.67045801 -2.29812919  2.24001141  8.09801209 -1.09587625
    ##  [7]  3.77247392  2.16325363 -5.63776931  4.41514082  1.82930579 -0.74184215
    ## [13] -2.03372969  0.67700240  2.78503116 -5.18984918 -5.78359804  0.02696726
    ## [19]  2.13654975 -0.99943901

  - `rowSums` = `apply(x, 1, sum)`
  - `rowMeans` = `apply(x, 1, mean)`
  - `colSums` = `apply(x, 2, sum)`
  - `colMeans` = `apply(x, 2, mean)`

<!-- end list -->

``` r
x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))
```

    ##           [,1]       [,2]       [,3]       [,4]      [,5]       [,6]       [,7]
    ## 25% -0.4747854 -0.6568244 -1.5359025 -0.8524750 -1.042628 -0.9421877 -0.2549030
    ## 75%  0.6564881  1.0451771  0.3460208  0.5062414  1.168782  0.6851058  0.2315476
    ##           [,8]       [,9]      [,10]     [,11]      [,12]      [,13]      [,14]
    ## 25% -0.5368697 -0.4573066 -0.3634025 0.5414673 -0.6589600 -0.6696651 -0.8143876
    ## 75%  0.7263302  0.7475169  1.0282740 1.1951466  0.2895273  0.4253979  0.4564127
    ##          [,15]     [,16]      [,17]      [,18]       [,19]      [,20]
    ## 25% -0.4128525 0.4284315 0.03510351 -0.1066863 -0.68840241 -0.7931782
    ## 75%  0.5019731 0.9564100 0.96197848  1.5766627  0.02330483 -0.3691177

``` r
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean) # collapse (average over) the 3rd dimension
```

    ##             [,1]        [,2]
    ## [1,] -0.03649196 -0.04033626
    ## [2,] -0.23371658 -0.17452898

``` r
apply(a, 1, mean)
```

    ## [1] -0.03841411 -0.20412278

``` r
apply(a, 2, mean)
```

    ## [1] -0.1351043 -0.1074326

## mapply

`mapply` is a multivariate apply of sorts which applies a function in
parallel over a set of arguments.  
`mapply` can take multiple list arguments and then apply a function to
the elements of thos of the multipe lists in parallel.

``` r
str(mapply)
```

    ## function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)

  - `FUN` is a function to apply (the number of arguments of `FUN` \>=
    the number of lists to be passed)
  - `...` contains arguments to apply over
  - `MoreArgs` is a list of other arguments to `FUN`.
  - `Simplify` indicates whether the result should be simplified

The following is tedious to type

``` r
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
```

    ## [[1]]
    ## [1] 1 1 1 1
    ## 
    ## [[2]]
    ## [1] 2 2 2
    ## 
    ## [[3]]
    ## [1] 3 3
    ## 
    ## [[4]]
    ## [1] 4

Instead we can do

``` r
mapply(rep, 1:4, 4:1)
```

    ## [[1]]
    ## [1] 1 1 1 1
    ## 
    ## [[2]]
    ## [1] 2 2 2
    ## 
    ## [[3]]
    ## [1] 3 3
    ## 
    ## [[4]]
    ## [1] 4

## tapply

`tapply` is used to apply a function over subsets of a vector.

``` r
str(tapply)
```

    ## function (X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE)

  - `X` is a vector
  - `INDEX` is a factor or a list of factors (or else they are coerced
    to factors) “same length as `X`”
  - `FUN` is a function to be applied
  - `...` contains other arguments to be passed `FUN`
  - `simplify`, should we simplify the result?

<!-- end list -->

``` r
x <- c(rnorm(10), runif(10), rnorm(10, 1))
x
```

    ##  [1] -0.608371400  0.444260723  0.984910614 -0.226922724 -0.176855070
    ##  [6] -0.201202367  0.159708334  1.467572598  0.256463990 -0.005903624
    ## [11]  0.259801110  0.450480126  0.501383709  0.969677295  0.535401893
    ## [16]  0.838988536  0.902251336  0.683593823  0.909914766  0.049170682
    ## [21] -0.340406834  2.302540170 -1.855536365 -0.267009687 -0.160924960
    ## [26]  1.872340943  0.640304136  0.661128946  0.803280831  0.534116279

``` r
f <- gl(3, 10) # generate a factor with 3 levels, each for 10 times
f
```

    ##  [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
    ## Levels: 1 2 3

``` r
tapply(x, f, mean)
```

    ##         1         2         3 
    ## 0.2093661 0.6100663 0.4189833

``` r
tapply(x, f, mean, simplify = FALSE)
```

    ## $`1`
    ## [1] 0.2093661
    ## 
    ## $`2`
    ## [1] 0.6100663
    ## 
    ## $`3`
    ## [1] 0.4189833

## split

Always returns a list.  
`tapply` without summary statistics  
`split` takes a vector or other objects and splits it into groups
determined by a factor or a list of factors.

``` r
str(split)
```

    ## function (x, f, drop = FALSE, ...)

  - `x` is a vector (or list) or data frame
  - `f` is a factor (or coerced to one) or a list of factors
  - `drop` indicates whether empty factors levels should be dropped

<!-- end list -->

``` r
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)
```

    ## $`1`
    ##  [1]  0.82142671 -0.14663289 -0.03815080  0.92025100 -0.66217413  0.08023819
    ##  [7] -1.25731642 -1.05424173  1.45351358  0.58874273
    ## 
    ## $`2`
    ##  [1] 0.05938535 0.79895233 0.51054188 0.45783196 0.55532503 0.13266977
    ##  [7] 0.31701871 0.78157077 0.34523134 0.27725436
    ## 
    ## $`3`
    ##  [1] 1.7788330 1.5326895 0.3253184 2.5793516 1.4254945 1.9118063 1.4361091
    ##  [8] 0.8997960 0.6664014 2.2833346

``` r
lapply(split(x, f), mean) # = tapply(x, f, mean)
```

    ## $`1`
    ## [1] 0.07056562
    ## 
    ## $`2`
    ## [1] 0.4235781
    ## 
    ## $`3`
    ## [1] 1.483913

``` r
library(datasets)
head(airquality)
```

    ##   Ozone Solar.R Wind Temp Month Day
    ## 1    41     190  7.4   67     5   1
    ## 2    36     118  8.0   72     5   2
    ## 3    12     149 12.6   74     5   3
    ## 4    18     313 11.5   62     5   4
    ## 5    NA      NA 14.3   56     5   5
    ## 6    28      NA 14.9   66     5   6

``` r
# Split the data frame to "monthly" pieces
s <- split(airquality, airquality$Month)
airquality$Month
```

    ##   [1] 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 6 6 6 6 6 6
    ##  [38] 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 7 7 7 7 7 7 7 7 7 7 7 7 7
    ##  [75] 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8
    ## [112] 8 8 8 8 8 8 8 8 8 8 8 8 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9
    ## [149] 9 9 9 9 9

``` r
lapply(s, function(x) {colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE)})
```

    ## $`5`
    ##     Ozone   Solar.R      Wind 
    ##  23.61538 181.29630  11.62258 
    ## 
    ## $`6`
    ##     Ozone   Solar.R      Wind 
    ##  29.44444 190.16667  10.26667 
    ## 
    ## $`7`
    ##      Ozone    Solar.R       Wind 
    ##  59.115385 216.483871   8.941935 
    ## 
    ## $`8`
    ##      Ozone    Solar.R       Wind 
    ##  59.961538 171.857143   8.793548 
    ## 
    ## $`9`
    ##     Ozone   Solar.R      Wind 
    ##  31.44828 167.43333  10.18000

``` r
sapply(s, function(x) {colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE)})
```

    ##                 5         6          7          8         9
    ## Ozone    23.61538  29.44444  59.115385  59.961538  31.44828
    ## Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
    ## Wind     11.62258  10.26667   8.941935   8.793548  10.18000

#### Splitting on More than One Level

``` r
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)

f1
```

    ##  [1] 1 1 1 1 1 2 2 2 2 2
    ## Levels: 1 2

``` r
f2
```

    ##  [1] 1 1 2 2 3 3 4 4 5 5
    ## Levels: 1 2 3 4 5

``` r
interaction(f1, f2)
```

    ##  [1] 1.1 1.1 1.2 1.2 1.3 2.3 2.4 2.4 2.5 2.5
    ## Levels: 1.1 2.1 1.2 2.2 1.3 2.3 1.4 2.4 1.5 2.5

Interactions can create empty levels.

``` r
str(split(x, list(f1, f2))) # drop = FALSE
```

    ## List of 10
    ##  $ 1.1: num [1:2] -1.922 -0.307
    ##  $ 2.1: num(0) 
    ##  $ 1.2: num [1:2] -1.84 -0.503
    ##  $ 2.2: num(0) 
    ##  $ 1.3: num -1.4
    ##  $ 2.3: num -1.13
    ##  $ 1.4: num(0) 
    ##  $ 2.4: num [1:2] 0.541 0.146
    ##  $ 1.5: num(0) 
    ##  $ 2.5: num [1:2] -0.749 2.243

# Debugging Tools

## Diagnosing the Problem

Indications that something’s not right

  - `message`: A generic notification/diagnostic message. Execution of
    the function continues
  - `warning`: Something wrong, but not fatal. Execution of the function
    continues
  - `error`: A fatal problem has occurred. Execution stops
  - `condition`: Something unexpected can occur. Programmers can create
    their own conditions

#### Warning

``` r
log(-1)
```

    ## Warning in log(-1): NaNs produced

    ## [1] NaN

#### Error

``` r
printmessage <- function(x) {
        if(x > 0) {
                print("x is greater than zero")
        }
        else {
                print("x is less than or equal to zero")
        }
        invisible(x) # prevents auto printing
}

printmessage(1)
```

    ## [1] "x is greater than zero"

``` r
# printmessage(NA)
## Error in if (x > 0) { : missing value where TRUE/FALSE needed
```

Fix this problem

``` r
printmessage2 <- function(x) {
        if(is.na(x)) {
                print("x is a missing value!")
        }
        else if (x > 0) {
                print("x is greater than zero")
        }
        else {
                print("x is less than or equal to zero")
        }
        invisible(x)
}

x <- log(-1)
```

    ## Warning in log(-1): NaNs produced

``` r
printmessage2(x)
```

    ## [1] "x is a missing value!"

## Basic Tools

The primary tools for debugging functions in R are

  - `traceback`: prints out the “function call stack” after an error
    occurs; tells you how many function calls you are in and where the
    error occurred
  - `debug`: flags a function for “debug” mode
  - `browser`: suspends the execution of a function wherever it is
    called and puts the function in debug mode
  - `trace`: allows you to insert debugging code into a function in
    specific places
  - `recover`: “a error handler function”. allows you to modify the
    error behavior, to browse the function call stack

## Using the Tools

#### traceback

``` r
rm(list = ls())

# mean(x)
## Error in mean(x) : object 'x' not found

# traceback()
## 1: mean(x)

# lm(y ~ x)
## Error in eval(expr, envir, enclos) : object `y` not found

## traceback()
## 7: eval(expr, envir, enclos)         <- this is where the error occurred
## 6: eval(predvars, data, env)
## 5: model.frame.default(formula = y ~ x, drop.unused.levels = TRUE)
## 4: model.frame(formula = y ~ x, drop.unused.levels = TRUE)
## 3: eval(expr, envir, enclose)
## 2: eval(mf, parent.frame())
## 1: lm(y ~ x)
```

#### debug

``` r
# debug(lm)
# lm(y ~x)
## debugging in: lm(y ~ x)
## debug: {
##      ret.x <- x
##      ret.y <- y
##      cl <- match.call()
##      ...
##      if (!qr)
##              z$qr <- NULL
##      z
## }
## Browse[2]>                   <- This is the prompt. Now you are in the browser
```

``` r
# Browse[2]> n                   <- 'n' stands for 'next'
## debug: ret.x <- x
# Browse[2]> n
## debug: ret.y <- y
# Browse[2]> n
## debug: cl <- match.call()
# Browse[2]> n
## debug: mf <- match.call(expand.dots = FALSE)
# Browse[2]> n
## debug: m <- match(c("formula", "data", "subset", "weights", "na.action", 
##      "offset"), names(mf), 0L)
```

#### recover

``` r
options(error = recover)
# read.csv("nosuchfile")
## Error in file(file, "rt") : cannot open the connection
## In addition: Warning message:
## In file(file, "rt") :
##      cannot open file 'nosuchfile': No such file or directory
##
## Enter a frame number, or 0 to exit
##
## 1: read.csv("nosuchfile")
## 2: read.table(file = file, header = header, sep = sep, quote = quote, dec =
## 3: file(file, "rt")          <- this is where the error occurred
##
## Selection:
```

## Summary

  - There are “three” main indications of a problem/condition: `message,
    warning, error`
      - only an `error` is fatal
  - When analyzing a function with a problem, make sure you can
    “reproduce” the problem, clearly state your “expectations” and how
    the output “differs” from your expectation
  - Interactive debugging tools `traceback, debug, browser, trace,` and
    `recover` can be used to find problematic code in functions
  - Debugging tools are not a substitute for thinking\!

# Week 3 Quiz

## Question 1

**Take a look at the ‘iris’ dataset that comes with R.**  
\*The data can be loaded with the code:\*\*

``` r
library(datasets)
data(iris)
```

**A description of the dataset can be found by running**

``` r
?iris
head(iris)
```

    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1          5.1         3.5          1.4         0.2  setosa
    ## 2          4.9         3.0          1.4         0.2  setosa
    ## 3          4.7         3.2          1.3         0.2  setosa
    ## 4          4.6         3.1          1.5         0.2  setosa
    ## 5          5.0         3.6          1.4         0.2  setosa
    ## 6          5.4         3.9          1.7         0.4  setosa

**There will be an obejct called ‘iris’ in your workspace. In this
dataset, what is the mean of ‘Sepal.Length’ for the species
*virginica*?**

**Please round your answer to the nearest whole number.**

``` r
x <- iris[iris$Species == "virginica", ]
mean(x[, "Sepal.Length"])
```

    ## [1] 6.588

``` r
y <- tapply(iris$Sepal.Length, iris$Species, mean)
y
```

    ##     setosa versicolor  virginica 
    ##      5.006      5.936      6.588

``` r
mean(y["virginica"])
```

    ## [1] 6.588

(Answer): 7

## Question 2

**Continuing with the ‘iris’ dataset from the previous Question, what R
code returns a vector of the means of the variables ‘Sepal.Length’,
‘Sepal.Width’, and ‘Petal.Width’?**

``` r
head(iris)
```

    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1          5.1         3.5          1.4         0.2  setosa
    ## 2          4.9         3.0          1.4         0.2  setosa
    ## 3          4.7         3.2          1.3         0.2  setosa
    ## 4          4.6         3.1          1.5         0.2  setosa
    ## 5          5.0         3.6          1.4         0.2  setosa
    ## 6          5.4         3.9          1.7         0.4  setosa

``` r
apply(iris[, 1:4], 2, mean)
```

    ## Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
    ##     5.843333     3.057333     3.758000     1.199333

## Question 3

**Load the ‘mtcars’ dataset in R with the following code**

``` r
library(datasets)
data(mtcars)
```

**There will be an object names ‘mtcars’ in your workspace.**  
**You can find some information about the dataset by running**

``` r
?mtcars
head(mtcars)
```

    ##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
    ## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
    ## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
    ## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
    ## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
    ## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
    ## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

**How can one calculate the average miles per gallon (mpg) by number of
cylinders in the car (cyl)?**  
**Select all that apply.**

``` r
sapply(split(mtcars$mpg, mtcars$cyl), mean)
```

    ##        4        6        8 
    ## 26.66364 19.74286 15.10000

``` r
tapply(mtcars$mpg, mtcars$cyl, mean)
```

    ##        4        6        8 
    ## 26.66364 19.74286 15.10000

``` r
with(mtcars, tapply(mpg, cyl, mean))
```

    ##        4        6        8 
    ## 26.66364 19.74286 15.10000

## Question 4

**Continuing with the ‘mtcars’ dataset from the previous Question,**
**what is the absolute difference between the average horsepower of
4-cylinder cars and the average horsepower of 8-cylinder cars?**

**(Please round your final answer to the nearest whole number)**

``` r
t <- tapply(mtcars$hp, mtcars$cyl, mean, simplify = FALSE)
t
```

    ## $`4`
    ## [1] 82.63636
    ## 
    ## $`6`
    ## [1] 122.2857
    ## 
    ## $`8`
    ## [1] 209.2143

``` r
abs(t[["4"]] - t[["8"]])
```

    ## [1] 126.5779

(Answer): 127

## Question 5

**If you run**

``` r
debug(ls)
```

**What happens when you next call the ‘ls()’ function?**

``` r
# ls()
## debugging in: ls()
## debug: {
##     if (!missing(name)) {
##         pos <- tryCatch(name, error = function(e) e)
##         if (inherits(pos, "error")) {
##             name <- substitute(name)
##             if (!is.character(name)) 
##                 name <- deparse(name)
##             warning(gettextf("%s converted to character string", 
##                 sQuote(name)), domain = NA)
##             pos <- name
##         }
##     }
##     all.names <- .Internal(ls(envir, all.names, sorted))
##     if (!missing(pattern)) {
##         if ((ll <- length(grep("[", pattern, fixed = TRUE))) && 
##             ll != length(grep("]", pattern, fixed = TRUE))) {
##             if (pattern == "[") {
##                 pattern <- "\\["
##                 warning("replaced regular expression pattern '[' by  '\\\\['")
##             }
##             else if (length(grep("[^\\\\]\\[<-", pattern))) {
##                 pattern <- sub("\\[<-", "\\\\\\[<-", pattern)
##                 warning("replaced '[<-' by '\\\\[<-' in regular expression pattern")
##             }
##         }
##         grep(pattern, all.names, value = TRUE)
##     }
##     else all.names
## }
## Browse[2]> 
```

(Answer): Execution of ‘ls’ will suspend at the beginning of the
function and you will be in the browser

``` r
undebug(ls)
```

# Assignment 2

## Example: Caching the Mean of a Vector

In this example we introduce the `<<-` operator which can be used to
assign a value to an object in an environment that is different from the
current environment. Below are two functions that are used to create a
special object that stores a numeric vector and cache’s its mean.

The first function, `makeVector` creates a special “vector”, which is
really a list containing a function to

1.  set the value of the vector  
2.  get the value of the vector  
3.  set the value of the mean  
4.  get the value of the mean

<!-- end list -->

``` r
rm(list=ls())
```

``` r
makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}
```

``` r
a <- makeVector(c(1, 2, 3, 4))
a
```

    ## $set
    ## function(y) {
    ##                 x <<- y
    ##                 m <<- NULL
    ##         }
    ## <environment: 0x7fbc89611a38>
    ## 
    ## $get
    ## function() x
    ## <environment: 0x7fbc89611a38>
    ## 
    ## $setmean
    ## function(mean) m <<- mean
    ## <environment: 0x7fbc89611a38>
    ## 
    ## $getmean
    ## function() m
    ## <environment: 0x7fbc89611a38>

``` r
ls(environment(makeVector))
```

    ## [1] "a"          "makeVector"

``` r
a[["set"]]
```

    ## function(y) {
    ##                 x <<- y
    ##                 m <<- NULL
    ##         }
    ## <environment: 0x7fbc89611a38>

#### set

``` r
ls(environment(a[["set"]]))
```

    ## [1] "get"     "getmean" "m"       "set"     "setmean" "x"

``` r
get("x", environment(a[["set"]]))
```

    ## [1] 1 2 3 4

``` r
get("m", environment(a[["set"]]))
```

    ## NULL

#### get

``` r
ls(environment(a[["get"]]))
```

    ## [1] "get"     "getmean" "m"       "set"     "setmean" "x"

``` r
get("x", environment(a[["get"]]))
```

    ## [1] 1 2 3 4

``` r
get("m", environment(a[["get"]]))
```

    ## NULL

#### setmean

``` r
ls(environment(a[["setmean"]]))
```

    ## [1] "get"     "getmean" "m"       "set"     "setmean" "x"

``` r
get("x", environment(a[["setmean"]]))
```

    ## [1] 1 2 3 4

``` r
get("m", environment(a[["setmean"]]))
```

    ## NULL

#### getmean

``` r
ls(environment(a[["getmean"]]))
```

    ## [1] "get"     "getmean" "m"       "set"     "setmean" "x"

``` r
get("x", environment(a[["getmean"]]))
```

    ## [1] 1 2 3 4

``` r
get("m", environment(a[["getmean"]]))
```

    ## NULL

The following function calculates the mean of the special “vector”
created with the above function. However, it first checks to see if the
mean has already been calculated. If so, it gets the mean from the cache
and skips the computation. Otherwise, it calculates the mean of the data
and sets the value of the mean in the cache via the `setmean` function.

``` r
cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}
```

``` r
cachemean(a)
```

    ## [1] 2.5

``` r
ls(environment(a[["set"]]))
```

    ## [1] "get"     "getmean" "m"       "set"     "setmean" "x"

``` r
get("x", environment(a[["set"]]))
```

    ## [1] 1 2 3 4

``` r
get("m", environment(a[["set"]]))
```

    ## [1] 2.5

``` r
get("x", environment(a[["get"]]))
```

    ## [1] 1 2 3 4

``` r
get("m", environment(a[["get"]]))
```

    ## [1] 2.5

``` r
get("x", environment(a[["setmean"]]))
```

    ## [1] 1 2 3 4

``` r
get("m", environment(a[["setmean"]]))
```

    ## [1] 2.5

``` r
get("x", environment(a[["getmean"]]))
```

    ## [1] 1 2 3 4

``` r
get("m", environment(a[["getmean"]]))
```

    ## [1] 2.5

``` r
cachemean(a)
```

    ## getting cached data

    ## [1] 2.5

## Assignment: Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than compute it
repeatedly (there are also alternatives to matrix inversion that we will
not discuss here). Your assignment is to write a pair of functions that
cache the inverse of a matrix.

Write the following functions:

1.  `makeCacheMatrix`: This function creates a special “matrix” object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    “matrix” returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then the
    `cachesolve` should retrieve the inverse from the cache.

Computing the inverse of a square matrix can be done with the `solve`
function in R. For example, if X is a square invertible matrix, then
`solve(X)` returns its inverse.

For this assignment, assume that the matrix supplied is always
invertible.

In order to complete this assignment, you must do the following:

1.  Fork the GitHub repository containing the stub R files at
    <https://github.com/rdpeng/ProgrammingAssignment2> to create a copy
    under your own account.
2.  Clone your forked GitHub repository to your computer so that you can
    edit the files locally on your own machine.
3.  Edit the R file contained in the git repository and place your
    solution in that file (please do not rename the file).
4.  Commit your completed R file into YOUR git repository and push your
    git branch to the GitHub repository under your account.
5.  Submit to Coursera the URL to your GitHub repository that contains
    the completed R code for the assignment.

In addition to submitting the URL for your GitHub repository, you will
need to submit the 40 character SHA-1 hash (as string of numbers from
0-9 and letters from a-f) that identifies the repository commit that
contains the version of the files you want to submit. You can do this in
GitHub by doing the following

1.  Going to your GitHub repository web page for this assignment
2.  Click on the “?? commits” link where ?? is the number of commits you
    have in the repository. For example, if you made a total of 10
    commits to this repository, the link should say “10 commits”.
3.  You will see a list of commits that you have made to this
    repository. The most recent commit is at the very top. If this
    represents the version of the files you want to submit, then just
    click the “copy to clipboard” button on the right hand side that
    should appear when you hover over the SHA-1 hash. Paste this SHA-1
    hash into the course web site when you submit your assignment. If
    you don’t want to use the most recent commit, then go down and find
    the commit you want and copy the SHA-1 hash.

A valid submission will look something like (this is just an example\!)

``` r
# https://github.com/rdpeng/ProgrammingAssignment2
```

``` r
## Put comments here that give an overall description of what your
## functions do  

# The makeCacheMatrix() function takes a square invertible matrix as its  
# argument and creates a special list of four functions: set(), get(),  
# setsolve(), getsolve().   

# The cacheSolve() function takes a special list created by the makeCacheMatrix()  
# function as its argument and returns the inverse of a square matrix from the  
# special list.  


## Write a short comment describing this function
# The function below creates two objects, namely `x` and `inv` in the same  
# (enclosing) environment of the four functions: set(), get(), setsolve() and  
# getsolve(). By using the `<<-` operator, set() and setsolve() functions modify  
# the values of `x` and `inv` in the enclosing environment. The get() and  
# getsolve() simply retrieve the current values of `x` and `inv` in the enclosing  
# environment.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setsolve <- function(sol) inv <<- sol
        getsolve <- function() inv
        list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}

## Write a short comment describing this function
# The function below checks if the value of `inv` have already been calculated  
# (exists) and, if exists, returns that `inv` value. If does not exist, it  
# retrieves the value of `x` in the enclosing environment, calculates the inverse  
# of it, modifies the value of `inv` in the enclosing environment, and returns  
# the value of the new `inv`. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getsolve()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setsolve(inv)
        inv
}
```

#### Let’s try if the functions work

``` r
m <- matrix(c(4, 2, 7, 6), nrow = 2, ncol = 2)
m
```

    ##      [,1] [,2]
    ## [1,]    4    7
    ## [2,]    2    6

``` r
a <- makeCacheMatrix(m)
cacheSolve(a)
```

    ##      [,1] [,2]
    ## [1,]  0.6 -0.7
    ## [2,] -0.2  0.4

``` r
cacheSolve(a)
```

    ## getting cached data

    ##      [,1] [,2]
    ## [1,]  0.6 -0.7
    ## [2,] -0.2  0.4

# Key Takeaway Functions

  - **Loop Functions**
      - lapply
          - `rnorm(n, mean = 0, sd = 1), runif(n, min = 0, max = 1)`
      - mapply
          - `rep(x, times)`
      - tapply
          - `gl(levels, repeat)`
  - **Debugging Tools**
      - Diagnosing the Problem
          - `invisible()`
