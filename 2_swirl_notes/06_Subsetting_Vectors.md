Practical R Exercises in Swirl
================

# 6: Subsetting Vectors

| | 0%

In this lesson, we’ll see how to extract elements from a vector based on
some conditions that we specify.

…

|===== | 3%  
| For example, we may only be interested in the first 20 elements of a
vector, or only the elements that are not NA, or only those that are
positive or correspond to a specific variable of interest. By the | end
of this lesson, you’ll know how to handle each of these scenarios.

…

|========== | 5%  
| I’ve created for you a vector called x that contains a random ordering
of 20 numbers (from a standard normal distribution) and 20 NAs. Type x
now to see what it looks like.

`> x`  
`[1] NA -0.98627194 NA NA NA NA -2.35294394 NA 1.05478316 1.02235153
NA 2.19479901 NA 0.64116999 0.20623727 -0.49344814 NA`  
`[18] 0.71704513 0.94873512 0.57226997 NA NA 0.20178478 0.56294471 NA
NA 0.10530594 -2.29974032 NA NA NA -0.40221937 2.00367940 NA`  
`[35] 0.25781492 NA -0.08761389 1.07827730 NA NA`

Keep working like that and you’ll get there\!

|=============== | 8%  
| The way you tell R that you want to select some particular elements
(i.e. a ‘subset’) from a vector is by placing an ‘index vector’ in
square brackets immediately following the name of the vector.

…

|==================== | 10%  
| For a simple example, try x\[1:10\] to view the first ten elements of
x.

`> x[1:10]`  
`[1] NA -0.9862719 NA NA NA NA -2.3529439 NA 1.0547832 1.0223515`

That’s a job well done\!

|========================= | 13%  
| **Index vectors come in four different flavors – logical vectors,
vectors of positive integers, vectors of negative integers, and vectors
of character strings** – each of which we’ll cover in this lesson.

…

|============================== | 15%  
| Let’s start by indexing with logical vectors. One common scenario when
working with real-world data is that we want to extract all elements of
a vector that are not NA (i.e. missing data). Recall that | is.na(x)
yields a vector of logical values the same length as x, with TRUEs
corresponding to NA values in x and FALSEs corresponding to non-NA
values in x.

…

|==================================== | 18%  
| What do you think x\[is.na(x)\] will give you?

1: A vector of TRUEs and FALSEs  
2: A vector of all NAs  
3: A vector with no NAs  
4: A vector of length 0

Selection: 2

Your dedication is inspiring\!

|========================================= | 21%  
| Prove it to yourself by typing x\[is.na(x)\].

`> x[is.na(x)]`  
`[1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA`

You are doing so well\!

|============================================== | 23%  
| Recall that `!` gives us the negation of a logical expression, so
\!is.na(x) can be read as ‘is not NA’. Therefore, if we want to create a
vector called y that contains all of the non-NA values from x, we | can
use y \<- x\[\!is.na(x)\]. Give it a try.

**`> y <- x[!is.na(x)]`**

All that practice is paying off\!

|=================================================== | 26%  
| Print y to the console.

`> y`  
`[1] -0.98627194
-2.35294394 1.05478316 1.02235153 2.19479901 0.64116999 0.20623727
-0.49344814 0.71704513 0.94873512 0.57226997 0.20178478 0.56294471 0.10530594
-2.29974032 -0.40221937 2.00367940`  
`[18] 0.25781492 -0.08761389 1.07827730`

You are quite good my friend\!

|======================================================== | 28%  
| Now that we’ve isolated the non-missing values of x and put them in y,
we can subset y as we please.

…

|============================================================= | 31%  
| Recall that the expression y \> 0 will give us a vector of logical
values the same length as y, with TRUEs corresponding to values of y
that are greater than zero and FALSEs corresponding to values of y |
that are less than or equal to zero. What do you think y\[y \> 0\] will
give you?

1: A vector of all the positive elements of y  
2: A vector of TRUEs and FALSEs  
3: A vector of length 0  
4: A vector of all NAs  
5: A vector of all the negative elements of y

Selection: 1

All that practice is paying off\!

|================================================================== |
33%  
| Type y\[y \> 0\] to see that we get all of the positive elements of y,
which are also the positive elements of our original vector x.

`> y[y > 0]`  
`[1] 1.0547832 1.0223515 2.1947990 0.6411700 0.2062373 0.7170451 0.9487351 0.5722700 0.2017848 0.5629447 0.1053059 2.0036794 0.2578149 1.0782773`

You nailed it\! Good job\!

|=======================================================================
| 36%  
| You might wonder why we didn’t just start with x\[x \> 0\] to isolate
the positive elements of x. Try that now to see why.

`> x[x > 0]`  
`[1] NA NA NA NA NA NA 1.0547832 1.0223515 NA 2.1947990
NA 0.6411700 0.2062373 NA 0.7170451 0.9487351 0.5722700 NA
NA 0.2017848`  
`[21] 0.5629447 NA NA 0.1053059 NA NA NA 2.0036794 NA 0.2578149
NA 1.0782773 NA NA`

Excellent work\!

|============================================================================
| 38%  
| Since NA is not a value, but rather a placeholder for an unknown
quantity, the expression NA \> 0 evaluates to NA. Hence we get a bunch
of NAs mixed in with our positive numbers when we do this.

…

|=================================================================================
| 41%  
| Combining our knowledge of logical operators with our new knowledge of
subsetting, we could do this – x\[\!is.na(x) & x \> 0\]. Try it out.

**`> x[!is.na(x) & x > 0]`**  
`[1] 1.0547832 1.0223515 2.1947990 0.6411700 0.2062373 0.7170451 0.9487351 0.5722700 0.2017848 0.5629447 0.1053059 2.0036794 0.2578149 1.0782773`

All that hard work is paying off\!

|======================================================================================
| 44%

…

|===========================================================================================
| 46%  
| I’ve already shown you how to subset just the first ten values of x
using x\[1:10\]. In this case, we’re providing a vector of positive
integers inside of the square brackets, which tells R to return only |
the elements of x numbered 1 through 10.

…

|================================================================================================
| 49%  
| Many programming languages use what’s called ‘zero-based indexing’,
which means that the first element of a vector is considered element 0.
R uses ‘one-based indexing’, which (you guessed it\!) means the | first
element of a vector is considered element 1.

…

|======================================================================================================
| 51%  
| Can you figure out how we’d subset the 3rd, 5th, and 7th elements of
x? Hint – Use the c() function to specify the element numbers as a
numeric vector.

`> c(x[3], x[5], x[7])`  
`[1] NA NA -2.352944`

You almost had it, but not quite. Try again. Or, type info() for more
options.

Create a vector of indexes with c(3, 5, 7), then put that inside of the
square brackets.

**`> x[c(3, 5, 7)]`**  
`[1] NA NA -2.352944`

You’re the best\!

|===========================================================================================================
| 54%  
| It’s important that when using integer vectors to subset our vector x,
we stick with the set of indexes {1, 2, …, 40} since x only has 40
elements. What happens if we ask for the zeroth element of x |
(i.e. x\[0\])? Give it a try.

`> x[0]`  
`numeric(0)`

You are doing so well\!

|================================================================================================================
| 56%  
| As you might expect, we get nothing useful. Unfortunately, R doesn’t
prevent us from doing this. What if we ask for the 3000th element of x?
Try it out.

`> x[3000]`  
`[1] NA`

Excellent work\!

|=====================================================================================================================
| 59%  
| Again, nothing useful, but R doesn’t prevent us from asking for it.
This should be a cautionary tale. You should always make sure that what
you are asking for is within the bounds of the vector you’re | working
with.

…

|==========================================================================================================================
| 62%  
| What if we’re interested in all elements of x EXCEPT the 2nd and 10th?
It would be pretty tedious to construct a vector containing all numbers
1 through 40 EXCEPT 2 and 10.

…

|===============================================================================================================================
| 64%  
| Luckily, R accepts negative integer indexes. Whereas x\[c(2, 10)\]
gives us ONLY the 2nd and 10th elements of x, x\[c(-2, -10)\] gives us
all elements of x EXCEPT for the 2nd and 10 elements. Try x\[c(-2, |
-10)\] now to see this.

**`> x[c(-2, -10)]`**  
`[1] NA NA NA NA NA -2.35294394 NA 1.05478316 NA 2.19479901
NA 0.64116999 0.20623727 -0.49344814 NA 0.71704513 0.94873512`  
`[18] 0.57226997 NA NA 0.20178478 0.56294471 NA NA 0.10530594
-2.29974032 NA NA NA -0.40221937 2.00367940 NA 0.25781492 NA`  
`[35] -0.08761389 1.07827730 NA NA`

All that practice is paying off\!

|====================================================================================================================================
| 67%  
| A shorthand way of specifying multiple negative numbers is to put the
negative sign out in front of the vector of positive numbers. Type
x\[-c(2, 10)\] to get the exact same result.

**`> x[-c(2, 10)]`**  
`[1] NA NA NA NA NA -2.35294394 NA 1.05478316 NA 2.19479901
NA 0.64116999 0.20623727 -0.49344814 NA 0.71704513 0.94873512`  
`[18] 0.57226997 NA NA 0.20178478 0.56294471 NA NA 0.10530594
-2.29974032 NA NA NA -0.40221937 2.00367940 NA 0.25781492 NA`  
`[35] -0.08761389 1.07827730 NA NA`

Perseverance, that’s the answer.

|=========================================================================================================================================
| 69%  
| So far, we’ve covered three types of index vectors – logical, positive
integer, and negative integer. The only remaining type requires us to
introduce the concept of ‘named’ elements.

…

|==============================================================================================================================================
| 72%  
| Create a numeric vector with three named elements using vect \<- c(foo
= 11, bar = 2, norf = NA).

`> vect <- c(foo = 11, bar = 2, norf = NA)`

You got it right\!

|===================================================================================================================================================
| 74%  
| When we print vect to the console, you’ll see that each element has a
name. Try it out.

`> vect`  
`foo bar norf`  
`11 2 NA`

Nice work\!

|========================================================================================================================================================
| 77%  
| We can also get the names of vect by passing vect as an argument to
the names() function. Give that a try.

**`> names(vect)`**  
`[1] "foo" "bar" "norf"`

You are doing so well\!

|=============================================================================================================================================================
| 79%  
| Alternatively, we can create an unnamed vector vect2 with c(11, 2,
NA). Do that now.

`> vect2 <- c(11, 2, NA)`

You are really on a roll\!

|==================================================================================================================================================================
| 82%  
| Then, we can add the `names` attribute to vect2 after the fact with
names(vect2) \<- c(“foo”, “bar”, “norf”). Go ahead.

**`> names(vect2) <- c("foo", "bar", "norf")`**

That’s correct\!

|========================================================================================================================================================================
| 85%  
| Now, let’s check that vect and vect2 are the same by passing them as
arguments to the identical() function.

**`> identical(vect, vect2)`**  
`[1] TRUE`

You got it right\!

|=============================================================================================================================================================================
| 87%  
| Indeed, vect and vect2 are identical named vectors.

…

|==================================================================================================================================================================================
| 90%  
| Now, back to the matter of subsetting a vector by named elements.
Which of the following commands do you think would give us the second
element of vect?

1: vect\[“2”\]  
2: vect\[bar\]  
3: vect\[“bar”\]

Selection: 3

You got it\!

|=======================================================================================================================================================================================
| 92%  
| Now, try it out.

`> vect["bar"]`  
`bar` `2`

All that practice is paying off\!

|============================================================================================================================================================================================
| 95%  
| Likewise, we can specify a vector of names with vect\[c(“foo”,
“bar”)\]. Try it out.

`> vect[c("foo", "bar")]`  
`foo bar`  
`11 2`

You’re the best\!

|=================================================================================================================================================================================================
| 97%  
| Now you know all four methods of subsetting data from vectors.
Different approaches are best in different scenarios and when in doubt,
try it out\!

…

|======================================================================================================================================================================================================|
100%  
| Would you like to receive credit for completing this course on
Coursera.org?

1: Yes 2: No

Selection:
