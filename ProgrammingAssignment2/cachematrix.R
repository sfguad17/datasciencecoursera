# ---------------------------------------------------------------------------
# Course:  Coursera Data Science - R Programming
# Date:    May 3, 2017
# Purpose: The purpose of Programming Assignment #2 is to write a pair of 
#          functions that cache the inverse of a matrix.  The functions to
#          be written are:
#          - "makeCacheMatrix" 
#          - "cacheSolve"
# ---------------------------------------------------------------------------

#
# Function makeCacheMatrix:  will create a special "matrix" object that can 
# cache its inverse
#
# Input:  a matrix
# Output: a "cached" matrix
#
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function(){
    return (x)
  }
  setInverse <- function(inMatrix) {
    m <<- inMatrix
  }
  getInverse <- function() {
    return (m)
  }
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

# 
# Function cacheSolve: will compute the inverse of the special "matrix" returned by 
# makeCacheMatrix above. If the inverse has already been calculated (and the 
# matrix has not changed), then cacheSolve should retrieve the inverse from 
# the cache.
#
# Inputs:  matrix
# Outputs: matrix that is the inverse of our input matrix
#
cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  
  if (!is.null(m)) {
    print("Have cached inverse matrix ...")
  }
  else { 
     # Get our matrix
     data <- x$get()
  
     # Compute the inverse and store
     m <- solve(data, ...)
     x$setInverse(m)
  }
  
  # Return our inverse matrix
  return (m)
}
