Practical R Exercises in Swirl
================

# 13: Simulation

| | 0%

One of the great advantages of using a statistical programming language
like R is its vast collection of tools for simulating random numbers.

…

|====== | 3%  
| This lesson assumes familiarity with a few common probability
distributions, but these topics will only be discussed with respect to
random number generation. Even if you have no prior experience with |
these concepts, you should be able to complete the lesson and understand
the main ideas.

…

|============ | 6%  
| The first function we’ll use to generate random numbers is sample().
Use ?sample to pull up the documentation.

`> ?sample`

You got it\!

|================== | 9%  
| Let’s simulate rolling four six-sided dice: sample(1:6, 4, replace =
TRUE).

**`> sample(1:6, 4, replace = TRUE)`**  
**`[1] 5 4 1 2`**

That’s correct\!

|======================== | 12%  
| Now repeat the command to see how your result differs. (The
probability of rolling the exact same result is (1/6)^4 = 0.00077, which
is pretty small\!)

`> sample(1:6, 4, replace = TRUE)`  
`[1] 1 3 3 2`

Great job\!

|============================== | 15%  
| sample(1:6, 4, replace = TRUE) instructs R to randomly select four
numbers between 1 and 6, WITH replacement. Sampling with replacement
simply means that each number is “replaced” after it is selected, so |
that the same number can show up more than once. This is what we want
here, since what you roll on one die shouldn’t affect what you roll on
any of the others.

…

|==================================== | 18%  
| Now sample 10 numbers between 1 and 20, WITHOUT replacement. To sample
without replacement, simply leave off the ‘replace’ argument.

`> sample(1:20, 10)`  
`[1] 4 10 2 13 11 14 3 19 15 5`

That’s a job well done\!

|========================================== | 21%  
| Since the last command sampled without replacement, no number appears
more than once in the output.

…

|================================================ | 24%  
| LETTERS is a predefined variable in R containing a vector of all 26
letters of the English alphabet. Take a look at it now.

**`> LETTERS`**  
**`[1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P"
"Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"`**

Keep up the great work\!

|====================================================== | 27%  
| The sample() function can also be used to permute, or rearrange, the
elements of a vector. For example, try sample(LETTERS) to permute all 26
letters of the English alphabet.

`> sample(LETTERS)`  
`[1] "Y" "B" "L" "M" "T" "W" "J" "U" "R" "N" "C" "K" "D" "E" "F" "S" "V"
"O" "X" "A" "G" "Q" "I" "P" "H" "Z"`

Your dedication is inspiring\!

|============================================================ | 30%  
| This is identical to taking a sample of size 26 from LETTERS, without
replacement. When the ‘size’ argument to sample() is not specified, R
takes a sample equal in size to the vector from which you are |
sampling.

…

|================================================================== |
33%  
| Now, suppose we want to simulate 100 flips of an unfair two-sided
coin. This particular coin has a 0.3 probability of landing ‘tails’ and
a 0.7 probability of landing ‘heads’.

…

|========================================================================
| 36%  
| Let the value 0 represent tails and the value 1 represent heads. Use
sample() to draw a sample of size 100 from the vector c(0,1), with
replacement. Since the coin is unfair, we must attach specific |
probabilities to the values 0 (tails) and 1 (heads) with a fourth
argument, prob = c(0.3, 0.7). Assign the result to a new variable called
flips.

**`> flips <- sample(c(0, 1), 100, replace = TRUE, prob =
c(0.3, 0.7))`**

You are quite good my friend\!

|==============================================================================
| 39%  
| View the contents of the flips variable.

`> flips`  
`[1] 1 0 1 0 1 1 1 1 0 1 1 0 1 0 1 1 1 1 1 0 0 1 1 0 1 1 0 1 1 1 0 1 0 0 0 1 1 1 1 1 1 0 1 0 1 1 0 1 0 1 1 0 1 1 1 1 1 1 1 0 1 0 0 0 1 1 1 0 1 0 1 1 1 1 1 1 1 1 1 1 0 1 1 1 0 1 0 0 1 1 1 0 0 0 0 1 0 1 1 1`

You’re the best\!

|====================================================================================
| 42%  
| Since we set the probability of landing heads on any given flip to be
0.7, we’d expect approximately 70 of our coin flips to have the value 1.
Count the actual number of 1s contained in flips using the | sum()
function.

`> sum(flips)`  
`[1] 67`

Your dedication is inspiring\!

|==========================================================================================
| 45%  
| A coin flip is a binary outcome (0 or 1) and we are performing 100
independent trials (coin flips), so we can use rbinom() to simulate a
binomial random variable. Pull up the documentation for rbinom() | using
?rbinom.

`> ?rbinom`

Keep up the great work\!

|================================================================================================
| 48%  
| Each probability distribution in R has an r\*\*\* function (for
“random”), a d\*\*\* function (for “density”), a p\*\*\* (for
“probability”), and q\*\*\* (for “quantile”). We are most interested
in the r\*\*\* functions | in this lesson, but I encourage you to
explore the others on your own.

…

|=====================================================================================================
| 52%  
| A binomial random variable represents the number of ‘successes’
(heads) in a given number of independent ‘trials’ (coin flips).
Therefore, we can generate a single random variable that represents the
| number of heads in 100 flips of our unfair coin using rbinom(1, size =
100, prob = 0.7). Note that you only specify the probability of
‘success’ (heads) and NOT the probability of ‘failure’ (tails). Try
| it now.

**`> rbinom(1, size = 100, prob = 0.7)`**  
**`[1] 69`**

You got it right\!

|===========================================================================================================
| 55%  
| Equivalently, if we want to see all of the 0s and 1s, we can request
100 observations, each of size 1, with success probability of 0.7. Give
it a try, assigning the result to a new variable called flips2.

`> flips2 <- rbinom(100, 1, 0.7)`

You are amazing\!

|=================================================================================================================
| 58%  
| View the contents of flips2.

`> flips2`  
`[1] 1 1 1 1 1 0 1 1 1 0 0 1 1 1 1 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 0 0 1 1 1 1 1 1 1 0 1 0 1 0 1 1 0 1 0 1 0 1 0 0 1 1 1 1 1 1 1 0 1 0 0 1 1 0 1 1 0 0 1 1 1 0 0 1 1 1 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 0 1 1 1`

That’s the answer I was looking for.

|=======================================================================================================================
| 61%  
| Now use sum() to count the number of 1s (heads) in flips2. It should
be close to 70\!

`> sum(flips2)`  
`[1] 71`

That’s the answer I was looking for.

|=============================================================================================================================
| 64%  
| Similar to rbinom(), we can use R to simulate random numbers from many
other probability distributions. Pull up the documentation for rnorm()
now.

`> ?rnorm`

Keep up the great work\!

|===================================================================================================================================
| 67%  
| The standard normal distribution has mean 0 and standard deviation 1.
As you can see under the ‘Usage’ section in the documentation, the
default values for the ‘mean’ and ‘sd’ arguments to rnorm() are 0 | and
1, respectively. Thus, rnorm(10) will generate 10 random numbers from a
standard normal distribution. Give it a try.

`> rnorm(10)`  
`[1] 0.02922873 -0.92348525 0.80272430 -0.47356351 1.55006362
-0.87466369 -0.18705010 0.02085773 0.75493298 -0.85934187`

Perseverance, that’s the answer.

|=========================================================================================================================================
| 70%  
| Now do the same, except with a mean of 100 and a standard deviation of
25.

**`> rnorm(10, mean = 100, sd = 25)`**  
**`[1] 130.88901 111.42281 35.88486 108.42984 44.12120 72.97981 59.51167 134.25244 108.25468 130.31036`**

Great job\!

|===============================================================================================================================================
| 73%  
| Finally, what if we want to simulate 100 *groups* of random numbers,
each containing 5 values generated from a Poisson distribution with mean
10? Let’s start with one group of 5 numbers, then I’ll show | you how to
repeat the operation 100 times in a convenient and compact way.

…

|=====================================================================================================================================================
| 76%  
| Generate 5 random values from a Poisson distribution with mean 10.
Check out the documentation for rpois() if you need help.

`> rpois(5, 10)`  
`[1] 13 7 9 12 14`

Excellent work\!

|===========================================================================================================================================================
| 79%  
| Now use replicate(100, rpois(5, 10)) to perform this operation 100
times. Store the result in a new variable called my\_pois.

**`> my_pois <- replicate(100, rpois(5, 10))`**

You are doing so well\!

|=================================================================================================================================================================
| 82%  
| Take a look at the contents of my\_pois.

`> my_pois`  
\[,1\] \[,2\] \[,3\] \[,4\] \[,5\] \[,6\] \[,7\] \[,8\] \[,9\] \[,10\]
\[,11\] \[,12\] \[,13\] \[,14\] \[,15\] \[,16\] \[,17\] \[,18\] \[,19\]
\[,20\] \[,21\] \[,22\] \[,23\] \[,24\] \[,25\] \[,26\] \[,27\] \[,28\]
\[,29\] \[,30\] \[,31\] \[,32\] \[,33\] \[,34\] \[,35\]  
\[1,\] 9 12 4 8 10 11 14 14 5 10 8 14 11 7 10 8 10 8 8 5 6 10 5 11 9 8 8
13 4 11 5 16 14 9 7  
\[2,\] 10 6 15 14 9 8 5 14 12 7 10 8 8 11 5 6 15 12 7 12 10 11 10 12 8
10 9 8 14 7 8 8 12 10 17  
\[3,\] 6 11 11 9 6 11 7 2 9 9 11 13 5 7 6 7 8 10 8 11 9 11 8 9 6 16 15
10 6 9 7 10 10 13 11  
\[4,\] 10 6 8 8 11 5 11 9 18 6 10 11 16 7 11 8 15 6 10 13 9 9 7 5 7 12 6
11 6 12 12 9 14 15 7  
\[5,\] 13 11 10 6 8 6 8 12 13 10 8 17 12 12 8 13 12 11 13 13 3 9 10 10
12 15 14 9 6 9 6 9 11 11 8  
\[,36\] \[,37\] \[,38\] \[,39\] \[,40\] \[,41\] \[,42\] \[,43\] \[,44\]
\[,45\] \[,46\] \[,47\] \[,48\] \[,49\] \[,50\] \[,51\] \[,52\] \[,53\]
\[,54\] \[,55\] \[,56\] \[,57\] \[,58\] \[,59\] \[,60\] \[,61\] \[,62\]
\[,63\] \[,64\] \[,65\] \[,66\] \[,67\] \[,68\]  
\[1,\] 9 14 12 9 10 13 11 8 6 7 10 16 11 9 12 13 6 11 16 15 10 19 14 11
9 11 9 15 6 14 6 12 4  
\[2,\] 13 6 8 11 14 11 12 12 13 7 10 11 10 10 12 7 5 9 10 9 10 10 7 10
15 16 12 11 11 11 16 9 7  
\[3,\] 18 6 9 13 9 12 13 11 12 16 10 6 11 15 8 7 7 7 11 9 11 7 15 11 9 7
7 7 10 15 13 6 8  
\[4,\] 11 12 12 15 11 11 12 13 8 6 6 6 9 9 7 11 9 4 7 12 6 14 7 12 14 6
8 5 18 3 14 14 12  
\[5,\] 12 6 9 14 18 7 5 11 6 14 11 7 7 5 10 13 10 10 7 9 21 6 5 11 6 6 7
5 8 8 16 7 13  
\[,69\] \[,70\] \[,71\] \[,72\] \[,73\] \[,74\] \[,75\] \[,76\] \[,77\]
\[,78\] \[,79\] \[,80\] \[,81\] \[,82\] \[,83\] \[,84\] \[,85\] \[,86\]
\[,87\] \[,88\] \[,89\] \[,90\] \[,91\] \[,92\] \[,93\] \[,94\] \[,95\]
\[,96\] \[,97\] \[,98\] \[,99\] \[,100\]  
\[1,\] 11 7 13 8 8 12 7 11 14 10 11 15 11 11 11 14 15 17 12 13 12 9 7 16
11 8 12 8 9 12 3 11  
\[2,\] 5 9 2 7 8 14 9 10 16 6 8 1 9 11 12 10 14 14 10 10 9 6 16 14 7 10
8 10 6 13 7 11  
\[3,\] 7 4 14 9 6 13 10 6 10 8 13 9 8 10 12 10 9 12 8 8 9 8 11 12 9 9 6
13 17 15 16 11  
\[4,\] 8 10 9 13 14 9 9 14 3 7 6 10 13 13 10 15 12 11 9 10 11 11 8 8 15
10 11 13 13 12 14 9  
\[5,\] 14 8 15 12 19 13 6 9 7 18 6 12 13 8 12 9 7 4 9 10 9 4 11 7 10 6 5
8 5 2 14 11

Nice work\!

|=======================================================================================================================================================================
| 85%  
| replicate() created a matrix, each column of which contains 5 random
numbers generated from a Poisson distribution with mean 10. Now we can
find the mean of each column in my\_pois using the colMeans() |
function. Store the result in a variable called cm.

**`> cm <- colMeans(my_pois)`**

All that practice is paying off\!

|=============================================================================================================================================================================
| 88%  
| And let’s take a look at the distribution of our column means by
plotting a histogram with hist(cm).

`> hist(cm)`

Excellent work\!

|===================================================================================================================================================================================
| 91%  
| Looks like our column means are almost normally distributed, right?
That’s the Central Limit Theorem at work, but that’s a lesson for
another day\!

…

|=========================================================================================================================================================================================
| 94%  
| All of the standard probability distributions are built into R,
including exponential (rexp()), chi-squared (rchisq()), gamma
(rgamma()), …. Well, you see the pattern.

…

|===============================================================================================================================================================================================
| 97%  
| Simulation is practically a field of its own and we’ve only skimmed
the surface of what’s possible. I encourage you to explore these and
other functions further on your own.

…

|=====================================================================================================================================================================================================|
100%  
| Would you like to receive credit for completing this course on
Coursera.org?

1: No 2: Yes

Selection:
