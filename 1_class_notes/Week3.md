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
    ## <bytecode: 0x7fe5e58e25c0>
    ## <environment: namespace:base>

``` r
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)
```

    ## $a
    ## [1] 3
    ## 
    ## $b
    ## [1] 0.3011265

`lapply` always returns a list.

``` r
x <- 1:4
lapply(x, runif, min = 0, max = 10)
```

    ## [[1]]
    ## [1] 3.4517
    ## 
    ## [[2]]
    ## [1] 8.263581 2.960884
    ## 
    ## [[3]]
    ## [1] 8.1325622 3.0056913 0.5013486
    ## 
    ## [[4]]
    ## [1] 7.065795 3.840549 4.521816 8.888265

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
    ## [1] 0.5608414
    ## 
    ## $c
    ## [1] 0.8433872
    ## 
    ## $d
    ## [1] 5.041969

``` r
sapply(x, mean)
```

    ##         a         b         c         d 
    ## 2.5000000 0.5608414 0.8433872 5.0419692

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

    ##  [1] -0.16438455  0.37808962 -0.05267033  0.01117303 -0.32771872  0.11497619
    ##  [7]  0.11022350 -0.15340987 -0.28433623  0.13911693

``` r
apply(x, 1, sum)
```

    ##  [1]  0.97391511 -2.96395905  3.99474278  3.91846868  0.07285154 -3.27230002
    ##  [7]  4.16625585  1.68571299 -6.72391688  0.05971183 -4.63003922 -1.19192337
    ## [13]  2.38185848 -3.20067086  0.49541840 -3.20685756  5.94300672  1.12786347
    ## [19] -1.43914193 -2.76980547

  - `rowSums` = `apply(x, 1, sum)`
  - `rowMeans` = `apply(x, 1, mean)`
  - `colSums` = `apply(x, 2, sum)`
  - `colMeans` = `apply(x, 2, mean)`

<!-- end list -->

``` r
x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))
```

    ##           [,1]        [,2]        [,3]       [,4]      [,5]       [,6]
    ## 25% -0.7323748 -0.07976329 -0.09174478 -0.7775308 -1.015726 -0.2349629
    ## 75%  0.9528100  1.10140860  0.25987116  1.3754715  0.183774  1.2187823
    ##           [,7]       [,8]       [,9]      [,10]     [,11]      [,12]      [,13]
    ## 25% -0.8497789 -1.0545544 -0.2845106 -0.3797796 0.1006405 -0.4492895 -0.3545258
    ## 75%  0.5107030  0.3127752  0.3495831  0.1594865 0.6981951  0.7067883  0.9890217
    ##          [,14]      [,15]      [,16]      [,17]      [,18]       [,19]
    ## 25% -0.4872231 -0.5753697 -1.1907100 -0.1962964 -0.4116770 -0.69450803
    ## 75%  1.2249679  0.2720520  0.7648225  0.3534880  0.4372171 -0.02881722
    ##          [,20]
    ## 25% -0.5197884
    ## 75%  0.5352937

``` r
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean) # collapse (average over) the 3rd dimension
```

    ##            [,1]       [,2]
    ## [1,] -1.0093702 -0.1031629
    ## [2,] -0.4681582 -0.2695408

``` r
apply(a, 1, mean)
```

    ## [1] -0.5562666 -0.3688495

``` r
apply(a, 2, mean)
```

    ## [1] -0.7387642 -0.1863519

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

    ##  [1] -0.215455399 -0.182984996 -1.220687839 -0.935784554 -0.744703207
    ##  [6]  1.414956045  1.491455204  0.387593115 -0.388293809  2.548397327
    ## [11]  0.199515489  0.234860697  0.096545602  0.438427434  0.334492099
    ## [16]  0.269326641  0.835969883  0.816457918  0.258521632  0.822374850
    ## [21]  0.742708728  0.927488603  0.982560099  0.309025090  0.737989138
    ## [26]  0.787624276  0.002577588  0.909709179 -0.022613808  1.476181023

``` r
f <- gl(3, 10)
f
```

    ##  [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
    ## Levels: 1 2 3

``` r
tapply(x, f, mean)
```

    ##         1         2         3 
    ## 0.2154492 0.4306492 0.6853250

``` r
tapply(x, f, mean, simplify = FALSE)
```

    ## $`1`
    ## [1] 0.2154492
    ## 
    ## $`2`
    ## [1] 0.4306492
    ## 
    ## $`3`
    ## [1] 0.685325

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
    ##  [1]  0.7156623  0.7298430 -0.1093122 -0.1105401  1.4955388  1.0210782
    ##  [7]  1.7287491  1.5143240  0.5985227 -1.5544281
    ## 
    ## $`2`
    ##  [1] 0.02286176 0.82357900 0.96293764 0.62920644 0.35938181 0.99851470
    ##  [7] 0.22125489 0.16922096 0.19512905 0.17311456
    ## 
    ## $`3`
    ##  [1]  0.41757682  0.51995701  1.87492082 -0.30492047  0.84110902  2.10127114
    ##  [7] -0.07745707  0.24787376 -0.53509605 -0.22554601

``` r
lapply(split(x, f), mean) # = tapply(x, f, mean)
```

    ## $`1`
    ## [1] 0.6029438
    ## 
    ## $`2`
    ## [1] 0.4555201
    ## 
    ## $`3`
    ## [1] 0.4859689

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
    ##  $ 1.1: num [1:2] 0.388 1.842
    ##  $ 2.1: num(0) 
    ##  $ 1.2: num [1:2] 0.615 -0.677
    ##  $ 2.2: num(0) 
    ##  $ 1.3: num 2.48
    ##  $ 2.3: num -0.904
    ##  $ 1.4: num(0) 
    ##  $ 2.4: num [1:2] 0.333 0.675
    ##  $ 1.5: num(0) 
    ##  $ 2.5: num [1:2] -0.684 2.747

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

# Programming Assignment

# Key Takeaway Functions

  - **Loop Functions**
      - lapply
          - *rnorm(n, mean = 0, sd = 1), runif(n, min = 0, max = 1)*
  - **Debugging Tools**
      - Diagnosing the Problem
          - *invisible()*
