Practical R Exercises in Swirl
================

# 9: Functions

| | 0%

Functions are one of the fundamental building blocks of the R language.
They are small pieces of reusable code that  
can be treated like any other R object.

…

|== | 2%  
| If you’ve worked through any other part of this course, you’ve
probably used some functions already. Functions are | usually
characterized by the name of the function followed by parentheses.

…

|==== | 4%  
| Let’s try using a few basic functions just for fun. The Sys.Date()
function returns a string representing today’s | date. Type Sys.Date()
below and see what happens.

`> Sys.Date()`  
`[1] "2020-12-04"`

Perseverance, that’s the answer.

|======= | 6%  
| Most functions in R return a value. Functions like Sys.Date() return a
value based on your computer’s environment, | while other functions
manipulate input data in order to compute a return value.

…

|========= | 8%  
| The mean() function takes a vector of numbers as input, and returns
the average of all of the numbers in the input | vector. Inputs to
functions are often called arguments. Providing arguments to a function
is also sometimes called | passing arguments to that function. Arguments
you want to pass to a function go inside the function’s parentheses. |
Try passing the argument c(2, 4, 5) to the mean() function.

`> mean(c(2, 4, 5))`  
`[1] 3.666667`

You got it\!

|=========== | 10%  
| Functions usually take arguments which are variables that the function
operates on. For example, the mean() | function takes a vector as an
argument, like in the case of mean(c(2,6,8)). The mean() function then
adds up all of | the numbers in the vector and divides that sum by the
length of the vector.

…

|============= | 12%  
| In the following question you will be asked to modify a script that
will appear as soon as you move on from this | question. When you have
finished modifying the script, save your changes to the script and type
submit() and the | script will be evaluated. There will be some comments
in the script that opens up, so be sure to read them\!

…

`boring_function <- function(x) {`  
`x`  
`}`

…

|=============== | 14%  
| The last R expression to be evaluated in a function will become the
return value of that function. We want this | function to take one
argument, x, and return x without modifying it. Delete the pound sign so
that x is returned | without any modification. Make sure to save your
script before you type submit().

`> submit()`

Sourcing your script…

You are doing so well\!

|================== | 16%  
| Now that you’ve created your first function let’s test it\! Type:
boring\_function(‘My first function\!’). If your | function works, it
should just return the string: ‘My first function\!’

`> boring_function('My first function!')`  
`[1] "My first function!"`

That’s the answer I was looking for.

|==================== | 18%  
| Congratulations on writing your first function. By writing functions,
you can gain serious insight into how R | works. As John Chambers, the
creator of R once said: | | To understand computations in R, two slogans
are helpful: 1. Everything that exists is an object. 2. Everything |
that happens is a function call.

…

|====================== | 20%  
| If you want to see the source code for any function, just type the
function name without any arguments or | parentheses. Let’s try this out
with the function you just created. Type: boring\_function to view its
source code.

`> boring_function`  
`function(x) {`  
`x`  
`}`

All that practice is paying off\!

|======================== | 22%  
| Time to make a more useful function\! We’re going to replicate the
functionality of the mean() function by creating | a function called:
my\_mean(). Remember that to calculate the average of all of the numbers
in a vector you find the | sum of all the numbers in the vector, and
then divide that sum by the number of numbers in the vector.

…

|========================== | 24%  
| Make sure to save your script before you type submit().

`my_mean <- function(my_vector) {`  
`sum(my_vector) / length(my_vector)`  
`}`

`> submit()`

Sourcing your script…

Perseverance, that’s the answer.

|============================= | 27%  
| Now test out your my\_mean() function by finding the mean of the
vector c(4, 5, 10).

`> my_mean(c(4, 5, 10))`  
`[1] 6.333333`

Keep up the great work\!

|=============================== | 29%  
| Next, let’s try writing a function with default arguments. You can set
default values for a function’s arguments, | and this can be useful if
you think someone who uses your function will set a certain argument to
the same value | most of the time.

…

|================================= | 31%  
| Make sure to save your script before you type submit().

remainder \<- function(num, divisor = 2) { num %% divisor }

`> submit()`

Sourcing your script…

Excellent job\!

|=================================== | 33%  
| Let’s do some testing of the remainder function. Run remainder(5) and
see what happens.

`> remainder(5)`  
`[1] 1`

You are really on a roll\!

|===================================== | 35%  
| Let’s take a moment to examine what just happened. You provided one
argument to the function, and R matched that | argument to ‘num’ since
‘num’ is the first argument. The default value for ‘divisor’ is 2, so
the function used the | default value you provided.

…

|======================================== | 37%  
| Now let’s test the remainder function by providing two arguments.
Type: remainder(11, 5) and let’s see what | happens.

`> remainder(11, 5)`  
`[1] 1`

You are amazing\!

|========================================== | 39%  
| Once again, the arguments have been matched appropriately.

…

|============================================ | 41%  
| You can also explicitly specify arguments in a function. When you
explicitly designate argument values by name, the | ordering of the
arguments becomes unimportant. You can try this out by typing:
remainder(divisor = 11, num = 5).

`> remainder(divisor = 11, num = 5)`  
`[1] 5`

That’s the answer I was looking for.

|============================================== | 43%  
| As you can see, there is a significant difference between
remainder(11, 5) and remainder(divisor = 11, num = 5)\!

…

|================================================ | 45%  
| R can also partially match arguments. Try typing remainder(4, div = 2)
to see this feature in action.

`> remainder(4, div = 2)`  
`[1] 0`

You are amazing\!

|=================================================== | 47%  
| A word of warning: in general you want to make your code as easy to
understand as possible. Switching around the | orders of arguments by
specifying their names or only using partial argument names can be
confusing, so use these | features with caution\!

…

|===================================================== | 49%  
| With all of this talk about arguments, you may be wondering if there
is a way you can see a function’s arguments | (besides looking at the
documentation). Thankfully, you can use the args() function\! Type:
args(remainder) to | examine the arguments for the remainder function.

`> args(remainder)`  
`function (num, divisor = 2)`  
`NULL`

Keep working like that and you’ll get there\!

|======================================================= | 51%  
| You may not realize it but I just tricked you into doing something
pretty interesting\! args() is a function, | remainder() is a function,
yet remainder was an argument for args(). Yes it’s true: you can pass
functions as | arguments\! This is a very powerful concept. Let’s write
a script to see how it works.

…

|========================================================= | 53%  
| Make sure to save your script before you type submit().

`evaluate <- function(func, dat){`  
`func(dat)`  
`}`

`> submit()`

Sourcing your script…

Keep working like that and you’ll get there\!

|============================================================ | 55%  
| Let’s take your new evaluate() function for a spin\! Use evaluate to
find the standard deviation of the vector | c(1.4, 3.6, 7.9, 8.8).

`> evaluate(sd, c(1.4, 3.6, 7.9, 8.8))`  
`[1] 3.514138`

You are doing so well\!

|============================================================== | 57%  
| The idea of passing functions as arguments to other functions is an
important and fundamental concept in | programming.

…

|================================================================ |
59%  
| You may be surprised to learn that you can pass a function as an
argument without first defining the passed | function. Functions that
are not named are appropriately known as anonymous functions.

…

|================================================================== |
61%  
| Let’s use the evaluate function to explore how anonymous functions
work. For the first argument of the evaluate | function we’re going to
write a tiny function that fits on one line. In the second argument
we’ll pass some data to | the tiny anonymous function in the first
argument.

…

|==================================================================== |
63%  
| Type the following command and then we’ll discuss how it works:
evaluate(function(x){x+1}, 6)

`> evaluate(function(x){x+1}, 6)`  
`[1] 7`

Perseverance, that’s the answer.

|=======================================================================
| 65%  
| The first argument is a tiny anonymous function that takes one
argument `x` and returns `x+1`. We passed the number | 6 into this
function so the entire expression evaluates to 7.

…

|=========================================================================
| 67%  
| Try using evaluate() along with an anonymous function to return the
first element of the vector c(8, 4, 0). Your | anonymous function should
only take one argument which should be a variable `x`.

`> evaluate(function(x){x[1]}, c(8, 4, 0))`  
`[1] 8`

You nailed it\! Good job\!

|===========================================================================
| 69%  
| Now try using evaluate() along with an anonymous function to return
the last element of the vector c(8, 4, 0). Your | anonymous function
should only take one argument which should be a variable `x`.

`> evaluate(function(x){x[length(x)]}, c(8, 4, 0))`  
`[1] 0`

Excellent job\!

|=============================================================================
| 71%  
| For the rest of the course we’re going to use the paste() function
frequently. Type ?paste so we can take a look at | the documentation for
the paste function.

`> ?paste`

Keep up the great work\!

|===============================================================================
| 73%  
| As you can see the first argument of paste() is **`...`** which is
referred to as an ellipsis or simply dot-dot-dot. | **The ellipsis
allows an indefinite number of arguments to be passed into a function.**
In the case of paste() any | number of strings can be passed as
arguments and paste() will return all of the strings combined into one
string.

…

|==================================================================================
| 76%  
| Just to see how paste() works, type paste(“Programming”, “is”,
“fun\!”)

`> paste("Programming", "is", "fun!")`  
`[1] "Programming is fun!"`

You are quite good my friend\!

|====================================================================================
| 78%  
| Time to write our own modified version of paste().

…

|======================================================================================
| 80%  
| Make sure to save your script before you type submit().

`telegram <- function(...){`  
`paste("START", ..., "STOP")`  
`}`

`> submit()`

Sourcing your script…

You are quite good my friend\!

|========================================================================================
| 82%  
| Now let’s test out your telegram function. Use your new telegram
function passing in whatever arguments you wish\!

`> telegram("hello")`  
`[1] "START hello STOP"`

You’re the best\!

|==========================================================================================
| 84%  
| Make sure to save your script before you type submit().

`mad_libs <- function(...){`  
`args <- list(...)`

`place <- args[[1]]`  
`adjective <- args[[2]]`  
`noun <- args[[3]]`

`paste("News from", place, "today where", adjective, "students took to
the streets in protest of the new", noun, "being installed on
campus.")`  
`}`

`> submit()`

Sourcing your script…

Keep up the great work\!

|=============================================================================================
| 86%  
| Time to use your mad\_libs function. Make sure to name the place,
adjective, and noun arguments in order for your | function to work.

`> mad_libs("school", "fun", "learning")`  
`[1] "News from school today where fun students took to the streets in
protest of the new learning being installed on campus."`

Excellent work\!

|===============================================================================================
| 88%  
| We’re coming to the end of this lesson, but there’s still one more
idea you should be made aware of.

…

|=================================================================================================
| 90%  
| You’re familiar with adding, subtracting, multiplying, and dividing
numbers in R. To do this you use the +, -, \*, | and / symbols. These
symbols are called binary operators because they take two inputs, an
input from the left and | an input from the right.

…

|===================================================================================================
| 92%  
| In R you can define your own binary operators. In the next script I’ll
show you how.

…

|=====================================================================================================
| 94%  
| Make sure to save your script before you type submit().

`"%p%" <- function(left, right) {`  
`paste(left, right)`  
`}`

`> submit()`

Sourcing your script…

Excellent work\!

|========================================================================================================
| 96%  
| You made your own binary operator\! Let’s test it out. Paste together
the strings: ‘I’, ‘love’, ‘R\!’ using your new | binary operator.

`> "I" %p% "love" %p% "R!"`  
`[1] "I love R!"`

That’s a job well done\!

|==========================================================================================================
| 98%  
| We’ve come to the end of our lesson\! Go out there and write some
great functions\!

…

|============================================================================================================|
100%  
| Would you like to receive credit for completing this course on
Coursera.org?

1: Yes  
2: No

Selection:
