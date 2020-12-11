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
    ## -8.6925 -1.0818  0.8046  1.4144  4.3533  8.9992

``` r
str(x)
```

    ##  num [1:100] 2.735 1.355 5.638 -3.053 0.614 ...

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

    ##  num [1:10, 1:10] -0.924 -0.149 -0.649 0.192 -0.592 ...

``` r
m[, 1]
```

    ##  [1] -0.9235530 -0.1491314 -0.6494502  0.1924954 -0.5923030 -1.9518314
    ##  [7]  1.3119995 -0.8861392  0.2112087 -1.0905654

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
# qnorm(p, mean = 0, sd = 1, lowertail = TRUE, log.p = FALSE)
# rnorm(n, mean = 0, sd = 1)
```

If
<img src="https://render.githubusercontent.com/render/math?math=$\Phi$">
is the *cumulative distribution function* for a standard normal
distribution, then `pnorm(q)` =
<img src="https://render.githubusercontent.com/render/math?math=$\Phi(q)$">
and `qnorm(p)` =
<img src="https://render.githubusercontent.com/render/math?math=$\Phi^{-1}(p)$">

## Simulating a Linear Model

## Random Sampling

# R Profiler

## Part 1

## Part 2

# Quiz

# Programming Assignment

# Key Takeaway Functions

  - **The str Function**
      - *str()*
  - **Simulation**
      - Generating Random Numbers
          - **<img src="https://render.githubusercontent.com/render/math?math=">**

<https://www.stat.cmu.edu/~cshalizi/rmarkdown/#math-in-r-markdown>  
<https://bookdown.org/yihui/rmarkdown/html-document.html#mathjax-equations>  
<https://gist.github.com/a-rodin/fef3f543412d6e1ec5b6cf55bf197d7b>
