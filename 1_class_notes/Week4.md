Week 4
================

# Table of Contents

  - **The str Function**

  - **Simulation**
    
      - Generating Random Numbers
      - Simulating a Linear Model
      - Random Sampling

  - **R Profiler**
    
      - Part 1
      - Part 2

  - **Quiz**

  - **Programming Assignment**

  - **Key Takeaway Functions**

# The str Function

`str()`: Compactly display the internal “structure” of an R object

  - A diagnostic function and an alternative to `summary`
  - It is especially well suited to compactly display the (abbreviated)
    contents of (possibly nested) lists
  - Roughly one line per basic object

**What’s in this object?**

``` r
str(str)
```

    ## function (object, ...)

It is a function that takes any object

**Function**

``` r
str(lm)
```

    ## function (formula, data, subset, weights, na.action, method = "qr", model = TRUE, 
    ##     x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, contrasts = NULL, 
    ##     offset, ...)

``` r
str(ls)
```

    ## function (name, pos = -1L, envir = as.environment(pos), all.names = FALSE, 
    ##     pattern, sorted = TRUE)

**Vector**

``` r
x <- rnorm(100, 2, 4)
summary(x)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##  -8.741  -1.079   1.620   1.518   4.131  10.766

``` r
str(x)
```

    ##  num [1:100] -2.552 4.793 3.651 2.921 0.939 ...

**Factor**

``` r
f <- gl(40, 10)
f
```

    ##   [1] 1  1  1  1  1  1  1  1  1  1  2  2  2  2  2  2  2  2  2  2  3  3  3  3  3 
    ##  [26] 3  3  3  3  3  4  4  4  4  4  4  4  4  4  4  5  5  5  5  5  5  5  5  5  5 
    ##  [51] 6  6  6  6  6  6  6  6  6  6  7  7  7  7  7  7  7  7  7  7  8  8  8  8  8 
    ##  [76] 8  8  8  8  8  9  9  9  9  9  9  9  9  9  9  10 10 10 10 10 10 10 10 10 10
    ## [101] 11 11 11 11 11 11 11 11 11 11 12 12 12 12 12 12 12 12 12 12 13 13 13 13 13
    ## [126] 13 13 13 13 13 14 14 14 14 14 14 14 14 14 14 15 15 15 15 15 15 15 15 15 15
    ## [151] 16 16 16 16 16 16 16 16 16 16 17 17 17 17 17 17 17 17 17 17 18 18 18 18 18
    ## [176] 18 18 18 18 18 19 19 19 19 19 19 19 19 19 19 20 20 20 20 20 20 20 20 20 20
    ## [201] 21 21 21 21 21 21 21 21 21 21 22 22 22 22 22 22 22 22 22 22 23 23 23 23 23
    ## [226] 23 23 23 23 23 24 24 24 24 24 24 24 24 24 24 25 25 25 25 25 25 25 25 25 25
    ## [251] 26 26 26 26 26 26 26 26 26 26 27 27 27 27 27 27 27 27 27 27 28 28 28 28 28
    ## [276] 28 28 28 28 28 29 29 29 29 29 29 29 29 29 29 30 30 30 30 30 30 30 30 30 30
    ## [301] 31 31 31 31 31 31 31 31 31 31 32 32 32 32 32 32 32 32 32 32 33 33 33 33 33
    ## [326] 33 33 33 33 33 34 34 34 34 34 34 34 34 34 34 35 35 35 35 35 35 35 35 35 35
    ## [351] 36 36 36 36 36 36 36 36 36 36 37 37 37 37 37 37 37 37 37 37 38 38 38 38 38
    ## [376] 38 38 38 38 38 39 39 39 39 39 39 39 39 39 39 40 40 40 40 40 40 40 40 40 40
    ## 40 Levels: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 ... 40

``` r
str(f)
```

    ##  Factor w/ 40 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...

``` r
summary(f) # displays the number of elements in each level
```

    ##  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 
    ## 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 
    ## 27 28 29 30 31 32 33 34 35 36 37 38 39 40 
    ## 10 10 10 10 10 10 10 10 10 10 10 10 10 10

**Data Frame**

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
summary(airquality)
```

    ##      Ozone           Solar.R           Wind             Temp      
    ##  Min.   :  1.00   Min.   :  7.0   Min.   : 1.700   Min.   :56.00  
    ##  1st Qu.: 18.00   1st Qu.:115.8   1st Qu.: 7.400   1st Qu.:72.00  
    ##  Median : 31.50   Median :205.0   Median : 9.700   Median :79.00  
    ##  Mean   : 42.13   Mean   :185.9   Mean   : 9.958   Mean   :77.88  
    ##  3rd Qu.: 63.25   3rd Qu.:258.8   3rd Qu.:11.500   3rd Qu.:85.00  
    ##  Max.   :168.00   Max.   :334.0   Max.   :20.700   Max.   :97.00  
    ##  NA's   :37       NA's   :7                                       
    ##      Month            Day      
    ##  Min.   :5.000   Min.   : 1.0  
    ##  1st Qu.:6.000   1st Qu.: 8.0  
    ##  Median :7.000   Median :16.0  
    ##  Mean   :6.993   Mean   :15.8  
    ##  3rd Qu.:8.000   3rd Qu.:23.0  
    ##  Max.   :9.000   Max.   :31.0  
    ## 

``` r
str(airquality)
```

    ## 'data.frame':    153 obs. of  6 variables:
    ##  $ Ozone  : int  41 36 12 18 NA 28 23 19 8 NA ...
    ##  $ Solar.R: int  190 118 149 313 NA NA 299 99 19 194 ...
    ##  $ Wind   : num  7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
    ##  $ Temp   : int  67 72 74 62 56 66 65 59 61 69 ...
    ##  $ Month  : int  5 5 5 5 5 5 5 5 5 5 ...
    ##  $ Day    : int  1 2 3 4 5 6 7 8 9 10 ...

**Matrix**

``` r
m <- matrix(rnorm(100), 10, 10)
str(m) # Matrix is a two-dimensional array
```

    ##  num [1:10, 1:10] -1.077 -0.27 -0.571 -0.639 1.521 ...

``` r
m[, 1]
```

    ##  [1] -1.0769521 -0.2700859 -0.5711953 -0.6392560  1.5211013  1.0550790
    ##  [7] -0.8966453 -1.1007018  1.3460372 -0.4613924

**List**

``` r
s <- split(airquality, airquality$Month)
str(s)
```

    ## List of 5
    ##  $ 5:'data.frame':   31 obs. of  6 variables:
    ##   ..$ Ozone  : int [1:31] 41 36 12 18 NA 28 23 19 8 NA ...
    ##   ..$ Solar.R: int [1:31] 190 118 149 313 NA NA 299 99 19 194 ...
    ##   ..$ Wind   : num [1:31] 7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
    ##   ..$ Temp   : int [1:31] 67 72 74 62 56 66 65 59 61 69 ...
    ##   ..$ Month  : int [1:31] 5 5 5 5 5 5 5 5 5 5 ...
    ##   ..$ Day    : int [1:31] 1 2 3 4 5 6 7 8 9 10 ...
    ##  $ 6:'data.frame':   30 obs. of  6 variables:
    ##   ..$ Ozone  : int [1:30] NA NA NA NA NA NA 29 NA 71 39 ...
    ##   ..$ Solar.R: int [1:30] 286 287 242 186 220 264 127 273 291 323 ...
    ##   ..$ Wind   : num [1:30] 8.6 9.7 16.1 9.2 8.6 14.3 9.7 6.9 13.8 11.5 ...
    ##   ..$ Temp   : int [1:30] 78 74 67 84 85 79 82 87 90 87 ...
    ##   ..$ Month  : int [1:30] 6 6 6 6 6 6 6 6 6 6 ...
    ##   ..$ Day    : int [1:30] 1 2 3 4 5 6 7 8 9 10 ...
    ##  $ 7:'data.frame':   31 obs. of  6 variables:
    ##   ..$ Ozone  : int [1:31] 135 49 32 NA 64 40 77 97 97 85 ...
    ##   ..$ Solar.R: int [1:31] 269 248 236 101 175 314 276 267 272 175 ...
    ##   ..$ Wind   : num [1:31] 4.1 9.2 9.2 10.9 4.6 10.9 5.1 6.3 5.7 7.4 ...
    ##   ..$ Temp   : int [1:31] 84 85 81 84 83 83 88 92 92 89 ...
    ##   ..$ Month  : int [1:31] 7 7 7 7 7 7 7 7 7 7 ...
    ##   ..$ Day    : int [1:31] 1 2 3 4 5 6 7 8 9 10 ...
    ##  $ 8:'data.frame':   31 obs. of  6 variables:
    ##   ..$ Ozone  : int [1:31] 39 9 16 78 35 66 122 89 110 NA ...
    ##   ..$ Solar.R: int [1:31] 83 24 77 NA NA NA 255 229 207 222 ...
    ##   ..$ Wind   : num [1:31] 6.9 13.8 7.4 6.9 7.4 4.6 4 10.3 8 8.6 ...
    ##   ..$ Temp   : int [1:31] 81 81 82 86 85 87 89 90 90 92 ...
    ##   ..$ Month  : int [1:31] 8 8 8 8 8 8 8 8 8 8 ...
    ##   ..$ Day    : int [1:31] 1 2 3 4 5 6 7 8 9 10 ...
    ##  $ 9:'data.frame':   30 obs. of  6 variables:
    ##   ..$ Ozone  : int [1:30] 96 78 73 91 47 32 20 23 21 24 ...
    ##   ..$ Solar.R: int [1:30] 167 197 183 189 95 92 252 220 230 259 ...
    ##   ..$ Wind   : num [1:30] 6.9 5.1 2.8 4.6 7.4 15.5 10.9 10.3 10.9 9.7 ...
    ##   ..$ Temp   : int [1:30] 91 92 93 93 87 84 80 78 75 73 ...
    ##   ..$ Month  : int [1:30] 9 9 9 9 9 9 9 9 9 9 ...
    ##   ..$ Day    : int [1:30] 1 2 3 4 5 6 7 8 9 10 ...

# Simulation

## Generating Random Numbers

Functions for *probability distributions* in R

  - `rnorm`: generate “**r**andom **norm**al” variates with a given
    *mean* and *standard deviation*
  - `dnorm`: evaluate the “**norm**al probability **d**ensity” (with a
    given mean/SD) at a point (or vector of points)
  - `pnorm`: evaluate the “**cumulative** distribution function” for a
    **norm**al distribution
  - `rpois`: generate **r**andom **pois**son variates with a given rate

*Probability distribution functions* usually have “four” functions
associated with them.  
The functions are prefixed with a:

  - `d` for density
  - `r` for random number generation
  - `p` for cumulative distribution
  - `q` for quantile function

Working with the *normal* distributions requires using these “four”
functions

``` r
# dnorm(x, mean = 0, sd = 1, log = FALSE)
# pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# rnorm(n, mean = 0, sd = 1)
```

If
<img src="https://render.githubusercontent.com/render/math?math=$\Phi$">
is the *cumulative distribution function* for a standard normal
distribution, then `pnorm(q)` =
<img src="https://render.githubusercontent.com/render/math?math=$\Phi(q)$">
and `qnorm(p)` =
<img src="https://render.githubusercontent.com/render/math?math=$\Phi^{-1}(p)$">

``` r
x <- rnorm(10)
x
```

    ##  [1] -0.26071944 -1.23906279  0.05589265 -0.97157743  0.37306084 -0.81300526
    ##  [7]  0.54860469 -0.27845412 -0.50368128 -0.36757009

``` r
x <- rnorm(10, 20, 2)
x
```

    ##  [1] 17.40615 22.09130 21.31109 18.96237 20.44793 19.39137 19.48162 18.23976
    ##  [9] 20.33007 14.62607

``` r
summary(x)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   14.63   18.42   19.44   19.23   20.42   22.09

Setting the random number seed with `set.seed` ensures
“reproducibility”  
Always set the random number seed when conducting a simulation\!

#### Normal Random Variables

``` r
set.seed(1)
rnorm(5)
```

    ## [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

``` r
set.seed(1)
rnorm(5)
```

    ## [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

``` r
rnorm(5)
```

    ## [1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884

``` r
set.seed(1)
rnorm(5)
```

    ## [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

``` r
rnorm(5)
```

    ## [1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884

``` r
rnorm(5)
```

    ## [1]  1.5117812  0.3898432 -0.6212406 -2.2146999  1.1249309

#### Poisson Random Variables

``` r
rpois(10, 1)
```

    ##  [1] 1 1 1 0 2 1 2 0 1 1

``` r
rpois(10, 2)
```

    ##  [1] 3 2 3 2 2 3 0 2 3 3

``` r
rpois(10, 29)
```

    ##  [1] 28 28 21 29 27 26 31 28 21 34

``` r
# Cumulative distribution
ppois(2, 2) # Pr(x <= 2)
```

    ## [1] 0.6766764

``` r
ppois(4, 2) # Pr(x <= 4)
```

    ## [1] 0.947347

``` r
ppois(6, 2) # Pr(x <= 6)
```

    ## [1] 0.9954662

## Simulating a Linear Model

Suppose we want to simulate from the following linear model

<img src="https://render.githubusercontent.com/render/math?math=$y = \beta_0 + \beta_1 x + \epsilon$">

where
<img src="https://render.githubusercontent.com/render/math?math=$\epsilon \sim \mathcal{N}(0, 2^{2})$">.
Assume
<img src="https://render.githubusercontent.com/render/math?math=$x \sim \mathcal{N}(0, 1^{2}), \: \beta_0 = 0.5 \: and \: \beta_1 = 2$">.

``` r
set.seed(20)
x <- rnorm(100)
e <- rnorm(n = 100, mean = 0, sd = 2)

y <- 0.5 + 2 * x + e
summary(y)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ## -6.4084 -1.5402  0.6789  0.6893  2.9303  6.5052

``` r
plot(x, y)
abline(lm(y ~ x), col = "blue")
```

![](Week4_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

``` r
model <- lm(y ~ x)
summary(model)
```

    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9170 -1.3303  0.1328  1.5261  3.6446 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   0.6777     0.1983   3.417 0.000922 ***
    ## x             2.3596     0.2013  11.719  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.983 on 98 degrees of freedom
    ## Multiple R-squared:  0.5836, Adjusted R-squared:  0.5793 
    ## F-statistic: 137.3 on 1 and 98 DF,  p-value: < 2.2e-16

What if `x` is binary?

``` r
set.seed(10)
x <- rbinom(n = 100, size = 1, prob = 0.5)
e <- rnorm(n = 100, mean = 0, sd = 2)

y <- 0.5 + 2 * x + e
summary(y)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ## -3.4936 -0.1409  1.5767  1.4322  2.8397  6.9410

``` r
plot(x, y)
```

![](Week4_files/figure-gfm/unnamed-chunk-14-1.png)<!-- -->

Suppose we want to simulate from a *Poisson* model where

<img src="https://render.githubusercontent.com/render/math?math=$Y \sim Poisson(\mu)$">  
<img src="https://render.githubusercontent.com/render/math?math=$log \: \mu = \beta_0 + \beta_1 x$">  
and
<img src="https://render.githubusercontent.com/render/math?math=$\beta_0 = 0.5 \: and \: \beta_1 = 0.3$">.  
We need to use the `rpois` function for this

``` r
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x

y <- rpois(100, exp(log.mu))
summary(y)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    0.00    1.00    1.00    1.55    2.00    6.00

``` r
plot(x, y)
```

![](Week4_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

## Random Sampling

The `sample()` function draws randomly from a specified set of (scalar)
objects allowing you to sample from arbitrary distributions.

``` r
set.seed(1)

sample(1:10, 4)
```

    ## [1] 9 4 7 1

``` r
sample(1:10, 4)
```

    ## [1] 2 7 3 6

``` r
sample(letters, 5)
```

    ## [1] "r" "s" "a" "u" "w"

``` r
sample(1:10) # permutation
```

    ##  [1] 10  6  9  2  1  5  8  4  3  7

``` r
sample(1:10)
```

    ##  [1]  5 10  2  8  6  1  4  3  9  7

``` r
sample(1:10, replace = TRUE) # Sample with replacement
```

    ##  [1]  3  6 10 10  6  4  4 10  9  7

# R Profiler

  - “Profiling” is a systematic way to “examine how much time” is spent
    in different parts of a program
  - Useful when trying to “optimize” your code

## Part 1

#### system.time()

  - Takes an arbitrary R expression as input (can be wrapped in curly
    braces) and returns the amount of time taken to evaluate the
    expression
  - Computes the time (*in seconds*) needed to execute an expression
  - Returns an object of class `proc_time`
      - **user time:** time charged to the CPU(s) for this expression
        (for the computer)
      - **elapsed time:** “wall clock” time (for myself)

<!-- end list -->

``` r
# Elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))
```

    ##    user  system elapsed 
    ##   0.021   0.005   1.792

``` r
# The chunk of the time is just spent waiting for the network, or for the data 
# to go over the network and to come back to your computer
```

``` r
# Elapsed time < user time
hilbert <- function(n) {
        i <- 1:n
        1 / outer(i - 1, i, "+")
}

x <- hilbert(1000)
system.time(svd(x))
```

    ##    user  system elapsed 
    ##   2.843   0.017   2.868

Timing longer expressions:

``` r
system.time({
        n <- 1000
        r <- numeric(n)
        for (i in 1:n) {
                x <- rnorm(n)
                r[i] <- mean(x)
        }
})
```

    ##    user  system elapsed 
    ##   0.083   0.004   0.087

## Part 2

#### Rprof()

  - The `Rprof()` function starts the profiler in R
      - R must be complied with profiler support (but this is usually
        the case)
  - The `summaryRprof()` function summarizes the output from `Rprof()`
    (otherwise it’s not readable)
  - DO NOT use `system.time()` and `Rprof()` together or you will be sad
  - `Rprof()` keeps track of the “function call stack” at regularly
    sampled intervals and tabulates how much time is spent in each
    function
  - Default sampling interval is 0.02 seconds
  - NOTE: If your code runs very quickly, the profiler is not useful,
    but then you probably don’t need it in that case

<!-- end list -->

``` r
# lm(y ~ x)

sample.interval=10000
```

  - The `summaryRprof()` function tabulates the R profiler output and
    calculates how much time is spent in which function
  - There are two methods for normalizing the data
  - `by.total` divides the time spent in each function by the total run
    time
  - `by.self` does the same but first subtracts out time spent in
    functions above in the call stack

#### by.total

#### by.self

Tells you how much time is being spent in a given function, but after
subtracting out all of the other time spent in lower level functions
that it calls.

#### summaryRprof() output

Summarizes the output of `Rprof()` and gives “percent of time” spent in
each function (with two types of normalization)

``` r
# $sample.interval
## [1] 0.02

# $sampling.time        # the total amount of time that the expression took to run
## [1] 7.41             # = elapse time
```

# Quiz

## Question 1

**What is produced at the end of this snippet of R code?**

``` r
set.seed(1)
rpois(n = 5, lambda = 2)
```

    ## [1] 1 1 2 4 1

## Question 2

**What R function can be used to generate standard Normal random
variables?** (Answer): `rnorm`

## Question 3

**When simulating data, why is using the `set.seed()` function
important?**  
**Select all that apply.**  
(Answer):  
It ensure that the sequence of random numbers starts in a specific place
and its therefore reproducible.

## Question 4

**Which function can be used to evaluate the inverse cumulative
distribution function for the Poisson distribution?**  
(Answer): `qpois`

## Question 5

**What does the following code do?**

``` r
set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
```

(Answer): Generate data from a Normal linear model

## Question 6

**What R function can be used to generate Binomial random variables?**  
(Answer): `rbinom()`

## Question 7

**What aspect of the R runtime does the profiler keep track of when an R
expression is evaulated?**  
(Answer): The function call stack

## Question 8

**Consider the following R code**

``` r
library(datasets)
Rprof()
# fit <- lm(y ~ x1 + x2)
Rprof(NULL)
```

**(Assume that y, x1, and x2 are present in the workspace).**  
**Without running the code, what percentage of the run time is spent in
the `lm()` function, based on the `by.total` method of normalization
shown in `summaryRprof()`?**  
(Answer): 100%

## Question 9

**When using `system.time()`, what is the user time?**  
(Answer): It is the time spent by the CPU evaluating an expression

## Question 10

**If a computer has more than one available processor and R is able to
take advantage of that, then which of the following is true when using
`system.time()`?**  
(Answer): Elapsed time may be smaller than user time

# Programming Assignment

``` r
getwd()
```

    ## [1] "/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project/1_class_notes"

``` r
setwd("/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project/data")
```

## 1\. Plot the 30-day mortality rates for heart attack

``` r
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
```

    ##   Provider.Number                    Hospital.Name                  Address.1
    ## 1          010001 SOUTHEAST ALABAMA MEDICAL CENTER     1108 ROSS CLARK CIRCLE
    ## 2          010005    MARSHALL MEDICAL CENTER SOUTH 2505 U S HIGHWAY 431 NORTH
    ## 3          010006   ELIZA COFFEE MEMORIAL HOSPITAL         205 MARENGO STREET
    ## 4          010007         MIZELL MEMORIAL HOSPITAL              702 N MAIN ST
    ## 5          010008      CRENSHAW COMMUNITY HOSPITAL        101 HOSPITAL CIRCLE
    ## 6          010010    MARSHALL MEDICAL CENTER NORTH    8000 ALABAMA HIGHWAY 69
    ##   Address.2 Address.3         City State ZIP.Code County.Name Phone.Number
    ## 1                           DOTHAN    AL    36301     HOUSTON   3347938701
    ## 2                             BOAZ    AL    35957    MARSHALL   2565938310
    ## 3                         FLORENCE    AL    35631  LAUDERDALE   2567688400
    ## 4                              OPP    AL    36467   COVINGTON   3344933541
    ## 5                          LUVERNE    AL    36049    CRENSHAW   3343353374
    ## 6                     GUNTERSVILLE    AL    35976    MARSHALL   2565718000
    ##   Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    ## 1                                                      14.3
    ## 2                                                      18.5
    ## 3                                                      18.1
    ## 4                                             Not Available
    ## 5                                             Not Available
    ## 6                                             Not Available
    ##   Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    ## 1                                                No Different than U.S. National Rate
    ## 2                                                No Different than U.S. National Rate
    ## 3                                                No Different than U.S. National Rate
    ## 4                                                           Number of Cases Too Small
    ## 5                                                           Number of Cases Too Small
    ## 6                                                           Number of Cases Too Small
    ##   Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    ## 1                                                                                 12.1
    ## 2                                                                                 14.7
    ## 3                                                                                 14.8
    ## 4                                                                        Not Available
    ## 5                                                                        Not Available
    ## 6                                                                        Not Available
    ##   Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    ## 1                                                                                 17.0
    ## 2                                                                                 23.0
    ## 3                                                                                 21.8
    ## 4                                                                        Not Available
    ## 5                                                                        Not Available
    ## 6                                                                        Not Available
    ##   Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    ## 1                                                                            666
    ## 2                                                                             44
    ## 3                                                                            329
    ## 4                                                                             14
    ## 5                                                                              9
    ## 6                                                                             22
    ##                                Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    ## 1                                                                                                  
    ## 2                                                                                                  
    ## 3                                                                                                  
    ## 4 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ## 5 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ## 6 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ##   Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    ## 1                                                       11.4
    ## 2                                                       15.2
    ## 3                                                       11.3
    ## 4                                                       13.6
    ## 5                                                       13.8
    ## 6                                                       12.5
    ##   Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    ## 1                                                 No Different than U.S. National Rate
    ## 2                                                        Worse than U.S. National Rate
    ## 3                                                 No Different than U.S. National Rate
    ## 4                                                 No Different than U.S. National Rate
    ## 5                                                 No Different than U.S. National Rate
    ## 6                                                 No Different than U.S. National Rate
    ##   Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    ## 1                                                                                   9.5
    ## 2                                                                                  12.2
    ## 3                                                                                   9.1
    ## 4                                                                                  10.0
    ## 5                                                                                   9.9
    ## 6                                                                                   9.9
    ##   Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    ## 1                                                                                  13.7
    ## 2                                                                                  18.8
    ## 3                                                                                  13.9
    ## 4                                                                                  18.2
    ## 5                                                                                  18.7
    ## 6                                                                                  15.6
    ##   Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    ## 1                                                                             741
    ## 2                                                                             234
    ## 3                                                                             523
    ## 4                                                                             113
    ## 5                                                                              53
    ## 6                                                                             163
    ##   Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    ## 1                                                                      
    ## 2                                                                      
    ## 3                                                                      
    ## 4                                                                      
    ## 5                                                                      
    ## 6                                                                      
    ##   Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    ## 1                                                   10.9
    ## 2                                                   13.9
    ## 3                                                   13.4
    ## 4                                                   14.9
    ## 5                                                   15.8
    ## 6                                                    8.7
    ##   Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    ## 1                                             No Different than U.S. National Rate
    ## 2                                             No Different than U.S. National Rate
    ## 3                                             No Different than U.S. National Rate
    ## 4                                             No Different than U.S. National Rate
    ## 5                                             No Different than U.S. National Rate
    ## 6                                                   Better than U.S. National Rate
    ##   Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    ## 1                                                                               8.6
    ## 2                                                                              11.3
    ## 3                                                                              11.2
    ## 4                                                                              11.6
    ## 5                                                                              11.4
    ## 6                                                                               6.8
    ##   Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    ## 1                                                                              13.7
    ## 2                                                                              17.0
    ## 3                                                                              15.8
    ## 4                                                                              19.0
    ## 5                                                                              21.5
    ## 6                                                                              11.0
    ##   Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    ## 1                                                                         371
    ## 2                                                                         372
    ## 3                                                                         836
    ## 4                                                                         239
    ## 5                                                                          61
    ## 6                                                                         315
    ##   Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    ## 1                                                                  
    ## 2                                                                  
    ## 3                                                                  
    ## 4                                                                  
    ## 5                                                                  
    ## 6                                                                  
    ##   Hospital.30.Day.Readmission.Rates.from.Heart.Attack
    ## 1                                                19.0
    ## 2                                       Not Available
    ## 3                                                17.8
    ## 4                                       Not Available
    ## 5                                       Not Available
    ## 6                                       Not Available
    ##   Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
    ## 1                                          No Different than U.S. National Rate
    ## 2                                                     Number of Cases Too Small
    ## 3                                          No Different than U.S. National Rate
    ## 4                                                     Number of Cases Too Small
    ## 5                                                     Number of Cases Too Small
    ## 6                                                     Number of Cases Too Small
    ##   Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
    ## 1                                                                             16.6
    ## 2                                                                    Not Available
    ## 3                                                                             14.9
    ## 4                                                                    Not Available
    ## 5                                                                    Not Available
    ## 6                                                                    Not Available
    ##   Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
    ## 1                                                                             21.7
    ## 2                                                                    Not Available
    ## 3                                                                             21.5
    ## 4                                                                    Not Available
    ## 5                                                                    Not Available
    ## 6                                                                    Not Available
    ##   Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
    ## 1                                                                      728
    ## 2                                                                       21
    ## 3                                                                      342
    ## 4                                                                        1
    ## 5                                                                        4
    ## 6                                                                       13
    ##                                      Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
    ## 1                                                                                                  
    ## 2 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ## 3                                                                                                  
    ## 4 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ## 5 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ## 6 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
    ##   Hospital.30.Day.Readmission.Rates.from.Heart.Failure
    ## 1                                                 23.7
    ## 2                                                 22.5
    ## 3                                                 19.8
    ## 4                                                 27.1
    ## 5                                                 24.7
    ## 6                                                 23.9
    ##   Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
    ## 1                                           No Different than U.S. National Rate
    ## 2                                           No Different than U.S. National Rate
    ## 3                                                 Better than U.S. National Rate
    ## 4                                           No Different than U.S. National Rate
    ## 5                                           No Different than U.S. National Rate
    ## 6                                           No Different than U.S. National Rate
    ##   Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
    ## 1                                                                              21.3
    ## 2                                                                              19.2
    ## 3                                                                              17.2
    ## 4                                                                              22.4
    ## 5                                                                              19.9
    ## 6                                                                              20.1
    ##   Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
    ## 1                                                                              26.5
    ## 2                                                                              26.1
    ## 3                                                                              22.9
    ## 4                                                                              31.9
    ## 5                                                                              30.2
    ## 6                                                                              28.2
    ##   Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
    ## 1                                                                       891
    ## 2                                                                       264
    ## 3                                                                       614
    ## 4                                                                       135
    ## 5                                                                        59
    ## 6                                                                       173
    ##   Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
    ## 1                                                                
    ## 2                                                                
    ## 3                                                                
    ## 4                                                                
    ## 5                                                                
    ## 6                                                                
    ##   Hospital.30.Day.Readmission.Rates.from.Pneumonia
    ## 1                                             17.1
    ## 2                                             17.6
    ## 3                                             16.9
    ## 4                                             19.4
    ## 5                                             18.0
    ## 6                                             18.7
    ##   Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Pneumonia
    ## 1                                       No Different than U.S. National Rate
    ## 2                                       No Different than U.S. National Rate
    ## 3                                       No Different than U.S. National Rate
    ## 4                                       No Different than U.S. National Rate
    ## 5                                       No Different than U.S. National Rate
    ## 6                                       No Different than U.S. National Rate
    ##   Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia
    ## 1                                                                          14.4
    ## 2                                                                          15.0
    ## 3                                                                          14.7
    ## 4                                                                          15.9
    ## 5                                                                          14.0
    ## 6                                                                          15.7
    ##   Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia
    ## 1                                                                          20.4
    ## 2                                                                          20.6
    ## 3                                                                          19.5
    ## 4                                                                          23.2
    ## 5                                                                          22.8
    ## 6                                                                          22.2
    ##   Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Pneumonia
    ## 1                                                                   400
    ## 2                                                                   374
    ## 3                                                                   842
    ## 4                                                                   254
    ## 5                                                                    56
    ## 6                                                                   326
    ##   Footnote...Hospital.30.Day.Readmission.Rates.from.Pneumonia
    ## 1                                                            
    ## 2                                                            
    ## 3                                                            
    ## 4                                                            
    ## 5                                                            
    ## 6

``` r
outcome[, 11] <- as.numeric(outcome[, 11])
```

    ## Warning: NAs introduced by coercion

``` r
hist(outcome[, 11])
```

![](Week4_files/figure-gfm/unnamed-chunk-29-1.png)<!-- -->

## 2\. Finding the best hospital in a state

``` r
best <- function(state, outcome) {
        ## Read outcome data
        
        ## Check that state and outcome are valid
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
}
```

<!-- ## Question 1 -->

<!-- ```{r} -->

<!-- best("SC", "heart attack") -->

<!-- ``` -->

<!-- ## Question 2 -->

<!-- ```{r} -->

<!-- best("NY", "pneumonia") -->

<!-- ``` -->

<!-- ## Question 3 -->

<!-- ```{r} -->

<!-- best("AK", "pneumonia") -->

<!-- ``` -->

<!-- ## Question 4 -->

<!-- ```{r} -->

<!-- rankhospital("NC", "heart attack", "worst") -->

<!-- ``` -->

<!-- ## Question 5 -->

<!-- ```{r} -->

<!-- rankhospital("WA", "heart attack", 7) -->

<!-- ``` -->

<!-- ## Question 6 -->

<!-- ```{r} -->

<!-- rankhospital("TX", "pneumonia", 10) -->

<!-- ``` -->

<!-- ## Question 7 -->

<!-- ```{r} -->

<!-- rankhospital("NY", "heart attack", 7) -->

<!-- ``` -->

<!-- ## Question 8 -->

<!-- ```{r} -->

<!-- r <- rankall("heart attack", 4) -->

<!-- as.character(subset(r, state == "HI")$hospital) -->

<!-- ``` -->

<!-- ## Question 9 -->

<!-- ```{r} -->

<!-- r <- rankall("pneumonia", "worst") -->

<!-- as.character(subset(r, state == "NJ")$hospital) -->

<!-- ``` -->

<!-- ## Question 10 -->

<!-- ```{r} -->

<!-- r <- rankall("heart failure", 10) -->

<!-- as.character(subset(r, state == "NV")$hospital) -->

<!-- ``` -->

# Key Takeaway Functions

  - **The str Function**
      - *str()*
      - *gl(levels, repeat)*
  - **Simulation**
      - Generating Random Numbers
          - *`<img
            src="https://render.githubusercontent.com/render/math?math=">`*
          - *rnorm(n, mean = 0, sd = 1)*
          - *rnorm(), dnorm(), pnorm(), rpois()*
          - *set.seed()*
      - Simulating a Linear Model
          - *rbinorm()*
          - *plot(x, y); abline(lm(y \~ x), col = “blue”)*
          - *summary(lm(y \~ x))*
      - Random Sampling
          - *sample()*
  - **R Profiler**
      - *system.time()*
      - *Rprof(), summaryRprof(), by.total, by.self*
      - *sample.internal*
  - **Programming Assignment**
      - *hist()*

`ctrl` + `shift` + `c`

<https://www.stat.cmu.edu/~cshalizi/rmarkdown/#math-in-r-markdown>  
<https://bookdown.org/yihui/rmarkdown/html-document.html#mathjax-equations>  
<https://gist.github.com/a-rodin/fef3f543412d6e1ec5b6cf55bf197d7b>  
<https://rpruim.github.io/s341/S19/from-class/MathinRmd.html>
