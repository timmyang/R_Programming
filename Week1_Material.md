Week1\_Material
================

## Background Material

**Get Working Directory**

``` r
getwd()
```

    ## [1] "/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project"

**Set a new Working Directory**

``` r
setwd("/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project/data")
```

**Display a list of files in the working directory**

``` r
dir()
```

    ## [1] "hw1_data.csv"

**Create a Function**

``` r
myfunction <- function() {
        x <- rnorm(100)
        mean(x)
}
```

**Execute a Function**

``` r
myfunction()
```

    ## [1] -0.1011297

**Display a list of objects in the current environment**

``` r
ls()
```

    ## [1] "myfunction"

**Source(bring) all functions(objects) in a different file**

`source("mycode.R")`

Link: <http://rmarkdown.rstudio.com>. Bold: **Knit**

Inserting R Code: Cmd+Option+I Avoid printing the code: `echo = FALSE`
