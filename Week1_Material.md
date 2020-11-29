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
setwd("~/Desktop/Desktop/5_Coursera/1_R_Programming/data")
```

**Display a list of files in the working directory**

``` r
dir()
```

    ## [1] "git_project.Rproj"                "Practical R Exercises in swirl.R"
    ## [3] "README.md"                        "Week1_Material_files"            
    ## [5] "Week1_Material.md"                "Week1_Material.R"                
    ## [7] "Week1_Material.Rmd"

Link: <http://rmarkdown.rstudio.com>. Bold: **Knit**

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

## Including Plots

You can also embed plots, for example:

![](Week1_Material_files/figure-gfm/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
