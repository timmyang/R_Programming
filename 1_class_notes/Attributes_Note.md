R Notebook
================

# Attributes (objects may have)

#### class

Vectors:

  - Atomic Vector: vectors consisted of only one class
      - Data Types:
          - **character:** `c("a", "swc")`  
          - **numeric** (real or decimal): `c(2, 15.5)`  
          - **integer:** `c(2L)` (the `L` tells R to store this as an
            integer  
          - **logical:** `c(TRUE, FALSE, NA)`  
          - **complex:** `c(1 + 4i)`
      - **Factors**: atomic vectors with “labels (= levels)”,
        `factor(c("yes", "no"))`  
      - **Matrix** (array): atomic vectors, `matrix(1:6, nrow = 2, ncol
        = 3)` with “dimension” attributes,
  - **List:** vectors consisted of multiple classes, `list(1, "a")`
      - **Data Frame:** every element = same “length”, but \!= same
        “type”, `data.frame(foo = 1:2, bar = c(T, F))` with
        “dimension” attributes

#### length

  - **Number of elements in a *vector*:**
      - atomic vector (= factors, matrix)
  - **Number of elements in a *list*:**
      - list (= data frame)

#### dim

  - **NULL**:
      - atomic vector (= factors)
      - list
  - **nrow**, **ncol:**
      - matrix (is an atomic vector with a “dimension” attribute)
      - data frame (can be converted to a matrix by calling
        `data.matrix()` - coerces objects to be the same class)

#### dimnames

  - **NULL**
      - atomic vector (= factors)
      - list
  - **list(rownames, colnames)**
      - matrix (if specified) `dimnames(m) <- list(c("row1", row2"),
        c("col1", "col2"))`
      - data frame

#### names

  - **Name of each element in a vector or a list**
      - atomic vector (= factors, matrix) (if specified) `names(vector)
        <- c("one", "two")`
      - list (if specified) `list(foo = 1, bar = "a")`  
      - data frame

#### levels

  - **NULL**
      - atomic vector (= matrix)
      - list (= data frame)
  - **labels**
      - factors (is an atomic vector with “labels (= levels)”)
