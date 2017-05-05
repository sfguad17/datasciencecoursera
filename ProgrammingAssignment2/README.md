### Introduction

This second programming assignment entails writing an R function that
will demonstrate caching for the inverse of a matrix.  Caching saves
compute time for situations where the computed result is used repeatedly
but does not change.  The benefit to caching increases for computes required on
large inputs.

The assignment will also make use of the '<<-' operator, which can be used to
assign a value to an object in an environment that is different from the
current environment. 

### Assignment: Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly (there are also alternatives to matrix inversion that we will
not discuss here). Your assignment is to write a pair of functions that
cache the inverse of a matrix.

Write the following functions:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

Computing the inverse of a square matrix can be done with the `solve`
function in R. For example, if `X` is a square invertible matrix, then
`solve(X)` returns its inverse.

For this assignment, assume that the matrix supplied is always
invertible.

### Examples: Example usage
#### 1.
m <- matrix(c(0, 2, 1, 5), nrow = 2, ncol = 2, byrow = TRUE)
mCM <- makeCacheMatrix(m)
cacheSolve(mCM)
cacheSolve(mCM)

#### 2.
a <- matrix(c(3,1,2,1),nrow=2,ncol=2)
b <- matrix(c(8,2),nrow=2,ncol=1)
aCM<- makeCacheMatrix(a)
cacheSolve(aCM,b)
cacheSolve(aCM,b)

#### 3.
x <- stats::rnorm(16)
dim(x) <- c(4,4)
xCM<-makeCacheMatrix(x)
cacheSolve(xCM)
cacheSolve(xCM)
